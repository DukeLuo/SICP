#lang scheme
;;; Exercise 3.2

(define (make-monitored proc)
  (define counter 0)
  (define (how-many-calls?) counter)
  (define (reset-count)
    (set! counter 0))
  (define (dispatch m)
    (cond ((eq? m 'how-many-calls?) (how-many-calls?))
          ((eq? m 'reset-count) (reset-count))
          (else (set! counter (+ counter 1))
                (proc m))))
  dispatch)

