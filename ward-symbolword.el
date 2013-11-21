(require 'common-function)

(defun forward-symbolword ()
  (interactive)
  (let ((curr (get-str-from-buffer)))
    (forward-char)
    (unless (div-symbolword-forward curr (get-str-from-buffer))
      (forward-symbolword))))

(defun backward-symbolword ()
  (interactive)
  (let ((curr (get-str-from-buffer-backward)))
    (backward-char)
    (unless (div-symbolword-backward curr (get-str-from-buffer-backward))
      (backward-symbolword))))

(provide 'ward-symbolword)
