;;; Exercise 4.6

;;let->combination
(define (let-bindings exp)
  (cadr exp))

(define (let-body exp)
  (cddr exp))

(define (let-var binding-pair)
  (car binding-pair))

(define (let-exp binding-pair)
  (cadr binding-pair))

(define (make-let bindings body)
  (cons 'let 
        (cons bindings body)))

(define (let->lambda exp)
  (make-lambda (map let-var (let-bindings exp))
               (let-body exp)))

(define (let->combination exp)
  (cons (make-lambda exp) 
        (map let-exp (let-bindings exp))))


;;install package of let
(define (install-let-package)
  (put 'eval 'let (lambda (exp env)
                     (eval (let->combination exp)
                           env))))

(install-let-package)


