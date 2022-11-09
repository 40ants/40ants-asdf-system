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
               ;; "macos-latest"
               )
          :quicklisp ("ultralisp"
                      ;; "quicklisp"
                      )
          :lisp ("sbcl"
                 ;; "ccl-bin/1.12.1"
                 ;; "abcl-bin"
                 ;; "allegro"
                 ;; "clasp"
                 ;; "clisp"
                 ;; This CL implementation does not work in any matrix combinations
                 ;; "cmu-bin"
                 ;; "lispworks"
                 ;; "mkcl"
                 ;; ubuntu, ultralisp|quicklisp
                 ;; "npt"
                 ;; "ecl"
                 )
          ;; These combinations are failed for some reason:
          ;; :exclude ((:os "ubuntu-latest" :quicklisp "ultralisp" :lisp "npt")
          ;;           (:os "ubuntu-latest" :quicklisp "quicklisp" :lisp "npt"))
          :coverage t)))


(defworkflow docs
  :on-push-to "master"
  :on-pull-request t
  :by-cron "0 10 * * 1"
  :cache t 
  :jobs ((build-docs :asdf-system "40ants-asdf-system-docs")))
