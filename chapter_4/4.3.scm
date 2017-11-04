;;; Exercise 4.3

(load "table.scm")

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
                     (eval (cond->if exp)
                           env))))

(install-eval-package)

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((get 'eval (car exp)) ((get 'eval (car exp)) exp env))
        ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else (error "Unknown expression type: EVAL" exp))))


