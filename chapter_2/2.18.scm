#lang sicp


;;; Exercise 2.18
(define (reverse items)
  
  (define (reverse-iter remained-item result)
    (if (null? remained-item)
        result
        (reverse-iter (cdr remained-item)
                      (cons (car remained-item) result))))
  (reverse-iter items nil))

; > (reverse (list 1 2 3 4 5))
; (mcons 5 (mcons 4 (mcons 3 (mcons 2 (mcons 1 '())))))
; > (reverse nil)
; '()
  
