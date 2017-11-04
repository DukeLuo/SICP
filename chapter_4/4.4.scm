;;; Exercise 4.4
;; and-eval and or-eval
(define (eval-and exp env)
  (if (null? (cdr exp))
      (car exp)
      (let ((first (eval (car exp) env)))
        (let ((rest (cdr exp)))
          (if (zero? first)
              #f
              (eval-and rest env))))))

(define (eval-or exp env)
  (if (null? exp)
      #f
      (let ((first (eval (car exp) env)))
        (let ((rest (cdr exp)))
          (if (zero? first)
              (eval-or rest env)
              first)))))


;; install package of and and or
(define (install-and-or-package)
  (put 'eval 'and (lambda (exp env)
                          (eval-and (cdr exp) env)))
  (put 'eval 'or (lambda (exp env)
                         (eval-or (cdr exp) env))))

(install-and-or-package)


