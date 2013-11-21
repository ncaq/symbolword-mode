(require 'common-function)
(require 'cc-cmds)
(eval-when-compile (require 'cl))

(defun kill-symbolword ()
  (interactive)
  (c-hungry-delete-forward)
  (kill-forward-chars (kill-symbolword-size (get-str-from-buffer) 1)))

(defun kill-symbolword-size (curr num)
  (let ((next (get-str-from-buffer-dif num)))
    (if (not (div-symbolword-forward curr next))
      (kill-symbolword-size next (incf num))
    num)))

(defun backward-kill-symbolword ()
  (interactive)
  (c-hungry-delete-backwards)
  (kill-backward-chars (backward-kill-symbolword-size (get-str-from-buffer-backward) 1)))

(defun backward-kill-symbolword-size (curr num)
  (let ((next (get-str-from-buffer-dif-backward num)))
    (if (not (div-symbolword-backward curr next))
      (backward-kill-symbolword-size next (incf num))
    num)))

(provide 'kill-symbolword)
