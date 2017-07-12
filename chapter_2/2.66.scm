#lang scheme
;;; Exercise 2.66

;;; Sets and information retrieval
(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((equal? given-key (key (car set-of-records)))
         (car set-of-records))
        (else (lookup given-key (cdr set-of-records)))))

;;; Exercise 2.66
(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        (let ((current-key (key (entry set-of-records))))
          ((= given-key current-key)
           (entry set-of-records))
          ((< given-key current-key)
           (lookup given-key (left-branch set-of-records)))
          ((> given-key current-key)
           (lookup given-key (right-branch set-of-records))))))

