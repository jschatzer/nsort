;;;; nsort.lisp

;-----------------------------------------------------------------------------------------
; Code adapted from answer by Svante 2014-12-05 in 
; http://stackoverflow.com/questions/27307660/how-to-implement-natural-sort-in-common-lisp
;-----------------------------------------------------------------------------------------

(in-package #:nsort)

(defmacro defnsf (name fn dir)  
  `(defun ,name (a b &key (sa 0) (ea (length a)) (sb 0) (eb (length b)))
     (do ((a-index sa) (b-index sb))
       ((or (>= a-index ea) (>= b-index eb)) (not (>= b-index eb)))    ; <----- ev zu überlegen
       (multiple-value-bind (a-int a-pos) (parse-integer a :start a-index :junk-allowed t)
         (multiple-value-bind (b-int b-pos) (parse-integer b :start b-index :junk-allowed t)
           (if (and a-int b-int)
             (if (= a-int b-int)
               (setf a-index a-pos b-index b-pos)
               (return-from ,name (,dir a-int b-int)))
             (if (char-equal (aref a a-index) (aref b b-index))
               (progn (incf a-index) (incf b-index))
               (return-from ,name (,fn (aref a a-index) (aref b b-index))))))))))

(defnsf nstring<  char<  <)   (defnsf nstring-lessp        char-lessp        <)
(defnsf nstring>  char>  >)   (defnsf nstring-greaterp     char-greaterp     >)
(defnsf nstring>= char>= >)   (defnsf nstring-not-lessp    char-not-lessp    >)
(defnsf nstring<= char<= <)   (defnsf nstring-not-greaterp char-not-greaterp <)
