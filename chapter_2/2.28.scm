#lang scheme
;;; Exercise 2.28

(define (fringe tree)
  (cond ((null? tree) '())
        ((pair? tree) (append (fringe (car tree))
                              (fringe (cdr tree))))
        (else (list tree))))
  
    
  