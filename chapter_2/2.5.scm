#lang sicp


(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))


;;; Exercise 2.5


;;; using recursion
(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))


 (define (car z)
  (if (= (remainder z 2) 0)
      (+ 1 (car (/ z 2)))
      0))


(define (cdr z)
  (if (= (remainder z 3) 0)
      (+ 1 (cdr (/ z 3)))
      0))


;;; using iteration
(define (car z)
  
  (define (b-iter n)
    
    (define (a-iter product result)
      (cond ((= product
                (/ z (expt 3 n))) result)
            ((> product z) (b-iter (+ n 1)))
            (else (a-iter (* product 2)
                          (+ result 1)))))
    (a-iter 1 0))
  (b-iter 0))


(define (cdr z)
  
  (define (a-iter n)
    
    (define (b-iter product result)
      (cond ((= product
                (/ z (expt 2 n))) result)
            ((> product z) (a-iter (+ n 1)))
            (else (b-iter (* product 3)
                          (+ result 1)))))
    (b-iter 1 0))
  (a-iter 0))



; > (cons 3 4)
; 648
; > (car 648)
; 3
; > (cdr 648)
; 4
; > (cons 5 6)
; 23328
; > (car 23328)
; 5
; > (cdr 23328)
; 6
  
