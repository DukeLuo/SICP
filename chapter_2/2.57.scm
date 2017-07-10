#lang scheme
;;; Exercise 2.57

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        (else
         (error "unknow expression type: DERIV" exp))))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s)
  (let ((tail-operand (cddr s)))
    (if (zero? (length tail-operand))
        (car tail-operand)
        (apply make-sum tail-operand))))

(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define (multiplier s) (cadr s))
(define (multiplicand s)
  (let ((tail-operand (cddr s)))
        (if (zero? (length tail-operand))
            (car tail-operand)
            (apply make-product tail-operand))))


(define (=number? exp num) (and (number? exp) (= exp num)))

(define (non-number? x) (not (number? x)))

(define (number-args args)
  (filter number? args))

(define (non-number-args args)
  (filter non-number? args))

(define (make-sum . args)
  (let ((number-items (apply + (number-args args)))
        (non-number-items (non-number-args args)))
    (cond ((zero? number-items) (if (= (length non-number-items) 1)
                                  (car non-number-items)
                                  (cons '+ non-number-items)))
          ((null? non-number-items) number-items)
          (else (cons '+ (cons number-items non-number-items))))))

(define (make-product . args)
  (let ((number-items (apply * (number-args args)))
        (non-number-items (non-number-args args)))
    (cond ((zero? number-items) 0)
          ((= number-items 1) (if (= (length non-number-items) 1)
                                  (car non-number-items)
                                  (cons '* non-number-items)))
          ((null? non-number-items) number-items)
          (else (cons '* (cons number-items non-number-items))))))

