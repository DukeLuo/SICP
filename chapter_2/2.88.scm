#lang scheme
;;; Exercise 2.88

;; generic negation operation
(define (install-scheme-number-package)
  ;; ...
  (put 'neg '(scheme-number) (tag (lambda (x) (- x))))
  'done)

(define (install-rational-package)
  ;; ...
  (define (neg x)
    (make-rat (- (numer x))
              (denom x)))
  ;; ...
  (put 'neg '(rational)
       (lambda (x) (tag (neg x))))
  'done)

(define (install-complex-package)
  ;; ...
  (define (neg z)
    (make-from-real-imag (- (real z))
                         (_ (imag z))))
  ;; ...
  (put 'neg '(complex)
       (lambda (x) (tag (neg x))))
  'done)

(define (neg x) (apply-generic 'neg x))


;; sub-poly
(define (install-polynomial-package)
  ;; ...
  (define (neg-termlist L)
    (if (empty-termlist? L)
        (the-empty-termlist)
        (adjoin-term (make-term (order (first-term L))
                         (neg (coeff (first-term L))))
                     (neg-termlist (rest-terms L)))))
  ;; ...
  (define (sub-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1)
                   (add-terms (term-list p1) (neg-termlist (term-list p2))))
        (error "Polys not in same var: ADD-POLY" (list p1 p2))))
  ;; ...
  (put 'neg '(polynomial)
       (lambda (p) (tag (make-poly (variable p)
                                   (neg-termlist (term-list p))))))
  (put 'sub '(polynomial polynomial)
       (lambda (p1 p2) (tag (sub-poly p1 p2))))
  'done)

