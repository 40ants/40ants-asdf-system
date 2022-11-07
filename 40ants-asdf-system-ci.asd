(defsystem "40ants-asdf-system-ci"
  :author "Alexander Artemenko"
  :license "BSD"
  :class :package-inferred-system
  :description "Provides CI configuration for 40ants-asdf-system."
  :bug-tracker "https://github.com/40ants/40ants-asdf-system/issues"
  :source-control (:git "https://github.com/40ants/40ants-asdf-system")
  :pathname "ci"
  :depends-on ("40ants-asdf-system-ci/ci"))
