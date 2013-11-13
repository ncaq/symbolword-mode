(defun equal-type (source syntaxtype)
  (let ((syntax (char-to-string (char-syntax (string-to-char source)))))
    (equal source syntaxtype)))

(defun get-char-from-buffer ()
  (buffer-substring-no-properties (point) (+ (point) 1)))

(defun get-syntax-from-buffer ()
  (char-to-string (char-syntax (string-to-char (get-char-from-buffer)))))

(provide 'common-function)
