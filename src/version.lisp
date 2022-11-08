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
