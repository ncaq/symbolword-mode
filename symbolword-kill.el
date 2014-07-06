;; -*- lexical-binding: t -*-
(require 'symbolword-get)

(defun kill-symbolword ()
  (interactive)
  (if (eobp)
      ()
    (kill-forward-chars (-
                        (symbolword/get-div-word-count-forward (1+ (point)))
                        (point)))))

(defun backward-kill-symbolword ()
  (interactive)
  (if (bobp)
      ()
    (kill-backward-chars (-
                    (point)
                    (symbolword/get-div-word-count-backward (1- (point)))))))

(provide 'symbolword-kill)
