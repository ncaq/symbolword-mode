(require 'common-function)
(eval-when-compile (require 'cl))

(defun kill-symbolword ()
  (interactive)
  (kill-forward-chars (kill-symbolword-size (get-str-from-buffer) 0)))

(defun kill-symbolword-size (curr num)
  (let ((next (get-str-from-buffer-dif num)))
    (if (not (div-symbolword-forward curr next))
      (kill-symbolword-size next (incf num))
    num)))

(defun backward-kill-symbolword ()
  (interactive)
  (kill-backward-chars (backward-kill-symbolword-size (get-str-from-buffer-backward) 0)))

(defun backward-kill-symbolword-size (curr num)
  (let ((next (get-str-from-buffer-dif-backward num)))
    (if (not (div-symbolword-backward curr next))
      (backward-kill-symbolword-size next (incf num))
    num)))

(provide 'kill-symbolword)
