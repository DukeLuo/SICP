#lang scheme
;;; Exercise 2.84

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (eq? type1 type2)
                    (error "No method for these types"
                                     (list op type-tags))
                    (let (target-type (higher-type type1 type2))
                      (cond ((eq? target-type type1)
                             (apply-generic op a1 (raise a2)))
                            ((eq? target-type type2)
                             (apply-generic op (raise a1) a2))
                            (else (error "No method for these types"
                                         (list op type-tags)))))))
              (error "No method for these types"
                     (list op type-tags)))))))

(define (type-level z) (apply-generic 'type-level z))
...
...
(put 'type-level '(integer) (lambda (x) 1))
...
...
(put 'type-level '(rational) (lambda (x) 2))
...
...
(put 'type-level '(real) (lambda (x) 3))
...
...
(put 'type-level '(complex) (lambda (x) 4))

(define (higher-type t1 t2)
  (let ((level1 (type-level t1))
        (level2 (type-level t2)))
    (cond ((> level1 level2) t1)
          ((< level1 level2) t2)
          (else (error "THEY ARE SAME TYPE")))))

