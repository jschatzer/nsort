(defpackage test 
  (:use cl prove nsort))

(in-package test)

(plan 6)

(defparameter numbers '("10" "1" "2"))
(is (sort (copy-list numbers) #'nsort:nstring<) '("1" "2" "10"))
(is (sort (copy-list numbers) #'nsort:nstring>) '("10" "2" "1")) 

(defparameter words '("+gray10+" "+gray1+" "+gray2+"))
(is (sort (copy-list words) #'nsort:nstring<) '("+gray1+" "+gray2+" "+gray10+"))
(is (sort (copy-list words) #'nsort:nstring>) '("+gray10+" "+gray2+" "+gray1+"))

(defparameter words-case '("+Gray10+" "+GRAY1+" "+gray2+"))
(is (sort (copy-list words-case) #'nsort:nstring-lessp) '("+GRAY1+" "+gray2+" "+Gray10+"))
(is (sort (copy-list words-case) #'nsort:nstring-greaterp) '("+Gray10+" "+gray2+" "+GRAY1+"))

(finalize)
