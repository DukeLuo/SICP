#lang sicp

;;; a recursive procedure for computing Fibonacci numbers
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

;;; a iteration procedure for computing Fibonacci numbers
(define (fib n)
  (fib-iter 1 0 n))
(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

;;; using the block structure
(define (fib n)
  (define (iter a b n)
    (if (= n 0)
        b
        (iter (+ a b) a (- n 1))))
  (iter 1 0 n))

;;; a recursive procedure which can generate the tree-recursive process
(define (count-change amount) (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination
                         kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))


;;; Exercise 1.11

;;; the procedure that computes f by means of a recursive process
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
      (* 2 (f (- n 2)))
      (* 3 (f (- n 3))))))

; > (f 0)
; 0
; > (f 1)
; 1
; > (f 2)
; 2
; > (f 3)
; 4
; > (f 4)
; 11
; > (f 5)
; 25

;;; the procedure that computes f by means of an iterative process
(define (f n)
  (define (iter a b c n)
    (if (= n 0)
        a
        (iter b c (+ c
                     (* 2 b)
                     (* 3 a)) (- n 1))))
  (iter 0 1 2 n))

; > (f 1)
; 1
; > (f 2)
; 2
; > (f 3)
; 4
; > (f 4)
; 11
; > (f 5)
; 25


;;; Exercise 1.12 Pascal's triangle

(define (pascal row col)
  (if (or (= col 0) (= row col))
      1
      (+ (pascal (- row 1) (- col 1))
         (pascal (- row 1) col))))

; > (pascal 1 0)
; 1
; > (pascal 1 1)
; 1
; > (pascal 2 1)
; 2
; > (pascal 2 0)
; 1
; > (pascal 4 1)
; 4
; > (pascal 4 2)
; 6
; > (pascal 4 3)
; 4
; > (pascal 4 4)
; 1
