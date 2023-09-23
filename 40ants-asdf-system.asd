(defsystem "40ants-asdf-system"
  :author "Alexander Artemenko"
  :license "BSD"
  :description "Provides a class for being used instead of asdf:package-inferred-system."
  :bug-tracker "https://github.com/40ants/40ants-asdf-system/issues"
  :source-control (:git "https://github.com/40ants/40ants-asdf-system")
  ;; :depends-on ("uiop")
  ;; This system has to be non-package-inferred and should not
  ;; depend on any package-inferred system because of this bug in ASDF:
  ;; https://gitlab.common-lisp.net/asdf/asdf/-/issues/132
  :components ((:module "src"
                :components ((:file "package")
                             (:file "version" :depends-on ("package"))
                             (:file "readme" :depends-on ("package"))
                             (:file "system" :depends-on ("version")))))
  :in-order-to ((test-op (test-op "40ants-asdf-system-tests"))))
