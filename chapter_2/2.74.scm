#lang scheme
;;; Exercise 2.74

; a)
; Headquarters must create its own file structure that contains the division name
; and the original file from the division
(define (make-HQ-files division-name division-files)
  (cons division-name division-files))
(define (division-name HQ-files)
  (car HQ-files))
(define (division-files HQ-files)
  (cdr HQ-files))

; each individual divisions' files should have a get-record method to return the employee's record
; and a has-employee? method return true if the given key in this files,otherwise return false
(define (get-record employee-name HQ-files)
  ((get 'get-record (division-name HQ-files))
   employee-name (division-files HQ-files)))

(define (has-employee? employee-name HQ-files)
  ((get 'has-employee? (division-name HQ-files))
   employee-name (division-files HQ-files)))

; b)
; each individual divisions' files should have a get-salary method
; which can return the salary information of the given record
(define (get-salary employee-name HQ-files)
  (let ((record (get-record employee-name HQ-files)))
    ((get 'get-salary (division-name HQ-files))
     record)))

; c)
(define (find-employee-record employee-name files)
  (cond ((null? files)
         (error "No such employee: FIND-EMPLOYEE-RECORD" employee-name))
        ((has-employee? employee-name (car files))
         (get-record employee-name (car files)))
        (else (find-employee-record employee-name (cdr files)))))
        
; d)
(define (install-new-division)
  (put 'new-division-name 'has-employee? has-employee?-new)
  (put 'new-division-name 'get-record get-record-new)
  (put 'new-division-name 'get-salary get-salary-new)
  'done)

