### nsort 
short for numeric or natural sort

**1 2 10** instead of **1 10 2**



###### Code adapted from answer by Svante 2014-12-05 in 
http://stackoverflow.com/questions/27307660/how-to-implement-natural-sort-in-common-lisp

###### Idea from
https://groups.google.com/forum/#!searchin/comp.lang.lisp/human$20sort/comp.lang.lisp/8-NU77NMl-I/AMXgN3NMbpQJ





#### Usage:

```
(defparameter words 
 '("+gray10+" "+gray11+" "+yellow+" "+gray1+" "+gray2+" "+gray+" "+gray0+"))

(sort (copy-list words) #'nsort:nstring<)
; ("+gray+" "+gray0+" "+gray1+" "+gray2+" "+gray10+" "+gray11+" "+yellow+")

(sort (copy-list words) #'nsort:nstring>)
; ("+yellow+" "+gray11+" "+gray10+" "+gray2+" "+gray1+" "+gray0+" "+gray+")



(defparameter words-case 
 '("+Gray10+" "+gray11+" "+YELLow+" "+gray1+" "+gray2+" "+gray+" "+gray0+"))

(sort (copy-list words-case) #'nsort:nstring-lessp)
; ("+gray+" "+gray0+" "+gray1+" "+gray2+" "+Gray10+" "+gray11+" "+YELLow+")

(sort (copy-list words-case) #'nsort:nstring-greaterp)
; ("+YELLow+" "+gray11+" "+Gray10+" "+gray2+" "+gray1+" "+gray0+" "+gray+")

```

#### Testfile

(prove:run #P"path-to/test.lisp")
