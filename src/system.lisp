(in-package #:40ants-asdf-system)


(defclass asdf/interface::40ants-asdf-system (asdf/interface:package-inferred-system)
  ((path-to-changelog :initform "docs/changelog.lisp"
                      :initarg :path-to-changelog
                      :type (or string pathname)
                      :documentation "System relative path to a changelog, if string is given, then it will be processed using uiop:parse-unix-namestring function."
                      :reader path-to-changelog)
   (path-to-readme :initform "README.md"
                      :initarg :path-to-readme
                      :type (or string pathname)
                      :documentation "System relative path to a README.md, if string is given, then it will be processed using uiop:parse-unix-namestring function."
                      :reader path-to-readme))
  (:documentation "This ASDF system class takes it's version from src/changelog.lisp"))


(defmethod asdf:operate :after ((op asdf:load-op) (system asdf/interface::40ants-asdf-system) &rest rest)
  (declare (ignore rest))

  (let ((version nil))
    (flet ((get-version ()
             (or version
                 (setf version
                       (retrieve-system-version system)))))

      (unless (asdf:component-version system)
        (setf (asdf:component-version system)
              (get-version)))

      ;; ASDF before 3.3.2.11 didn't provide version slot on systems
      (when (find-symbol "SYSTEM-VERSION" (find-package "ASDF"))
        (unless (uiop:symbol-call "ASDF"
                                  "SYSTEM-VERSION"
                                  system)
          (setf (slot-value system 'asdf:version)
                (get-version))))
      
      (unless (asdf:system-long-description system)
        (setf (slot-value system 'asdf::long-description)
              (retrieve-system-readme system))))))
