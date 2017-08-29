;;; Exercise 3.62

(define (div-series s1 s2)
  (let ((den-constant (stream-car s2)))
    (if (zero? den-constant)
        (error "DIV-SERIES -- denominator constant term must be non-zero")
        (mul-series s1
                    (invert-unit-series s2)))))
              
(define tangent-series
  (div-series sine-series cosine-series))
  
