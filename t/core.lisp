(uiop:define-package #:40ants-asdf-system-tests/core
  (:use #:cl)
  (:import-from #:40ants-asdf-system
                #:retrieve-system-version)
  (:import-from #:rove
                #:testing
                #:ok
                #:deftest))
(in-package #:40ants-asdf-system-tests/core)


(deftest test-version-extraction
  (testing "Checking if it is possible to extract version from our changelog"
    (asdf:load-asd (asdf:system-relative-pathname (asdf:registered-system "40ants-asdf-system")
                                                  (uiop:parse-unix-namestring "t/test-40ants-system.asd")))
    (ok (equal (retrieve-system-version (asdf:find-system "test-40ants-system"))
               "0.2.0"))))
