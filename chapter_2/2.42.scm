#lang scheme
;;; Exercise 2.42

(require "2.40.scm")
(require "2.33.scm")
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))


(define empty-board '())

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define (safe? k positions)
  (define (iter new-row rest-of-queens i)
    (if (null? rest-of-queens)
        #t
        (let ((current-row (car rest-of-queens)))
          (if (or (= new-row current-row)
                  (= new-row (+ current-row
                                i))
                  (= new-row (- current-row
                                i)))
              #f
              (iter new-row (cdr rest-of-queens) (+ i 1))))))
  (iter (car positions) (cdr positions) 1))

