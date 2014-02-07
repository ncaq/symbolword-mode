(defun unicode-block-type (str)
  "Unicode文字をある程度のカテゴリに分類"
  (let ((ucsnum (string-to-char str)))
    (cond ((and (>= ucsnum 48) (<= ucsnum 57))	'numbar)
	  ((and (>= ucsnum 97) (<= ucsnum 122))	'downcase)
	  ((and (>= ucsnum 65) (<= ucsnum 90))	'upcase)
	  ((or
	    (= ucsnum 32)
	    (= ucsnum 160)
	    (= ucsnum 8199)
	    (= ucsnum 8203)
	    (= ucsnum 8288)
	    (= ucsnum 12288)
	    (= ucsnum 65279)
	    (= ucsnum 9);tab
	    )
	   'space)
	  ((= ucsnum 10) 'newline)
	  ((and (>= ucsnum 12352) (<= ucsnum 12447)) 'hiragana)
	  ((and (>= ucsnum 12448) (<= ucsnum 12543)) 'katakana)
	  ((and (>= ucsnum 19968) (<= ucsnum 40959)) 'kanji)
	  ((and (>= ucsnum 13312) (<= ucsnum 19902)) 'kanji)
	  ((and (>= ucsnum 63744) (<= ucsnum 64255)) 'kanji)
	  (t 'otherwise))))

(defun equal-syntax (str str2)
  "言語syntax的な意味で等しいか判断"
  (let ((syntax  (char-syntax (string-to-char str)))
        (syntax2 (char-syntax (string-to-char str2))))
    (= syntax syntax2)))

(defun get-str-from-buffer ()
  (ignore-errors (buffer-substring-no-properties (point) (+ (point) 1))))

(defun get-str-from-buffer-next ()
  (ignore-errors (buffer-substring-no-properties (+ (point) 1) (+ (point) 2))))

(defun get-str-from-buffer-back ()
  (ignore-errors (buffer-substring-no-properties (point) (- (point) 1))))

(defun get-str-from-buffer-dif-forward (dif)
  (ignore-errors (buffer-substring-no-properties (+ (point) dif) (+ (point) 1 dif))))

(defun get-str-from-buffer-dif-backward (dif)
  (ignore-errors (buffer-substring-no-properties (- (point) dif) (- (point) 1 dif))))

(defconst *latin*
  '(number upcase downcase))

(provide 'symbolword-function)
