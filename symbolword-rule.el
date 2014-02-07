(require 'symbolword-function)

;;単語分け条件
;;left 現在 right 次
;;(_ 空白)
;;(改行 改行でない) ← backward逆
;;(aUnicodeTypeの文字 空白でないbUnicodeTypeの文字) ← ただしラテン文字の大文字小文字は同じものとする
;;(aSyntax bSyntax)
;;(ラテン小文字 ラテン大文字) ← backward逆

(defun div-symbolword-forward (currstr nextstr)
  "単語を分けるか?"
  (and
   (stringp currstr)
   (stringp nextstr)
   (let ((currtype (unicode-block-type currstr))
	 (nexttype (unicode-block-type nextstr)))
     (or
      (eq nexttype 'space)
      (and
       (not (and
	     (memq currtype *latin*)
	     (memq nexttype *latin*)))
       (and
	(not (eq nexttype 'space))
	(not (eq currtype nexttype))))
      (and
       (not (eq nexttype 'space))
       (not (equal-syntax currstr nextstr)))
      (and
       (eq currtype 'downcase)
       (eq nexttype 'upcase))
      ))))

(defun div-symbolword-backward (currstr nextstr)
  "単語を分けるか?"
  (and
   (stringp currstr)
   (stringp nextstr)
   (let ((currtype (unicode-block-type currstr))
	 (nexttype (unicode-block-type nextstr)))
     (or
      (eq nexttype 'space)
      (and
       (not (and
	     (memq currtype *latin*)
	     (memq nexttype *latin*)))
       (and
	(not (eq nexttype 'space))
	(not (eq currtype nexttype))))
      (and
       (not (eq nexttype 'space))
       (not (equal-syntax currstr nextstr)))
      (and
       (eq currtype 'upcase)
       (eq nexttype 'downcase))
      ))))

(provide 'symbolword-rule)
