(defun equal-syntax (str str2)
  (let ((syntax  (char-to-string (char-syntax (string-to-char str))))
	(syntax2 (char-to-string (char-syntax (string-to-char str2)))))
    (equal syntax syntax2)))

(defun equal-syntax-and-cjk (str str2)
  (and
   (equal-syntax str str2)
   (equal (unicode-block-type str) (unicode-block-type str2))))

(defun unicode-block-type (str)
  "ひらがな==1 カタカナ==2 漢字==3 numbar==4 downcase==5 upcase==6 otherwise==0"
  (let ((ucsnum (string-to-char str)))
    (cond ((and (>= ucsnum 48)    (<= ucsnum 57))    4)
	  ((and (>= ucsnum 97)    (<= ucsnum 122))   5)
	  ((and (>= ucsnum 65)    (<= ucsnum 90))    6)
	  ((and (>= ucsnum 12352) (<= ucsnum 12447)) 1)
	  ((and (>= ucsnum 12448) (<= ucsnum 12543)) 2)
	  ((and (>= ucsnum 19968) (<= ucsnum 40959)) 3)
	  ((and (>= ucsnum 13312) (<= ucsnum 19902)) 3)
	  ((and (>= ucsnum 63744) (<= ucsnum 64255)) 3)
	  (t 0))))

(defun get-str-from-buffer ()
  (buffer-substring-no-properties (point) (+ (point) 1)))

(defun get-str-from-buffer-backward ()
  (buffer-substring-no-properties (point) (- (point) 1)))

(defun get-syntax-from-buffer ()
  (char-to-string (char-syntax (string-to-char (get-str-from-buffer)))))

(defun get-syntax-from-buffer-backward ()
  (char-to-string (char-syntax (string-to-char (get-str-from-buffer-backward)))))

(provide 'common-function)
