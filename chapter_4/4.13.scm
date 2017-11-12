;;; Exercise 4.13

;; Removes the element at the specified position in the list
(define (remove list i)
  (define (iter list result i) 
    (if (null? list)
      result
      (if (= i 0)
          (iter (cdr list) result (- i 1))
          (iter (cdr list)
                (cons (car list) result)
                (- i 1)))))
  (if (and (>= i 0)
           (<= i (- (length list) 1)))
      (reverse (iter list '() i))
      (error "The value of i is wrong")))


(define (make-unbound! var env)
  (define (scan vars i)
    (cond ((null? vars) #f)
          ((eq? var (car vars)) i)
          (else (scan (cdr vars) (+ i 1)))))
    
  (define pos (scan (frame-variables (first-frame env)) 0))
  
  (define new-frame
    (if pos
          (let ((frame (first-frame env)))
            (make-frame (remove (frame-variables frame) pos)
                        (remove (frame-values frame) pos)))))

  (let ((remain (enclosing-environment env)))
    (if pos
      (begin (set! env (cons new-frame remain))
             (display env))
      (error "Variable is not in the environment -- MAKE-UNBOUND"))))

;1 ]=> (load "/home/duke/4.13.scm")

;Loading "4.13.scm"...
;Variable required in this context: (first-frame env)
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

;; My answer has bugs. I don't know why, it has taken me several hours, finally, I decided to give up.
;; I will come back, and I believe my method is feasible.


