(defun equal-type (source syntaxtype)
  (let ((syntax (char-to-string (char-syntax (string-to-char source)))))
    (equal source syntaxtype)))
