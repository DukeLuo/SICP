;;; Exercise 3.66

;;; Infinite streams of pairs
(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream (list (stream-car s) (stream-car t))
               (interleave (stream-map (lambda (x) (list (stream-car s) x))
                                       (stream-cdr t))
                           (pairs (stream-cdr s) (stream-cdr t)))))



;;; Exercise 3.66
;;; For this problem, I don't know how to start.
;;; Yeah, I have to admit that my math is bad...
;;; reference: https://wizardbook.wordpress.com/2010/12/22/exercise-3-66/

                           