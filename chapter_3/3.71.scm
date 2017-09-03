;;; Exercise 3.71

(define cube (lambda (x) (* x x x)))

(define (ramanujan-numbers)
  (define (cube-sum pair)
    (+ (cube (car pair))
       (cube (cadr pair))))

  (define (selector stream)
    (let ((s0 (stream-ref stream 0))
          (s1 (stream-ref stream 1)))
      (cond ((stream-null? stream) 
              the-empty-stream)
            ((= (cube-sum s0)
                (cube-sum s1))
             (cons-stream (list s0 s1 (cube-sum s0))
                          (selector (stream-cdr stream))))
            (else (selector (stream-cdr stream))))))

  (selector (weighted-pairs integers 
                            integers 
                            cube-sum)))

                            