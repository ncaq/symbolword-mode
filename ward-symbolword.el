(require 'common-function)

(defun forward-symbolword ()
  (interactive)
  (skip-syntax-forward (get-syntax-from-buffer)))

(defun backward-symbolword ()
  (interactive)
  (skip-syntax-backward (get-syntax-from-buffer)))

(provide 'ward-symbolword)
