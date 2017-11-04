;;; Exercise 4.2

a)
;;; 
;;; (eval '(define x 3))    ;;(application? '(define x 3)) => true
;;; (apply (eval 'define env)
;;;        (list-of-values '(x 3) env))
;;; (eval 'define env)   ;;(variable? 'define) => true
;;; (lookup-variable-value 'define env)
;;; When running here, we will get an error, 
;;; because we haven't bound any value with the variable 'define 


b)
(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp) (make-procedure (lambda-parameters exp)
                                       (lambda-body exp)
                                       env))
        ((begin? exp) (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval (cond->if exp) env))
        (else (error "Unknown expression type: EVAL" exp))))

(define (application? exp)
  (tagged-list? exp 'call))

(define (operator exp)
  (cadr exp))

(define (operands exp)
  (cddr exp))


