;;; Exercise 4.1
;; left to right
(define (list-of-values exps env)
  (if (no-operands? exp)
      '()
      (let ((left (eval (first-operand exps) env)))
        (let ((right (list-of-values (rest-operands exps) env)))
          (cons left right)))))


;; right to left          
(define (list-of-values exps env)
  (if (no-operands? exp)
      '()
      (let ((right (list-of-values (rest-operands exps) env)))
        (let ((left (eval (first-operand exps) env)))
          (cons left right)))))


          