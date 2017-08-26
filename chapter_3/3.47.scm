;;; Exercise 3.47

(define (make-mutex)
  (let ((cell (list false)))
    (define (the-mutex m)
      (cond ((eq? m 'acquire)
             (if (test-and-set! cell)
                 (the-mutex 'acquire)))
            ((eq? m 'release)
             (clear! cell))))
    the-mutex))

(define (clear! cell)
  (set-car! cell false))

(define (test-and-set! cell)
  (if (car cell)
      true
      (begin (set-car! cell true)
             false)))

;;; a)
(define (make-semaphore n)
  (let ((counter n)
        (mutex (make-mutex)))
    (define (acquire)
      (mutex 'acquire)
      (if (> counter 0)
          (begin (set! counter (- counter 1))
                 (mutex 'release))
          (begin (mutex 'release)
                 (acquire))))

    (define (release)
      (mutex 'acquire)
      (if (= counter n)
          (mutex 'release)
          (begin (set! counter (+ counter 1))
                 (mutex 'release))))

    (define (dispatch m)
      (cond ((eq? m 'acquire) (acquire))
            ((eq? m 'release) (release))
            (else ("UnKnown request: MAKE-SEMAPHORE" m))))
    dispatch))



;;; b)
(define (make-semaphore n)
  (let ((cell (list false))
        (counter n))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
             (if (test-and-set! cell)
                 (the-semaphore 'acquire)
                 (if (> counter 0)
                     (set! counter (- counter 1)))))
            ((eq? m 'release) 
             (if (= counter n)
                 (clear! cell)
                 (begin (set! counter (+ counter 1))
                        (clear! cell))))))

    (define (clear! cell)
      (set-car! cell false))

    (define (test-and-set! cell)
      (if (and (car cell)
               (zero? counter))
          true
          (begin (set-car! cell true)
                 false)))
    the-semaphore))

