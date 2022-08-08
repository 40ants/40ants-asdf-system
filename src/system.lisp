(uiop:define-package #:40ants-asdf-system
  (:use #:cl)
  (:import-from #:40ants-asdf-system/version
                #:extract-version-from-changelog)
  (:import-from #:40ants-doc
                #:defsection)
  (:nicknames #:40ants-asdf/system/system))
(in-package #:40ants-asdf-system)


(defclass asdf/interface::40ants-asdf-system (asdf/interface:package-inferred-system)
  ((version-from-changelog :initform nil
                           :type (or null string)
                           :reader asdf:component-version
                           :documentation "This slot is used instead of asdf/component:version because it is overwritten by ASDF function parse-component-form and there is no other way to save a version from the changelog."))
  (:documentation "This ASDF system class takes it's version from src/changelog.lisp"))


(defmethod shared-initialize :after ((system asdf/interface::40ants-asdf-system) slot-names &rest rest)
  (declare (ignore rest slot-names))
  (unless (asdf:component-version system)
    (let ((filenames (list (make-pathname :directory (list :relative "src")
                                          :name "changelog"
                                          :type "lisp")
                           (make-pathname :directory (list :relative "src" "doc")
                                          :name "changelog"
                                          :type "lisp")
                           (make-pathname :name "changelog"
                                          :type "lisp"))))
      (loop for filename in filenames
            for full-path = (asdf:system-relative-pathname system filename)
            when (probe-file full-path)
              do (let ((version (extract-version-from-changelog full-path)))
                   (when version
                     (setf (slot-value system 'version-from-changelog)
                           version)))))))



(defsection @usage (:title "Usage"
                    :ignore-words ("ASDF:PACKAGE-INFERRED-SYSTEM"
                                   "ASDF"))
  "
This system provides a base class for ASDF systems of 40Ants.
This ASDF system class inherits from ASDF:PACKAGE-INFERRED-SYSTEM class. This class
reads its version from the src/changelog.lisp file. Thus, ASDF system version
stored in the one place and always correct.

To use this class, mention it in the ASDF system definition like this:

 
"
  (asdf/interface::40ants-asdf-system system))
