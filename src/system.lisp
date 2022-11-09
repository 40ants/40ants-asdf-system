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
    (setf (slot-value system 'version-from-changelog)
          (retrieve-system-version system))))

