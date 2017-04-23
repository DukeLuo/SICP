#lang scheme
; Square roots by Newton's Method
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
	  
(define (improve guess x)
  (average guess (/ x guess)))
  
(define (average x y)
  (/ (+ x y) 2))
  
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
  
(define (sqrt x)
  (sqrt-iter 1.0 x))
  
(define (square x) (* x x))

;Exercise 1.6
; she will get a error,because if is a special type of conditional,new-if is different from if
; lisp uses applicative-order evaluations,so the sqrt-iter in new-if will be evaluated in all cases
; this result in an infinite recursion,finally the interpretater will return an error



;Exercise 1.7
;; the procedure cant's work well,when evaluates the small number,it get a wrong result 
;; because the absolute tolerance of 0.001 is significantly large for small number,and get into a 
; infinite loop when evaluates large number because the machine precision is unable to represent small differences between large numbers

; > (sqrt 0.0001)
; 0.03230844833048122
; > (sqrt 1000000000000)
; 1000000.0
; > (sqrt 10000000000000)
; . . user break

; the new good-enough?
(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      (improve guess x)
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess0 guess1)
  (<
   (/ (abs (- guess1 guess0)) guess0) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (square x) (* x x))

; > (sqrt 0.0001)
; 0.010000000025490743
; > (sqrt 1000000000000)
; 1000000.103461242
; > (sqrt 10000000000000)
; 3162277.6640104805
; > (sqrt 10000000000000000000000)
; 100000000056.33694



;Exercise1.8

(define (cube-root-iter guess x)
  (if (good-enough? guess (improve guess x))
      (improve guess x)
      (cube-root-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
      3))
    
(define (good-enough? guess0 guess1)
  (<
   (/ (abs (- guess1 guess0)) guess0) 0.001))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube x) (* x x x))

; > (cube-root (cube 5))
; 5.000000000287929
; > (cube-root (cube 100))
; 100.000072886219
; > (cube-root (cube 0.01))
; 0.010000000002405413
; > (cube-root (cube 10000000000000000000))
; 1.000000000002518e+019