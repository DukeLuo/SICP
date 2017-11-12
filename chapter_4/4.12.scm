;;; Exercise 4.12

;; my answer is wrong!!!
;; base is a sequence and match is a procedure which has a parameter
(define (env-loop var env base match)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((null? vars) base)
            ((eq? var (car vars)) (match vals))
            (else (scan (cdr vars) (cdr vals)))))
    (scan (frame-variables frame)
          (frame-values frame))))

(define (lookup-variable-value var env)
  (env-loop var
            env
            (env-loop (enclosing-environment env))
            car))

(define (set-variable-value var val env)
  (env-loop var
            env
            (env-loop (enclosing-environment env))
            (lambda (x) (set-car! x val))))

(define (define-variable! var val env)
  (env-loop var
            env
            (add-binding-to-frame! var val (first-frame env))
            (lambda (x) (set-car! x val))))

       
