(uiop:define-package #:40ants-asdf-system-docs/changelog
  (:use #:cl)
  (:import-from #:40ants-doc/changelog
                #:defchangelog))
(in-package #:40ants-asdf-system-docs/changelog)


(defchangelog (:ignore-words ("SLY"
                              "ASDF"
                              "REPL"
                              "HTTP"))
  (0.3.1 2023-02-10
         "* Now it is possible to load the library on ASDF 3.3.1.")
  (0.3.0 2022-11-09
         "* Now docs/changelog.lisp will be recognized when system version is extracted.")
  (0.2.0 2022-11-07
         "* System was made non-package-inferred, to obliterate
            \"Computing just-done stamp ... but dependency ... wasn't done yet!\" ASDF warnings.

            You will find more information about this warning in this issue:

            https://gitlab.common-lisp.net/asdf/asdf/-/issues/132")
  (0.1.0 2022-08-07
         "* Initial version."))
