;;; Exercise 4.5

;; Cond
(define (cond? exp)
  (tagged-list? exp 'cond))

(define (cond-clauses exp)
  (cdr exp))

(define (cond-else-clauses? clauses)
  (eq? (cond-predicate clauses) 'else))

(define (cond-predicate clause)
  (car clause))

(define (cond-actions clause)
  (cdr clause))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (cond->if exp env)
  (expand-clauses (cond-clauses exp) env))

(define (cond-additional? exp)
  (and (= (length exp) 3)
       (eq? (cadr exp) '=>)))

(define (cond-recipient clause)
  (caddr clause))

(define (expand-clauses clauses env)
  (if (null? clauses)
    'false
    (let ((first (car clauses))
          (rest (cdr clauses)))
      (if (cond-else-clauses? first)
          (if (null? rest)
              (sequence->exp (cond-actions first))
              (else "ELSE clauses isn't last: COND->IF"
                    clauses))
          (if (cond-additional? first)
              (apply (cond-recipient first) 
                     (eval (con-predicate first) env))
              (make-if (cond-predicate first)
                       (sequence->exp (cond-actions first))
                       (expand-clauses rest env)))))))


;; eval
(define (install-eval-package)
  (put 'eval 'quote text-of-quotation)
  (put 'eval 'set! eval-assignment)
  (put 'eval 'define eval-definition)
  (put 'eval 'if eval-if)
  (put 'eval 'lambda (lambda (exp env)
                       (make-procedure (lambda-parameters exp)
                                       (lambda-body exp)
                                       env)))
  (put 'eval 'begin (lambda (exp env)
                      (eval-sequence (begin-actions exp)
                                     env)))
  (put 'eval 'cond (lambda (exp env)
                     (eval (cond->if exp env)
                           env))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


