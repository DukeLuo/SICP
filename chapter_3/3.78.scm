;;; Exercise 3.78

(define (solve-2nd a b dt y0 dy0)
  (define y (integral (delay dy) y0 dt))
  (define dy (integral (delay dyy) dy0 dt))
  (define dyy (add-streams (scale-stream y b)
                           (scale-stream dy a)))
  y)

  