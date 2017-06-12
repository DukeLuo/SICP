#lang scheme
;;; Exercise 2.32

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x)
                            (cons (car s) x))
                          rest)))))

; if the set is (2 3)
; then its set of all subsets is
; (() (3) (2) (2 3))
; If we add an additional element to the the set (1 2 3)
; then its set of all subsets is the union of the set of all subsets of the original set (2 3) and this set of subsets:
; ((1) (1 3) (1 2) (1 2 3))
; which is the set of all subsets of (2 3) with a new element, 1, added to each

