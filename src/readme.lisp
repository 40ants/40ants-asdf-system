(in-package #:40ants-asdf-system)


(defun retrieve-system-readme (system)
  (let* ((filename (let ((path (path-to-readme system)))
                     (etypecase path
                       (string (uiop:parse-unix-namestring path))
                       (pathname path))))
         (full-path (asdf:system-relative-pathname system filename)))
    (when (probe-file full-path)
      (uiop:read-file-string full-path))))
