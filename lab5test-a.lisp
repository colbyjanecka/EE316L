
(in-package "ACL2")

(include-book "centaur/misc/memory-mgmt-logic" :dir :system)

(value-triple (set-max-mem (* 12 (expt 2 30))))

(include-book "centaur/sv/top" :dir :system) ;; a big book; takes around 30 seconds
(include-book "centaur/vl/loader/top" :dir :system) ;; takes around 10 seconds
(include-book "oslib/ls" :dir :system)

(include-book "centaur/svl/top" :dir :system)

(value-triple (set-max-mem (* 12 (expt 2 30))))

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


(defconst *rca/cla-in-pattern*
  '(("clk"       0 1 0     1 0 1 0 1 0     1)
    ("load"      0 0 1     0 0 1 0 0 1     0)
    ("Cin"       _ _ cin-1 _ _ _ _ _ cin-2 _)
    ("a"         _ _   a-1 _ _ _ _ _   a-2 _)
    ("b"         _ _   b-1 _ _ _ _ _   b-2 _)))

(defconst *rca/cla-out-pattern*
  '(("total" total0 total1 total2 total3 total4 total5 total6 total7 total8 total9)))

(SET-SLOW-ALIST-ACTION :WARNING)


(define to_vector (num size)
  :verify-guards nil
  :guard (and (natp size)
              (sv::4vec-p num))
  (if (zp size)
      ""
    (str::cat
     (to_vector (sv::4vec-rsh 1 num) (1- size))
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
  (progn
    (acl2::defconsts
     (*rca-vl* state)
     (b* (((mv loadresult state)
           (vl::vl-load (vl::make-vl-loadconfig
                         :start-files '("rca.v" "loadreg.v" "adder.v")))))
       (mv (vl::vl-loadresult->design loadresult) state)))

    (acl2::defconsts
     (*rca-sv*
      *rca-simplified-good*
      *rca-simplified-bad*)
     (b* (((mv errmsg sv-design good bad)
           (vl::vl-design->sv-design "rca"
                                     *rca-vl* (vl::make-vl-simpconfig))))
       (and errmsg
            (acl2::raise "~@0~%" errmsg))
       (mv sv-design good bad))))

  (acl2::defconsts (*rca-svl* rp::rp-state)
                   (svl::svl-flatten-design *rca-sv*
                                            *rca-vl*
                                            :dont-flatten :all))


  (sv::defsvtv rca-svtv
               :design *rca-sv*
               :inputs *rca/cla-in-pattern*
               :outputs *rca/cla-out-pattern*)

  (value-triple "Testing the RCA module... ")
  
  (gl::gl-thm
   lab5-parta-test
   :hyp
   (and
    (unsigned-byte-p 1 cin-1)
    (unsigned-byte-p 1 cin-2)
    (unsigned-byte-p 4 a-1)
    (unsigned-byte-p 4 a-2)
    (unsigned-byte-p 4 b-1)
    (unsigned-byte-p 4 b-2))
   :concl
   (b* (((acl2::assocs total0 total1 total2 total3 total4 total5 total6 total7
                       total8 total9)
         (sv::svtv-run *rca-svtv*
                       (make-fast-alist
                        `((cin-1 . ,cin-1)
                          (cin-2 . ,cin-2)
                          (a-1 . ,a-1)
                          (a-2 . ,a-2)
                          (b-1 . ,b-1)
                          (b-2 . ,b-2)))
                       :quiet t)
                       
         #|(svl::svl-run "rca"
                  (make-fast-alist
                   `((cin-1 . ,cin-1)
                     (cin-2 . ,cin-2)
                     (a-1 . ,a-1)
                     (a-2 . ,a-2)
                     (b-1 . ,b-1)
                     (b-2 . ,b-2)))
                  *rca/cla-in-pattern*
                  *rca/cla-out-pattern*
                  *rca-svl*)||#))
     (or
      (and (equal total0 '(31 . 0))
           (equal total1 '(31 . 0))
           (equal total2 '(31 . 0))
           (equal total3 (+ cin-1 a-1 b-1))
           (equal total4 total3)
           (equal total5 total3)
           (equal total6 total3)
           (equal total7 total3)
           (equal total8 total3)
           (equal total9 (+ cin-2 a-2 b-2)))
      (progn$
        (cw "~% Below are the expected outputs with these counterexamples:
~p0 ~%"
          `((total0 ,(to_vector '(31 . 0) 5))
            (total1 ,(to_vector '(31 . 0) 5))
            (total2 ,(to_vector '(31 . 0) 5))
            (total3 ,(to_vector (+ cin-1 a-1 b-1) 5))
            (total4 ,(to_vector (+ cin-1 a-1 b-1) 5))
            (total5 ,(to_vector (+ cin-1 a-1 b-1) 5))
            (total6 ,(to_vector (+ cin-1 a-1 b-1) 5))
            (total7 ,(to_vector (+ cin-1 a-1 b-1) 5))
            (total8 ,(to_vector (+ cin-1 a-1 b-1) 5))
            (total9 ,(to_vector (+ cin-2 a-2 b-2) 5))))
        (cw "~% Below are the outputs from your design with these counterexamples:
~p0 ~%"
          `((total0 ,(to_vector total0 5))
            (total1 ,(to_vector total1 5))
            (total2 ,(to_vector total2 5))
            (total3 ,(to_vector total3 5))
            (total4 ,(to_vector total4 5))
            (total5 ,(to_vector total5 5))
            (total6 ,(to_vector total6 5))
            (total7 ,(to_vector total7 5))
            (total8 ,(to_vector total8 5))
            (total9 ,(to_vector total9 5))))
        (cw "These two lists should match! Refer back to the Verification of ~
Lab 5 document to debug your design. ~%~%")
        nil)))

; :cov-hints ('(:in-theory (e/d nil (booleanp))))
   :test-side-goals nil
   :g-bindings
   `((cin-1 ,(gl::g-int 0 1 2))
     (cin-2 ,(gl::g-int 2 1 2))
     (a-1 ,(gl::g-int 8 8 5))
     (a-2 ,(gl::g-int 9 8 5))
     (b-1 ,(gl::g-int 10 8 5))
     (b-2 ,(gl::g-int 11 8 5)))))
