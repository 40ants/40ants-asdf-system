(uiop:define-package #:test-40ants-system/changelog
  (:use #:cl)
  (:import-from #:40ants-doc/changelog
                #:defchangelog))
(in-package #:test-40ants-system/changelog)


(defchangelog ()
  (0.2.0 2022-11-07
         "* Second version")
  (0.1.0 2022-08-07
         "* Initial version."))
