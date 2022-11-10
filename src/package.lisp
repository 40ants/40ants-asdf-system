(uiop:define-package #:40ants-asdf-system
  (:use #:cl)
  (:nicknames #:40ants-asdf-system/system)
  (:import-from #:asdf/interface
                #:40ants-asdf-system)
  (:export #:40ants-asdf-system
           #:path-to-changelog
           #:path-to-readme))

