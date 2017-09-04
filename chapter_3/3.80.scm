;;; Exercise 3.80

(define (RLC R L C dt)
  (lambda (vc0 il0)
    (define vc (integral (delay (scale-stream il (/ -1 C)))
                         vc0
                         dt))
                       
    (define il (integral (delay (add-streams (scale-stream il (/ (- R) L))
                                             (scale-stream vc (/ 1 L))))
                         il0
                         dt))
  
    (define result-pairs (stream-map cons vc il))
  
    result-pairs))

