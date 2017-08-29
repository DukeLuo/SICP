;;; Exercise 3.60

(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1)
                  (stream-car s2))
               (add-streams (scale-stream (stream-cdr s1)
                                          (stream-car s2))
                            (mul-series s1
                                        (stream-cdr s2)))))

;;; reference: https://wizardbook.wordpress.com/2010/12/20/exercise-3-60/  
;;;            https://en.wikipedia.org/wiki/Cauchy_product

           