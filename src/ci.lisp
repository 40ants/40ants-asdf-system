(defpackage #:40ants-asdf-system/ci
  (:use #:cl)
  (:import-from #:40ants-ci/workflow
                #:defworkflow)
  (:import-from #:40ants-ci/jobs/linter
                #:linter)
  (:import-from #:40ants-ci/jobs/run-tests
                #:run-tests)
  (:import-from #:40ants-ci/jobs/docs
                #:build-docs))
(in-package #:40ants-asdf-system/ci)

(defvar *lisp-implementations*
  (list "sbcl-bin"
        "ccl-bin/1.12.1"
        "abcl-bin"
        "allegro"
        "clasp"
        ;; This CL implementation does not work in any matrix combinations
        ;; "cmu-bin"
        "lispworks"
        "mkcl"
        "npt"
        "ecl") )


(defworkflow ci
  :on-push-to "master"
  :by-cron "0 10 * * 1"
  :on-pull-request t
  :cache t
  :jobs ((linter :asdf-systems ("40ants-asdf-system-docs"
                                "40ants-asdf-system-tests")
                 :check-imports t)
         (run-tests
          :os ("ubuntu-latest"
               "macos-latest")
          :quicklisp ("ultralisp"
                      "quicklisp")
          :lisp *lisp-implementations*
          :exclude (append
                    ;; These combinations are failed for some reason:
                    '((:os "ubuntu-latest" :quicklisp "ultralisp" :lisp "npt")
                      (:os "ubuntu-latest" :quicklisp "quicklisp" :lisp "npt"))
                    ;; All implementations except SBCL and NPT we'll check only on Linux
                    ;; and Ultralisp dist.     
                    (loop for lisp in *lisp-implementations*
                          unless (or (string-equal lisp "sbcl-bin")
                                     (string-equal lisp "npt"))
                            append (list (list :os "ubuntu-latest"
                                               :quicklisp "quicklisp"
                                               :lisp lisp)
                                         (list :os "macos-latest"
                                               :quicklisp "quicklisp"
                                               :lisp lisp)
                                         (list :os "macos-latest"
                                               :quicklisp "ultralisp"
                                               :lisp lisp))))
          :coverage t)))


(defworkflow docs
  :on-push-to "master"
  :on-pull-request t
  :by-cron "0 10 * * 1"
  :cache t 
  :jobs ((build-docs :asdf-system "40ants-asdf-system-docs")))
