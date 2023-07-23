(uiop:define-package #:40ants-asdf-system/changelog
  (:use #:cl)
  (:import-from #:40ants-doc/changelog
                #:defchangelog))
(in-package #:40ants-asdf-system/changelog)


(defchangelog (:ignore-words ("SLY"
                              "REPL"
                              "HTTP"))
  (0.2.0 2023-07-23
         "* Now system version number is recorded after the load-op operation. This should fix NIL version under ASDF 3.3.1, because seems it does not call define-op somtimes.")
  (0.1.0 2022-08-07
         "* Initial version."))
