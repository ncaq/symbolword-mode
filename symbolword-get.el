;; -*- lexical-binding: t -*-
(require 'symbolword-rule)

(defun symbolword/div-word-point? (n)
  (interactive)
  (symbolword/div-word? (char-before n) (char-after n)))

(provide 'symbolword-get)
