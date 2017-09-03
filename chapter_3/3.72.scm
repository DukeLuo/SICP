;;; Exercise 3.72

(define (ramanujan-numbers-square)
  (define (square-sum pair)
    (+ (square (car pair))
       (square (cadr pair))))

  (define (selector stream)
    (let ((s0 (stream-ref stream 0))
          (s1 (stream-ref stream 1))
          (s2 (stream-ref stream 2)))
      (cond ((stream-null? stream) 
              the-empty-stream)
            ((= (square-sum s0)
                (square-sum s1)
                (square-sum s2))
             (cons-stream (list s0 s1 s2 (square-sum s0))
                          (selector (stream-cdr stream))))
            (else (selector (stream-cdr stream))))))

  (selector (weighted-pairs integers 
                            integers 
                            square-sum)))

          