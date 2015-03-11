;;;; package.lisp

(defpackage #:nsort
  (:use #:cl)
  (:export
   nstring<    nstring-lessp
   nstring>    nstring-greaterp    
   nstring>=   nstring-not-lessp   
   nstring<=   nstring-not-greaterp))
