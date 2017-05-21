#lang sicp


;;; Exercise 1.43
(define (compose f g)
  (lambda (x) (f (g x))))

;;; iteration
(define (repeated f n)
  (define (iter i result)
    (if (= n i)
        result
        (iter (+ i 1)
              (compose result f))))
  (iter 1 f))


;;; recursion
(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (square x) (* x x))


; > ((repeated square 2) 5)
; 625
; > ((repeated inc 2) 5)
; 7

