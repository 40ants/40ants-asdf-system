(uiop:define-package #:40ants-asdf-system/changelog
  (:use #:cl)
  (:import-from #:40ants-doc/changelog
                #:defchangelog))
(in-package #:40ants-asdf-system/changelog)


(defchangelog (:ignore-words ("SLY"
                              "REPL"
                              "HTTP"))
  (0.1.0 2022-08-07
         "* Initial version."))
