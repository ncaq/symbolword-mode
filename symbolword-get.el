;; -*- lexical-binding: t -*-
(require 'symbolword-rule)

(defun symbolword/div-word-point? (n)
  (interactive)
  (symbolword/div-word? (char-before n) (char-after n)))

(defun symbolword/get-div-word-count-forward (n)
  (if (symbolword/div-word-point? n)
      n
    (symbolword/get-div-word-count-forward (1+ n))))

(defun symbolword/get-div-word-count-backward (n)
  (if (symbolword/div-word-point? n)
      n
    (symbolword/get-div-word-count-backward (1- n))))

(provide 'symbolword-get)
