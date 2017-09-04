;;; Exercise 3.79

(define (solve-2nd f dt y0 dy0)
  (define y (integral (delay dy) y0 dt))
  (define dy (integral (delay dyy) dy0 dt))
  (define dyy (stream-map f dy y))
  y)

  