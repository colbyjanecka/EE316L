
;; Mertcan Temel
;; Prepared for EE316 2020 Spring for Lab4
;; Test if the output creates the correct clock signals.

(in-package "ACL2")

(include-book "centaur/misc/memory-mgmt-logic" :dir :system)

(value-triple (set-max-mem (* 12 (expt 2 30))))

(include-book "centaur/sv/top" :dir :system) ;; a big book; takes around 30 seconds
(include-book "centaur/vl/loader/top" :dir :system) ;; takes around 10 seconds
(include-book "oslib/ls" :dir :system)

(include-book "centaur/svl/top" :dir :system)

(value-triple (set-max-mem (* 12 (expt 2 30))))

#!SVL
(progn
  (acl2::defconsts
   (*vl-design* state)
   (b* (((mv loadresult state)
         (vl::vl-load (vl::make-vl-loadconfig
                       :start-files '("clks.v")))))
     (mv (vl::vl-loadresult->design loadresult) state)))

  (acl2::defconsts
   (*sv-design*
    *simplified-good*
    *simplified-bad*)
   (b* (((mv errmsg sv-design good bad)
         (vl::vl-design->sv-design "clks"
                                   *vl-design* (vl::make-vl-simpconfig))))
     (and errmsg
          (acl2::raise "~@0~%" errmsg))
     (mv sv-design good bad))))

#!SVL
(acl2::defconsts (*svl-design* rp::rp-state)
                 (svl::svl-flatten-design *sv-design*
                                          *vl-design*
                                          :dont-flatten nil))

#!SVL
(defstobj part-a
  (counter :type (array (unsigned-byte 59) (16))
           :initially 0)
  (last-duration :type (array (unsigned-byte 59) (16))
                 :initially 0)
  (duration-saved-cnt :type (array (unsigned-byte 59) (16))
                      :initially 0)
  (last-output :type (unsigned-byte 59) :initially 0))

#!SVL
(progn
  (define update-part-a (output
                         part-a
                         i)
    :mode :program

    (if (zp i)
        part-a
      (b* ((i (1- i))
           (cur (acl2::logbit i output))
           (duration (counteri i part-a))
           (last (acl2::logbit i (last-output part-a)))
           (duration (1+ duration))
           (part-a (update-counteri i duration part-a))
           ((when (or (eql cur 0)
                      (eql last 1)))
            (update-part-a output part-a i))
           (last-duration (last-durationi i part-a))
           (duration-saved-cnt (duration-saved-cnti i part-a))
           ((when (and (not (eql last-duration 0))
                       (> duration-saved-cnt 2)
                       (not (eql last-duration duration))))
            (progn$
             (hard-error
              'simulate-part-a
              "One of the output bits (index ~p0) does not seem to have the same ~
wavelength between different rising-edges ~%"
              (list (cons #\0 i)))
             (update-part-a output part-a i)))
           (part-a (update-last-durationi i duration part-a))

;(- (cw "duration-saved-cnt ~p0 ~%" duration-saved-cnt))
           (part-a (update-duration-saved-cnti i (1+ duration-saved-cnt)
                                               part-a))
           (part-a (update-counteri i 0 part-a)))
        (update-part-a output part-a i))))

  (define zero-out-wires (wires)
    :mode :program
    (if (atom wires)
        wires
      (acons (caar wires)
             0
             (zero-out-wires (cdr wires)))))

  (mutual-recursion
   (defun zero-out-svl-env (env)
     (declare (xargs :mode :program))
     (b* ((wires (svl-env->wires env))
          (modules (svl-env->modules env)))
       (make-svl-env :wires (zero-out-wires wires)
                     :modules (zero-out-svl-env-alist modules))))
   (defun zero-out-svl-env-alist (alist)
     (if (atom alist)
         nil
       (acons (caar alist)
              (zero-out-svl-env (cdar alist))
              (zero-out-svl-env-alist (cdr alist))))))

  (defconst *steps*
    (* 3 (expt 10 6)))

  (unmemoize 'svex-eval)

  (define simulate-part-a-aux (&key
                               (part-a 'part-a)
                               (steps '*steps*)
                               (delayed-env ''(nil nil)))
    :mode :program
    (cond
     ((zp steps)
      (mv part-a delayed-env))
     (t (b* (#|((mv & delayed-env)
              (svl-run-phase "clks"
                                 (list 0)
                                 delayed-env
                                 svl::*svl-design*))||#
             #|(delayed-env (if (eql steps *steps*)
                              (zero-out-svl-env delayed-env)
                            delayed-env))||#

             (delayed-env (change-svl-env delayed-env
                                          :wires
                                          (acons '(:VAR "clk" . 1) 0
                                                 (svl-env->wires delayed-env))))
             #|(- (cw "delayed-env ~p0 ~%" delayed-env))||#
             ((mv output delayed-env)
              (svl-run-phase "clks"
                                 (list 1)
                                 delayed-env
                                 svl::*svl-design*))
             (delayed-env (if (eql steps *steps*)
                              (zero-out-svl-env delayed-env)
                            delayed-env))
             #|(- (cw "output ~p0 ~%" output))||#
            #| (- (cw "delayed-env ~p0 ~%" delayed-env))||#
             (output (car output))
             ((unless (and (integerp output)))
              (if (eql steps *steps*)
                  (simulate-part-a-aux :steps (1- steps)
                                       :delayed-env delayed-env)
                (progn$
                 (cw "Got some don't care terms for the output.. ~%")
                 (cw "Steps ~p0 ~%" steps)
                 (mv part-a delayed-env))))
             (part-a (update-part-a output part-a 16))
             (part-a (update-last-output output part-a)))
          (simulate-part-a-aux :steps (1- steps)
                               :delayed-env delayed-env)))))

  (define calculate-freqs (part-a i)
    :mode :program
    (if (zp i)
        nil
      (b* ((i (1- i))
           (duration (last-durationi i part-a))

           (freq (if (> duration 0)
                     (floor (expt 10 8)
                            duration)
                   -1)))
        (cons freq
              (calculate-freqs part-a i)))))

  (define simulate-part-a ()
    :mode :program
    (with-local-stobj
      part-a
      (mv-let (result part-a)
        (b* (((mv part-a &) (simulate-part-a-aux))
             (freqs (calculate-freqs part-a 16)))
          (mv freqs part-a))
        result))))

(defconst *target-freqs*
  (reverse
   '(10000
     100000
     1000000
     10000000
     24400
     48800
     97700
     195000
     390000
     780000
     1560000
     3130000
     6250000
     12500000
     25000000
     50000000)))

(define check-results (results target)
  :mode :program
  (if (atom results)
      (cw "All correct! ~%")
    (b* ((cur-res (car results))

         ((when (equal cur-res -1))
          (hard-error
           'check-results
           "Problem calculating the clock frequency for output index ~
          ~p0. ~% "
           (list (cons #\0 (- 16 (len results))))))

         (cur-tar (car target))
         (diff (* 100 (abs (- cur-res cur-tar))))
         (diff-per (ceiling diff cur-res))
         ((when (> diff-per 1))
          (hard-error
           'check-results
           "Calculated clock frequency for led[~p0] is not correct. ~
Target frequency: ~p1, and calculated frequency ~p2. ~%
The remaining target frequencies are: ~p3 ~%
The remaining calculated frequencies are: ~p4 ~% "
           (list (cons #\0 (- 16 (len results)))
                 (cons #\1 cur-tar)
                 (cons #\2 cur-res)
                 (cons #\3 target)
                 (cons #\4 results)))))
      (check-results (cdr results) (cdr target)))))

(value-triple "============================================================")
(value-triple "============================================================")
(value-triple "============================================================")
(value-triple "============================================================")
(value-triple "EE 316 Students! See the output below:") 
(value-triple "============================================================")

(value-triple "Note: This program assumes that you are using positive rising edge of the ~
input clock.")

(value-triple "Calculating Results...")

(make-event
 `(defconst *results*
    ',(reverse (time$ (svl::simulate-part-a)))))

(value-triple "Printing Results... ~%")

(value-triple (cw "Calculated frequencies (Hz) from your design are ~p0~%" *results*))
(value-triple (cw "Target frequencies (Hz) that your design should implement are ~p0 ~%" *target-freqs*))

(value-triple "Comparing these two lists...")
(value-triple (check-results *results* *target-freqs*))


(value-triple "End of test results.")
(value-triple "============================================================")
(value-triple "============================================================")
