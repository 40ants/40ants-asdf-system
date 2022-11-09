(defsystem "40ants-asdf-system-tests"
  :author "Alexander Artemenko"
  :license "BSD"
  :class :package-inferred-system
  :pathname "t"
  :depends-on ("40ants-asdf-system-tests/core")
  :description "Test system for 40ants-asdf-system."

  :perform (test-op (op c)
                    (unless (symbol-call :rove :run c)
                      (error "Tests failed"))))
