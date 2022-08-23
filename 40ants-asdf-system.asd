(defsystem "40ants-asdf-system"
  :author "Alexander Artemenko"
  :license "BSD"
  :class :package-inferred-system
  :pathname "src"
  :description "Provides a class for being used instead of asdf:package-inferred-system."
  :bug-tracker "https://github.com/40ants/40ants-asdf-system/issues"
  :source-control (:git "https://github.com/40ants/40ants-asdf-system")
  :depends-on ("uiop"
               "40ants-asdf-system/system"
               "40ants-asdf-system/changelog"))
