;;; Exercise 3.52

(define sum 0)
;;; sum 0
(define (accum x) (set! sum (+ x sum)) sum)
;;; sum 0
(define seq
  (stream-map accum
              (stream-enumerate-interval 1 20)))
;;; sum 1
(define y (stream-filter even? seq))
;;; sum 6
(define z 
  (stream-filter (lambda (x) (= (remainder x 5) 0))
                 seq))
;;; sum 10
(stream-ref y 7)
;;; sum 136
(display-stream z)
;;; sum 210
;;; 
;;; 10
;;; 15
;;; 45
;;; 55
;;; 105
;;; 120
;;; 190
;;; 210

;;; Without using the optimization, the value will never be stored,
;;; And in this problem, each time calculating the seq will get different result,
;;; because accum using assignment operation, it will update the value of sum.
;;; We just need to extract the value which is stored rather than calculating again when we using the optimization.

