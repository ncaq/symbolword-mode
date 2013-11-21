(require 'common-function)
(require 'thingatpt)

(defun forward-spaceonly ()
  (cond ((eq 'space (unicode-block-type (get-str-from-buffer)))
	 (forward-char)
	 (forward-spaceonly))))

(defun forward-symbolword ()
  (interactive)
  (forward-spaceonly)
  (forward-symbolword-sub (get-str-from-buffer)))

(defun forward-symbolword-sub (curr)
  (let ((next (get-str-from-buffer)))
    (unless (div-symbolword-forward curr next)
      (forward-char)
      (forward-symbolword-sub next))))

(defun backward-spaceonly ()
  (cond ((eq 'space (unicode-block-type (get-str-from-buffer-backward)))
	 (backward-char)
	 (backward-spaceonly))))

(defun backward-symbolword ()
  (interactive)
  (backward-spaceonly)
  (backward-symbolword-sub (get-str-from-buffer-backward)))

(defun backward-symbolword-sub (curr)
  (let ((next (get-str-from-buffer-backward)))
    (unless (div-symbolword-backward curr next)
      (backward-char)
      (backward-symbolword-sub next))))

(provide 'ward-symbolword)
