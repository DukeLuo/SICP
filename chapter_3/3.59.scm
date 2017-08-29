;;; Exercise 3.59

;;; a)
(define (div-streams s1 s2)
  (stream-map / s1 s2))
(define (integrate-series s)
  (div-streams s integers))


;;; b)
(define exp-series 
  (cons-stream 1 (integrate-series exp-series))) 

(define cosine-series
  (cons-stream 1 (integrate-series sine-series)))

(define sine-series
  (cons-stream 0 (scale-stream (integrate-series cosine-series) -1)))

  