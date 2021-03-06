(acl2::value :q)
(acl2::in-package "ACL2")
; see github issue #638 (waterfall-parallelism and profiling): 
#+(and hons (not acl2-par)) (profile-fn 'prove)
#+(and hons (not acl2-par)) (profile-fn 'certify-book-fn)
(acl2::lp)
(set-debugger-enable :bt)
(acl2::in-package "ACL2")

(set-ld-error-action (quote (:exit 1)) state)
(set-inhibit-output-lst (list (quote prove) (quote proof-tree) (quote warning) (quote observation) (quote event) (quote history)))

(acl2::assign acl2::get-internal-time-as-realtime acl2::t)
#-cmucl (acl2::gc-verbose t)
; instructions from .acl2 file cert.acl2:
;; cert-flags: ? t :ttags :all :skip-proofs-okp t


; Prevent reset-prehistory while loading .port files
(acl2::assign acl2::skip-reset-prehistory acl2::t)
; portculli for included books:
(acl2::ld "centaur/misc/memory-mgmt-logic.port" :dir :SYSTEM :ld-missing-input-ok t)
(acl2::ld "centaur/sv/top.port" :dir :SYSTEM :ld-missing-input-ok t)
(acl2::ld "centaur/vl/loader/top.port" :dir :SYSTEM :ld-missing-input-ok t)
(acl2::ld "oslib/ls.port" :dir :SYSTEM :ld-missing-input-ok t)
(acl2::ld "centaur/svl/top.port" :dir :SYSTEM :ld-missing-input-ok t)
#!ACL2 (set-ld-error-action (quote :continue) state)

; certify-book command flags: ? t :ttags :all :skip-proofs-okp t
#!ACL2 (er-progn (time$ (certify-book "lab4-parta-test" ? t :ttags :all :skip-proofs-okp t  ))
                                 (value (prog2$ #+hons (memsum)
                                                 #-hons nil
                                                 (exit 43))))
