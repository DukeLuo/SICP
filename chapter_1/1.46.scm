#lang sicp


;;; Exercise 1.46
(define (iterative-improve test improve)
  (lambda (guess)
    (if (test guess)
        guess
        ((iterative-improve test improve) (improve guess)))))


;;; 1.17
(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  
  (define (improve guess)
    (average guess (/ x guess)))

  ((iterative-improve good-enough? improve) 1.0))

; (sqrt 4)
; (sqrt 5)
; 2.0000000929222947
; 2.2360688956433634


;;; fixed-point
(define (fixed-point f first-guess)
  (define (next guess)
    (f guess))
  
  (define (close-enough? guess)
    (< (abs (- guess (next guess)))
       0.00001))

  ((iterative-improve close-enough? next) first-guess))

; (fixed-point cos 1.0)
; 0.7390893414033927

  