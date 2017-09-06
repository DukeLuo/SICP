;;; Exercise 3.81

;;; Modularity of Functional Programs and Modularity of Objects
(define (rand-update x)
  (remainder (+ (* 13 x) 5) 24))

(define random-init
  (rand-update (expt 2 32)))

(define random-numbers
  (cons-stream random-init
               (stream-map rand-update random-numbers)))


(define (monte-carlo experiment-stream passed failed)
  (define (next passed failed)
    (cons-stream (/ passed (+ passed failed))
                 (monte-carlo (stream-cdr experiment-stream)
                              passed
                              failed)))
  (if (stream-car experiment-stream)
      (next (+ passed 1.0) failed)
      (next passed (+ failed 1.0))))

(define (map-successive-pairs f s)
  (cons-stream (f (stream-car s) (stream-car (stream-cdr s)))
               (map-successive-pairs f (stream-cdr (stream-cdr s)))))

(define cesaro-stream
  (map-successive-pairs
    (lambda (r1 r2) (= (gcd r1 r2) 1))
    random-numbers))

(define pi
  (stream-map (lambda (p) (sqrt (/ 6 p)))
              (monte-carlo cesaro-stream 0 0)))



;;; Exercise 3.81    
(define (random-generator requests seed) 
  (define s 
    (cons-stream seed 
                 (stream-map (lambda (request value) 
                               (cond ((eq? request 'generate) (rand-update value)) 
                                     ((and (pair? request) (eq? (car request) 'reset)) 
                                      (cdr request)) 
                                     (else (error "Unknown request: random-generator")))) 
                             requests 
                             s))) 
  s)

(define request-stream  
   (cons-stream  
     (cons 'reset 12) 
     (cons-stream 'generate 
                  (cons-stream (cons 'reset 100) 
                               (cons-stream 'generate 
                                            gen-stream)))))

(define test (random-generator request-stream random-init))

;;; reference：http://community.schemewiki.org/?sicp-ex-3.81

     