(eval-when-compile (require 'cl))

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

(defun get-str-from-buffer-dif (dif)
  (buffer-substring-no-properties (+ (point) dif) (+ (point) 1 dif)))

(defun get-str-from-buffer-dif-backward (dif)
  (buffer-substring-no-properties (- (point) dif) (- (point) 1 dif)))

(defun get-syntax-from-buffer ()
  (char-to-string (char-syntax (string-to-char (get-str-from-buffer)))))

(defun get-syntax-from-buffer-backward ()
  (char-to-string (char-syntax (string-to-char (get-str-from-buffer-backward)))))

(defun get-unicode-type-from-buffer ()
  (unicode-block-type (get-str-from-buffer)))

(defun get-unicode-type-from-buffer-backward ()
  (unicode-block-type (get-str-from-buffer-backward)))

(defconst *latin*
  '(number upcase downcase))

(defun div-symbolword-forward (currstr nextstr)
  "単語を分けるか?"
  (let ((currtype (unicode-block-type currstr))
	(nexttype (unicode-block-type nextstr)))
    (and (not (eq nexttype 'space));次が空白の時は単語を分けない
	 (or (not (equal-syntax currstr nextstr));違う意味の文字なら分ける
	     (and (not (or
			(cl-find currtype *latin*)
			(cl-find nexttype *latin*)));ラテン文字以外で,
		  (not (eq currtype nexttype)));Unicode的に違う文字であるなら分ける
	     (and;自分が小文字で,次が大文字である時分ける
	      (eq currtype 'downcase)
	      (eq nexttype 'upcase))))))

(defun div-symbolword-backward (currstr backstr)
  "単語を分けるか?"
  (let ((currtype (unicode-block-type currstr))
	(backtype (unicode-block-type backstr)))
    (and (not (eq backtype 'space));次が空白の時は単語を分けない
	 (or (not (equal-syntax currstr backstr));違う意味の文字なら分ける
	     (and (not (or
			(cl-find currtype *latin*)
			(cl-find backtype *latin*)));ラテン文字以外で,
		  (not (eq currtype backtype)));Unicode的に違う文字であるなら分ける
	     (and;自分が小文字で,次が大文字である時分ける
	      (eq currtype 'upcase)
	      (eq backtype 'downcase))))))

(provide 'common-function)
