;;; Exercise 3.69

(define (triples s t u)
  (cons-stream (list (stream-car s)
                     (stream-car t)
                     (stream-car u))
               (interleave (stream-map (lambda (x) (cons (stream-car s) x))
                                       (stream-cdr (pairs t u)))
                           (triples (stream-cdr s)
                                    (stream-cdr t)
                                    (stream-cdr u)))))

(define pythagorean-triples 
  (stream-filter (lambda (triple) (= (+ (square (car triple))
                                        (square (cadr triple)))
                                     (square (caddr triple))))
                 (triples integers integers integers)))
                 
                                    