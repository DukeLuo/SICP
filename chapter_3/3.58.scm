;;; Exercise 3.58

(define (expand num den radix)
  (cons-stream (quotient (* num radix) den)
               (expand (remainder (* num radix) den) den radix)))
;;; 1 4 2 8 5 7 1 4 2 8 5 7 ...
;;; 3 7 5 0 0 0 0 ...

               