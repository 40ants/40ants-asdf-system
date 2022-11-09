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
    (ok (equal (retrieve-system-version (asdf:find-system "40ants-asdf-system"))
               "0.1.0"))))
