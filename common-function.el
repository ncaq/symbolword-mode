(defun equal-type (source syntaxtype)
  (let ((syntax (char-to-string (char-syntax (string-to-char source)))))
    (equal source syntaxtype)))

(defun get-char-from-buffer ()
  (buffer-substring-no-properties (point) (+ (point) 1)))

(defun get-char-from-buffer-backward ()
  (buffer-substring-no-properties (point) (- (point) 1)))

(defun get-syntax-from-buffer ()
  (char-to-string (char-syntax (string-to-char (get-char-from-buffer)))))

(defun get-syntax-from-buffer-backward ()
  (char-to-string (char-syntax (string-to-char (get-char-from-buffer-backward)))))

(provide 'common-function)
