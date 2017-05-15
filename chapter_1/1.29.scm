#lang scheme

;;; sum
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;;; sum of cubes
(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(define (sum-cubes a b)
  (sum cube a inc b))


;;; sum of the integers from a through b
(define (identity x) x)

(define (sum-integers a b)
  (sum identity a inc b))

;;; sum of a sequence
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))
          
;;; definite integral
(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

;;; Exercise 1.29

(define (even? x) (= (remainder x 2) 0))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  
  (define (y k) (f (+ a (* k h))))
  
  (define (factor k)
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 2)
          (else 4)))

  (define (term k) (* (factor k)
                      (y k)))

  (* (/ h 3.0)
     (sum term 0.0 inc n)))



(simpson cube 0 1 100)
(simpson cube 0 1 1000)

; 0.24999999999999992
; 0.2500000000000003