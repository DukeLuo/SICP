#lang sicp

;;; finding roots of equations by half-interval method
(define (average x y) (/ (+ x y) 2))

(define (positive? n) (> n 0))

(define (negative? n) (< n 0))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

(define (close-enough? x y) (< (abs (- x y)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (positive? a-value) (negative? b-value))
           (search f b a))
          (else
           (display "Value are not of opposite sign")))))
    
; (half-interval-method sin 2.0 4.0)
; (half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0 2.0)


;;; finding fixed points of functions
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  
;  (define try (lambda (guess)
;    (let ((next (f guess)))
;      (if (close-enough? guess next)
;          next
;          (try next)))))

;  (define (try guess)
;    (define next (f guess))
;    (if (close-enough? guess next)
;        next
;        (try next)))
                
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;(fixed-point cos 1.0)
;(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
                 1.0))

;;; Exercise 1.35

; x^2 = x + 1
; x = 1 + 1/x

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
; 1.6180327868852458

(fixed-point (lambda (x) (average x (+ 1 (/ 1 x)))) 1.0)
; 1.6180311591702674