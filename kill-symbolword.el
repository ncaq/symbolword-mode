(require 'common-function)

(defun kill-symbolword-sub (syntax)
  (cond ((equal-type syntax (get-syntax-from-buffer))
	 (delete-forward-char 1 t) (kill-symbolword-sub syntax))))

(defun kill-symbolword ()
  (interactive)
  (kill-symbolword-sub (get-syntax-from-buffer)))

(defun backward-kill-symbolword-sub (syntax)
  (cond ((equal-type syntax (get-syntax-from-buffer-backward))
	 (delete-char -1 t) (backward-kill-symbolword-sub syntax))))

(defun backward-kill-symbolword ()
  (interactive)
  (backward-kill-symbolword-sub (get-syntax-from-buffer-backward)))

(provide 'kill-symbolword)
