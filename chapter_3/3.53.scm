;;; Exercise 3.53

;; Integers
(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))
  
(define integers (integers-starting-from 1))


;; No-sevens
(define (divisible? x y)
  (= (remainder x y) 0))
  
(define no-sevens
  (stream-filter (lambda (x) (not (divisible? x 7)))
                 integers))

                 
;; Fibonacci numbers
(define (fibgen a b)
  (cons-stream a (fibgen b (+ a b))))
  
(define fibs (fibgen 0 1))


;; Sieve of Eratosthenes
(define (sieve stream)
  (cons-stream (stream-car stream)
               (sieve (stream-filter (lambda (x) (not (divisible? x (stream-car stream))))
                                     (stream-cdr stream)))))
                                     
(define primes (sieve (integers-starting-from 2)))



;;; Defining streams implicitly
(define ones (cons-stream 1 ones))

(define integers_2 
  (cons-stream 1 (add-streams ones integers_2)))
  
(define fibs_2
  (cons-stream 0 (cons-stream 1 
                              (add-streams (stream-cdr fibs_2) fibs_2))))
                              
(define double (cons-stream 1 (scale-stream double 2)))

(define primes_2
  (cons-stream 2 
               (stream-filter prime? (integers-starting-from 3))))

(define (prime? n)
  (define (iter ps)
    (cond ((> (square (stream-car ps)) n)
           true)
          ((divisible? n (stream-car ps))
           false)
          (else (iter (stream-cdr ps)))))
  (iter primes_2))



;;; Exercise 3.53
(define s (cons-stream 1
                       (add-streams s s)))
;;; s produces the stream of powers of 2.

                                   