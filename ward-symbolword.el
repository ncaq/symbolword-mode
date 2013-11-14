(require 'common-function)

(defun forward-symbolword-sub (str)
  (cond ((equal-syntax-and-cjk str (get-str-from-buffer)) (forward-char) (forward-symbolword-sub str))))

(defun forward-symbolword ()
  (interactive)
  (forward-symbolword-sub (get-str-from-buffer)))

(defun backward-symbolword-sub (str)
  (cond ((equal-syntax-and-cjk str (get-str-from-buffer-backward)) (backward-char) (backward-symbolword-sub str))))

(defun backward-symbolword ()
  (interactive)
  (backward-symbolword-sub (get-str-from-buffer-backward)))

(provide 'ward-symbolword)
