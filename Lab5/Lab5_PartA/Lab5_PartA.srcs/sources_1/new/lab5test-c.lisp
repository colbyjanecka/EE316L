
(in-package "ACL2")

(include-book "centaur/misc/memory-mgmt-logic" :dir :system)

(value-triple (set-max-mem (* 12 (expt 2 30))))

(include-book "centaur/sv/top" :dir :system) ;; a big book; takes around 30 seconds
(include-book "centaur/vl/loader/top" :dir :system) ;; takes around 10 seconds
(include-book "oslib/ls" :dir :system)

(include-book "centaur/svl/top" :dir :system)

(value-triple (set-max-mem (* 12 (expt 2 30))))

;; #!SVL
;; (defconst *rca-in-pattern*
;;   '(("a" a)
;;     ("b" b)
;;     ("Cin" cin)))

;; #!SVL
;; (defconst *rca-out-pattern*
;;   '(("total" total)))

;; (defwarrant make-fast-alist)

;; #!SVL
;; (define adder-test-cases ()
;;   :mode :program
;;   (b* ((x (loop$ for i from 0 to 15 collect
;;                  (loop$ for j from 0 to 15 collect
;;                         (loop$ for k from 0 to 1 collect
;;                                (cons (make-fast-alist
;;                                       `((a . ,i)
;;                                         (b . ,j)
;;                                         (cin . ,k)))
;;                                      (+ i j k)))))))
;;     x))

;; #!SVL
;; (define append-elements (lst)
;;   :mode :program
;;   (if (atom lst)
;;       lst
;;     (append (car lst)
;;             (append-elements (cdr lst)))))

;; #!SVL
;; (define test-cases-flatten ()
;;   :mode :program
;;   (append-elements
;;    (append-elements
;;     (adder-test-cases))))

;; (progn
;;   #!SVL
;;   (progn
;;     (acl2::defconsts
;;      (*rca-vl* state)
;;      (b* (((mv loadresult state)
;;            (vl::vl-load (vl::make-vl-loadconfig
;;                          :start-files '("rca.v" "adder.v")))))
;;        (mv (vl::vl-loadresult->design loadresult) state)))

;;     (acl2::defconsts
;;      (*rca-sv*
;;       *rca-simplified-good*
;;       *rca-simplified-bad*)
;;      (b* (((mv errmsg sv-design good bad)
;;            (vl::vl-design->sv-design "rca"
;;                                      *rca-vl* (vl::make-vl-simpconfig))))
;;        (and errmsg
;;             (acl2::raise "~@0~%" errmsg))
;;        (mv sv-design good bad))))

;;   #!SVL
;;   (acl2::defconsts (*rca-svl* rp::rp-state)
;;                    (svl::svl-flatten-design *rca-sv*
;;                                             *rca-vl*
;;                                             :dont-flatten nil))

;;   (progn
;;     #!SVL
;;     (define test-rca-aux (test-cases)
;;       :mode :program
;;       (if (atom test-cases)
;;           0
;;         (b* ((out-alist (svl::Svl-run "rca"
;;                                       (make-fast-alist (caar test-cases))
;;                                       *rca-in-pattern*
;;                                       *rca-out-pattern*
;;                                       *rca-svl*))
;;              (res (cdr (assoc-equal 'total out-alist)))
;;              (res
;;               (if (equal res (cdar test-cases))
;;                   0
;;                 (progn$
;;                  (cw "Output is not correct for ~p0 ~%" (caar test-cases))
;;                  1))))
;;           (+ res (test-rca-aux (cdr test-cases))))))

;;     #!SVL
;;     (define test-rca ()
;;       :mode :program
;;       (b* ((test-cases (test-cases-flatten))
;;            (x (test-rca-aux test-cases))
;;            (- (and (> x 0)
;;                    (hard-error
;;                     'test-rca
;;                     "Your RCA adder module is not correct. It  failed for ~p0 ~
;; test cases. See above for generated counter-examples. ~%"
;;                     (list (cons #\0 x))))))
;;         (progn$
;;          (cw "RCA module is correct!")
;;          x))))


;;   (value-triple "Testing the RCA module... ")

;;   (value-triple (svl::test-rca)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (progn
;;   (value-triple "Loading CLA module.. ")
;;   #!SVL
;;   (progn
;;     (acl2::defconsts
;;      (*cla-vl* state)
;;      (b* (((mv loadresult state)
;;            (vl::vl-load (vl::make-vl-loadconfig
;;                          :start-files '("cla.v" "adder.v")))))
;;        (mv (vl::vl-loadresult->design loadresult) state)))

;;     (acl2::defconsts
;;      (*cla-sv*
;;       *cla-simplified-good*
;;       *cla-simplified-bad*)
;;      (b* (((mv errmsg sv-design good bad)
;;            (vl::vl-design->sv-design "cla"
;;                                      *cla-vl* (vl::make-vl-simpconfig))))
;;        (and errmsg
;;             (acl2::raise "~@0~%" errmsg))
;;        (mv sv-design good bad))))

;;   #!SVL
;;   (acl2::defconsts (*cla-svl* rp::rp-state)
;;                    (svl::svl-flatten-design *cla-sv*
;;                                             *cla-vl*
;;                                             :dont-flatten nil))

;;   (progn
;;     #!SVL
;;     (define test-cla-aux (test-cases)
;;       :mode :program
;;       (if (atom test-cases)
;;           0
;;         (b* ((out-alist (svl::Svl-run "cla"
;;                                       (make-fast-alist (caar test-cases))
;;                                       *rca-in-pattern*
;;                                       *rca-out-pattern*
;;                                       *cla-svl*))
;;              (res (cdr (assoc-equal 'total out-alist)))
;;              (res
;;               (if (equal res (cdar test-cases))
;;                   0
;;                 (progn$
;;                  (cw "Output is not correct for ~p0 ~%" (caar test-cases))
;;                  1))))
;;           (+ res (test-cla-aux (cdr test-cases))))))

;;     #!SVL
;;     (define test-cla ()
;;       :mode :program
;;       (b* ((test-cases (test-cases-flatten))
;;            (x (test-cla-aux test-cases))
;;            (- (and (> x 0)
;;                    (hard-error
;;                     'test-cla
;;                     "Your CLA adder module is not correct. It  failed for ~p0 ~
;; test cases. See above for generated counter-examples. ~%"
;;                     (list (cons #\0 x))))))
;;         (progn$
;;          (cw "CLA module is correct!")
;;          x))))

;;   (value-triple "Testing the CLA module... ")

;;   (value-triple (svl::test-cla)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (include-book "centaur/gl/gl" :dir :system)
  (local (include-book "centaur/misc/memory-mgmt" :dir :system))
  (set-slow-alist-action :break)
  (local (value-triple (hons-resize :addr-ht 2200000 :sbits 2200000)))
  (local (value-triple (acl2::set-max-mem (* 50 (expt 2 30)))))
  (include-book "centaur/gl/bfr-satlink" :dir :system)
  (local (progn (defun my-satlink-config ()
                  (declare (xargs :guard t))
                  (satlink::make-config :cmdline "glucose -model"
                                        :verbose t
                                        :mintime 1))
                (defattach gl::gl-satlink-config
                  my-satlink-config)))
  (local (gl::gl-satlink-mode))
  (value-triple (tshell-start)))

(value-triple "Loading datapath.v ...")


(progn
  (acl2::defconsts
   (*datapath-vl* state)
   (b* (((mv loadresult state)
         (vl::vl-load (vl::make-vl-loadconfig
                       :start-files '("datapath.v"
                                      "loadreg.v"
                                      "cla.v"
                                      "rca.v"
                                      "adder.v")))))
     (mv (vl::vl-loadresult->design loadresult) state)))

  (acl2::defconsts
   (*datapath-sv*
    *datapath-simplified-good*
    *datapath-simplified-bad*)
   (b* (((mv errmsg sv-design good bad)
         (vl::vl-design->sv-design "datapath"
                                   *datapath-vl* (vl::make-vl-simpconfig))))
     (and errmsg
          (acl2::raise "~@0~%" errmsg))
     (mv sv-design good bad)))

  
  (acl2::defconsts (*datapath-svl* rp::rp-state)
                   (svl::svl-flatten-design *datapath-sv*
                                            *datapath-vl*
                                            :dont-flatten :all)))

(define to_vector (num size)
  :verify-guards nil
  :guard (and (natp size)
              (sv::4vec-p num))
  (if (zp size)
      ""
    (str::cat
     (to_vector (sv::4vec-rsh 1 num) (1- size))
     (if (and (equal (mod (1- size) 4) 0)
              (not (equal size 1)))
         "_" "")
     (b* ((val (sv::4vec-part-select 0 1 num)))
       (cond ((equal val 1)
              "1")
             ((equal val 0)
              "0")
             ((equal val (sv::4vec-part-select 0 1 (sv::4vec-x)))
              "X")
             ((equal val (sv::4vec-part-select 0 1 (sv::4vec-z)))
              "Z")
             (t "?"))))))

(progn
  
  (defconst *datapath-in-pattern*
    '(("clk"       0 1 0     1 0 1 0 1 0     1)
      ("load"      0 0 1     0 0 1 0 0 1     0)
      ("sel"       _ _ sel-1 sel-2 sel-3 sel-4 sel-5 sel-6 sel-7 sel-8)
      ("Cin"       _ _ cin-1 _ _ _ _ _ cin-2 _)
      ("sw[3:0]"   _ _ sw0-1 _ _ _ _ _ sw0-2 _)
      ("sw[7:4]"   _ _ sw1-1 _ _ _ _ _ sw1-2 _)
      ("sw[11:8]"  _ _ sw2-1 _ _ _ _ _ sw2-2 _)
      ("sw[15:12]" _ _ sw3-1 _ _ _ _ _ sw3-2 _)))

  (defconst *datapath-our-pattern*
    '(("led[15:0]" led0 led1 led2 led3 led4 led5 led6 led7 led8 led9))))


(sv::defsvtv datapath-svtv
               :design *datapath-sv*
               :inputs *datapath-in-pattern*
               :outputs *datapath-our-pattern*)

(SET-SLOW-ALIST-ACTION :WARNING)

(gl::gl-thm
 lab5-partc-test
 :hyp
 (and
  (unsigned-byte-p 1 cin-1)
  (unsigned-byte-p 1 cin-2)
  (unsigned-byte-p 4 sw0-1)
  (unsigned-byte-p 4 sw0-2)
  (unsigned-byte-p 4 sw1-1)
  (unsigned-byte-p 4 sw1-2)
  (unsigned-byte-p 4 sw2-1)
  (unsigned-byte-p 4 sw2-2)
  (unsigned-byte-p 4 sw3-1)
  (unsigned-byte-p 4 sw3-2)
  (unsigned-byte-p 1 sel-1)
  (unsigned-byte-p 1 sel-2)
  (unsigned-byte-p 1 sel-3)
  (unsigned-byte-p 1 sel-4)
  (unsigned-byte-p 1 sel-5)
  (unsigned-byte-p 1 sel-6)
  (unsigned-byte-p 1 sel-7)
  (unsigned-byte-p 1 sel-8))
 :concl

 (b* (((acl2::assocs ?led0 ?led1 ?led2 led3 led4 led5 led6 led7 led8 led9)
       (sv::svtv-run *datapath-svtv*
                       (make-fast-alist
                 `((cin-1 . ,cin-1)
                   (sel-1 . ,sel-1)
                   (sel-2 . ,sel-2)
                   (sel-3 . ,sel-3)
                   (sel-4 . ,sel-4)
                   (sel-5 . ,sel-5)
                   (sel-6 . ,sel-6)
                   (sel-7 . ,sel-7)
                   (sel-8 . ,sel-8)
                   (cin-2 . ,cin-2)
                   (sw0-1 . ,sw0-1)
                   (sw0-2 . ,sw0-2)
                   (sw1-1 . ,sw1-1)
                   (sw1-2 . ,sw1-2)
                   (sw2-1 . ,sw2-1)
                   (sw2-2 . ,sw2-2)
                   (sw3-1 . ,sw3-1)
                   (sw3-2 . ,sw3-2)))
                       :quiet t)
       #|(svl::svl-run "datapath"
                (make-fast-alist
                 `((cin-1 . ,cin-1)
                   (sel-1 . ,sel-1)
                   (sel-2 . ,sel-2)
                   (sel-3 . ,sel-3)
                   (sel-4 . ,sel-4)
                   (sel-5 . ,sel-5)
                   (sel-6 . ,sel-6)
                   (sel-7 . ,sel-7)
                   (sel-8 . ,sel-8)
                   (cin-2 . ,cin-2)
                   (sw0-1 . ,sw0-1)
                   (sw0-2 . ,sw0-2)
                   (sw1-1 . ,sw1-1)
                   (sw1-2 . ,sw1-2)
                   (sw2-1 . ,sw2-1)
                   (sw2-2 . ,sw2-2)
                   (sw3-1 . ,sw3-1)
                   (sw3-2 . ,sw3-2)))
                *datapath-in-pattern*
                *datapath-our-pattern*
                *datapath-svl*)||#))
   (or
    ;; sync sel:
    (and (if (equal sel-1 1)
             (equal led3 (sv::4vec-concat 8 0 (+ cin-1 sw2-1 sw3-1)))
           (equal led3 (+ cin-1 sw0-1 sw1-1)))
         (equal led4 led3)
         (equal led5 led3)
         (equal led6 led3)
         (equal led7 led3)
         (equal led8 led3)
         (if (equal sel-7 1)
             (equal led9 (sv::4vec-concat 8 0 (+ cin-2 sw2-2 sw3-2)))
           (equal led9 (+ cin-2 sw0-2 sw1-2))))

    ;; async sel:
    (b* ((rca-sum1 (sv::4vec-concat 8 0 (+ cin-1 sw2-1 sw3-1)))
         (cla-sum1 (+ cin-1 sw0-1 sw1-1))
         (rca-sum2 (sv::4vec-concat 8 0 (+ cin-2 sw2-2 sw3-2)))
         (cla-sum2  (+ cin-2 sw0-2 sw1-2)))
      (and (equal led3 (if (equal sel-2 1) rca-sum1 cla-sum1))
           (equal led4 (if (equal sel-3 1) rca-sum1 cla-sum1))
           (equal led5 (if (equal sel-4 1) rca-sum1 cla-sum1))
           (equal led6 (if (equal sel-5 1) rca-sum1 cla-sum1))
           (equal led7 (if (equal sel-6 1) rca-sum1 cla-sum1))
           (equal led8 (if (equal sel-7 1) rca-sum1 cla-sum1))
           (equal led9 (if (equal sel-8 1) rca-sum2 cla-sum2))))

    (b* ((rca-sum1 (sv::4vec-concat 8 0 (+ cin-1 sw2-1 sw3-1)))
         (cla-sum1 (+ cin-1 sw0-1 sw1-1))
         (rca-sum2 (sv::4vec-concat 8 0 (+ cin-2 sw2-2 sw3-2)))
         (cla-sum2  (+ cin-2 sw0-2 sw1-2)))
    (progn$
        (cw "~% Below are the expected outputs with these counterexamples:
~p0 ~%"
          `((leds3 ,(to_vector (if (equal sel-2 1) rca-sum1 cla-sum1) 16))
            (leds4 ,(to_vector (if (equal sel-3 1) rca-sum1 cla-sum1) 16))
            (leds5 ,(to_vector (if (equal sel-4 1) rca-sum1 cla-sum1) 16))
            (leds6 ,(to_vector (if (equal sel-5 1) rca-sum1 cla-sum1) 16))
            (leds7 ,(to_vector (if (equal sel-6 1) rca-sum1 cla-sum1) 16))
            (leds8 ,(to_vector (if (equal sel-7 1) rca-sum1 cla-sum1) 16))
            (leds9 ,(to_vector (if (equal sel-8 1) rca-sum2 cla-sum2) 16))))
        (cw "~% Below are the outputs from your design with these counterexamples:
~p0 ~%"
          `((leds3 ,(to_vector led3 16))
            (leds4 ,(to_vector led4 16))
            (leds5 ,(to_vector led5 16))
            (leds6 ,(to_vector led6 16))
            (leds7 ,(to_vector led7 16))
            (leds8 ,(to_vector led8 16))
            (leds9 ,(to_vector led9 16))))
        (cw "These two lists should match! Refer back to the Verification of ~
Lab 5 document to debug your design. ~%~%")
        nil)
    )))

 :test-side-goals nil
 :g-bindings
 `((cin-1 ,(gl::g-int 0 1 2))
   (cin-2 ,(gl::g-int 2 1 2))
   (sel-1 ,(gl::g-int 4 1 2))
   (sel-2 ,(gl::g-int 6 1 2))
   (sel-3 ,(gl::g-int 8 1 2))
   (sel-4 ,(gl::g-int 10 1 2))
   (sel-5 ,(gl::g-int 12 1 2))
   (sel-6 ,(gl::g-int 14 1 2))
   (sel-7 ,(gl::g-int 16 1 2))
   (sel-8 ,(gl::g-int 18 1 2))

   (sw0-1 ,(gl::g-int 20 8 5))
   (sw0-2 ,(gl::g-int 21 8 5))
   (sw1-1 ,(gl::g-int 22 8 5))
   (sw1-2 ,(gl::g-int 23 8 5))
   (sw2-1 ,(gl::g-int 24 8 5))
   (sw2-2 ,(gl::g-int 25 8 5))
   (sw3-1 ,(gl::g-int 26 8 5))
   (sw3-2 ,(gl::g-int 27 8 5))))
