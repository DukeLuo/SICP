#lang sicp

(define plus4 (lambda (x) (+ x 4)))

((lambda (x y z) (+ x y (* z z))) 1 2 3)

;;; f(x,y)=x(1+xy)^2+y(l-y)+(1+xy)(1-y)
(define (f x y)
  (define (f-helper a b)
    (+ (* x (* a a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y))
            (- 1 y)))

;;; lambda
(define (f x y)
  ((lambda (a b)
     (+ (* x (* a a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

;;; let
(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (* a a))
       (* y b)
       (* a b))))

;;; Exercise 1.34

(define (f g) (g 2))

(f f)
; application: not a procedure;
;  expected a procedure that can be applied to arguments
;   given: 2
;   arguments...:

;;; we will get an error,because finally we need to evaluate (2,2),and '2' is not a procedure
; (f f)
; (f 2)
; (2 2)
