#lang scheme
;;; Exercise 2.45

(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(require "2.44.scm")

;;; Higher-order operations
(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (flipped-pairs painter)
  (let ((combine4 (square-of-four identity flip-vert
                                  identity flip-vert)))
    (combine4  painter)))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity
                                  rotate180 flip-vert)))
    (combine4 (corner-split painter n))))

;;; Exercise 2.45
(define (split proc1 proc2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split proc1 proc2) painter (- n 1))))
          (proc1 painter (proc2 smaller smaller))))))

