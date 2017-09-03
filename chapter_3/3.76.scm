;;; Exercise 3.76

(define (smooth stream)
  (define (helper stream last-value last-avg)
    (let ((avpt (/ (+ (stream-car stream)
                      last-value)
                   2.0)))
      (cons-stream avpt
                   (helper (stream-cdr stream)
                           (stream-car stream)
                           avpt))))
   
  (helper stream 0 0))

(define (make-zero-crossings input-stream)
  (let ((smoothed-stream (smooth input-stream)))
    (stream-map sign-change-detector
                smoothed-stream
                (stream-cdr smoothed-stream))))
                
;;; https://wizardbook.wordpress.com/2010/12/23/exercise-3-76/                
;;; yeah, it's more elegant...

