;;; Exercise 3.64

(define (stream-limit stream tolerance)
  (cond ((stream-null? stream) null)
        ((stream-null? (stream-cdr stream))
         (stream-car stream))
        (else (let ((s0 (stream-ref stream 0))
                    (s1 (stream-ref stream 1)))
                (if (< (abs (- s0 s1)) 
                       tolerance)
                    s1
                    (stream-limit (stream-cdr stream) tolerance))))))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

        