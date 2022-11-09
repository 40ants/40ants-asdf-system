(in-package #:40ants-asdf-system)


(defun read-file-forms (filename)

  (let* ((package-name (gensym "TMP-PACKAGE"))
         (*package*
           (make-package package-name
                         :use (list "COMMON-LISP"))))
    (uiop:read-file-forms filename)))


(defun extract-version-from-changelog (changelog-file)
  (loop for form in (read-file-forms changelog-file)
        when (and (consp form)
                  (string-equal (car form)
                                "DEFCHANGELOG"))
          do (return (let* ((version-form
                              ;; Here we are skipping DEFCHANGELOG and it's arguments
                              (third form))
                            (version-symbol (car version-form))
                            (version (symbol-name version-symbol)))
                       version))))


(defun retrieve-system-version (system)
  (let ((filenames (list (make-pathname :directory (list :relative "src")
                                        :name "changelog"
                                        :type "lisp")
                         (make-pathname :directory (list :relative "src" "doc")
                                        :name "changelog"
                                        :type "lisp")
                         (make-pathname :directory (list :relative "docs")
                                        :name "changelog"
                                        :type "lisp")
                         (make-pathname :name "changelog"
                                        :type "lisp"))))
    (loop for filename in filenames
          for full-path = (asdf:system-relative-pathname system filename)
          when (probe-file full-path)
            do (let ((version (extract-version-from-changelog full-path)))
                 (when version
                   (return-from retrieve-system-version version))))))
