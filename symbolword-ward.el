;; -*- lexical-binding: t -*-
(require 'symbolword-get)

(defun forward-symbolword ()
  (interactive)
  (if (eobp)
      ()
    (forward-char (-
                   (symbolword/get-div-word-count-forward (1+ (point)))
                   (point)))))


(defun backward-symbolword ()
  (interactive)
  (if (bobp)
      ()
    (backward-char (-
                    (point)
                    (symbolword/get-div-word-count-backward (1- (point)))))))

(provide 'symbolword-ward)
