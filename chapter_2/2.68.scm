#lang scheme
;;; Exercise 2.68

(require "2.67.scm")

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (has-symbol? symbol tree)
  (member symbol (symbols tree)))

(define (encode-symbol symbol tree)
  (if (leaf? tree)
      '()
      (let ((left (left-branch tree))
            (right (right-branch tree)))
        (cond ((has-symbol? symbol left)
               (cons 0 (encode-symbol symbol left)))
              ((has-symbol? symbol right)
               (cons 1 (encode-symbol symbol right)))
              (else (error "bad symbol: ENCODE-SYMBOL" symbol))))))

