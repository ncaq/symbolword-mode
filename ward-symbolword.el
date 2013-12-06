(require 'common-function)

(defun forward-symbolword ()
  (interactive)
  (forward-symbolword-sub (get-str-from-buffer)))

(defun forward-symbolword-sub (curr)
  (let ((next (get-str-from-buffer)))
    (unless (div-symbolword-forward curr next)
      (forward-char)
      (forward-symbolword-sub next))))

(defun backward-symbolword ()
  (interactive)
  (backward-symbolword-sub (get-str-from-buffer-backward)))

(defun backward-symbolword-sub (curr)
  (let ((back (get-str-from-buffer-backward)))
    (unless (div-symbolword-backward curr back)
      (backward-char)
      (backward-symbolword-sub back))))

(provide 'ward-symbolword)
