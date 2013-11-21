(defun unicode-block-type (str)
  (let ((ucsnum (string-to-char str)))
    (cond ((and (>= ucsnum 48)    (<= ucsnum 57))    'numbar)
	  ((and (>= ucsnum 97)    (<= ucsnum 122))   'downcase)
	  ((and (>= ucsnum 65)    (<= ucsnum 90))    'upcase)
	  ((or
	    (= ucsnum 32)
	    (= ucsnum 160)
	    (= ucsnum 8199)
	    (= ucsnum 8203)
	    (= ucsnum 8288)
	    (= ucsnum 12288)
	    (= ucsnum 65279))
	   'space)
	  ((= ucsnum 10) 'newline)
	  ((and (>= ucsnum 12352) (<= ucsnum 12447)) 'hiragana)
	  ((and (>= ucsnum 12448) (<= ucsnum 12543)) 'katakana)
	  ((and (>= ucsnum 19968) (<= ucsnum 40959)) 'kanji)
	  ((and (>= ucsnum 13312) (<= ucsnum 19902)) 'kanji)
	  ((and (>= ucsnum 63744) (<= ucsnum 64255)) 'kanji)
	  (t 'otherwise))))

(defun equal-syntax (str str2)
  (let ((syntax  (char-syntax (string-to-char str)))
	(syntax2 (char-syntax (string-to-char str2))))
    (= syntax syntax2)))

(defun equal-unicode (str str2)
  (eq (unicode-block-type str) (unicode-block-type str2)))

(defun equal-syntax-and-unicode (str str2)
  (and
   (equal-syntax str str2)
   (equal-unicode str str2)))

(defun get-str-from-buffer ()
  (buffer-substring-no-properties (point) (+ (point) 1)))

(defun get-str-from-buffer-backward ()
  (buffer-substring-no-properties (point) (- (point) 1)))

(defun get-syntax-from-buffer ()
  (char-to-string (char-syntax (string-to-char (get-str-from-buffer)))))

(defun get-syntax-from-buffer-backward ()
  (char-to-string (char-syntax (string-to-char (get-str-from-buffer-backward)))))

(defun div-symbolword-forward (currstr nextstr)
  "単語を分ける条件(前方方向)"
  (let ((curr (unicode-block-type currstr))
	(next (unicode-block-type nextstr)))
    (and
     (not (eq next 'space));次が空白の時は単語を分けない
     (or
      (not (equal-syntax currstr nextstr));違う意味の文字なら分ける
      (not (eq curr next));Unicode的に違う文字であるなら分ける
      (and;自分が小文字で,次が大文字である時
       (eq curr 'downcase)
       (eq next 'upcase))))))

(defun div-symbolword-backward (currstr backstr)
  "単語を分ける条件(前方方向)"
  (let ((curr (unicode-block-type currstr))
	(back (unicode-block-type backstr)))
    (and
     (not (eq back 'space));次が空白の時は単語を分けない
     (or
      (not (equal-syntax currstr backstr));違う意味の文字なら分ける
      (not (eq curr back));Unicode的に違う文字であるなら分ける
      (and;自分が大文字で,次が小文字である時
       (eq curr 'upcase)
       (eq back 'downcase))))))

(provide 'common-function)
