;;; Exercise 3.73

;;; Streams as signals
(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (add-streams (scale-stream integrand dt)
                              int)))
  int)



;;; Exercise 3.73
(define (RC R-value C-value dt)
  (lambda (i v0)
    (add-streams (scale-stream i R-value)
                 (integral (scale-stream i (/ 1 C-value))
                           v0
                           dt))))

                           