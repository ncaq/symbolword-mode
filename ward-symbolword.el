(require 'symbolword-function)
(require 'symbolword-rule)

(defun forward-symbolword ()
  (interactive)
  (forward-whitespace-and-newline)
  (forward-symbolword-sub (get-str-from-buffer)))

(defun forward-symbolword-sub (curr)
  (let ((next (get-str-from-buffer)))
    (if (not (div-symbolword-forward curr next))
      (progn
	(forward-char)
	(forward-symbolword-sub next)))))

(defun forward-whitespace-and-newline ()
  (let ((currtype (unicode-block-type (get-str-from-buffer))))
    (when (eq currtype 'space)
      (forward-char)
      (forward-whitespace-and-newline))))

(defun backward-symbolword ()
  (interactive)
  (backward-whitespace-and-newline)
  (backward-symbolword-sub (get-str-from-buffer-back)))

(defun backward-symbolword-sub (curr)
  (let ((next (get-str-from-buffer-back)))
    (if (not (div-symbolword-backward curr next))
      (progn
	(backward-char)
	(backward-symbolword-sub next)))))

(defun backward-whitespace-and-newline ()
  (let ((currtype (unicode-block-type (get-str-from-buffer-back))))
    (when (eq currtype 'space)
      (backward-char)
      (backward-whitespace-and-newline))))

(provide 'ward-symbolword)
