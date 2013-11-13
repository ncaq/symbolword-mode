(require 'common-function)

(defun kill-symbolword-sub (str)
  (cond ((equal-syntax-and-cjk str (get-str-from-buffer))
	 (delete-forward-char 1 t) (kill-symbolword-sub str))))

(defun kill-symbolword ()
  (interactive)
  (kill-symbolword-sub (get-str-from-buffer)))

(defun backward-kill-symbolword-sub (str)
  (cond ((equal-syntax-and-cjk str (get-str-from-buffer-backward))
	 (delete-char -1 t) (backward-kill-symbolword-sub str))))

(defun backward-kill-symbolword ()
  (interactive)
  (backward-kill-symbolword-sub (get-str-from-buffer-backward)))

(provide 'kill-symbolword)
