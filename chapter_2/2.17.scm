#lang sicp

(define odds (list 1 3 5 7))
(define squares (list 1 4 9 16 25))

;;; list-ref
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))


;;; length
;;; recursion
;(define (length items)
;  (if (null? items)
;      0
;      (+ 1 (length (cdr items)))))


;;; iteration
(define (length items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))


;;; append
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))



;;; Exercise 2.17
;;; last-pair
(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))

; > (last-pair odds)
; 7
; > (last-pair squares)
; 25
; > (last-pair (list 23 72 149 34))
; 34

