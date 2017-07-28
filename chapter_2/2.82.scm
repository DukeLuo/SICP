#lang scheme
;;; Exercise 2.82

;;; this strategy work only for the operation which arguments' type are same
;;; for example,the table has an operation which type is '(t1 t2 t3),and the type of the input item is '(t1 t1 t3)
;;; according to above strategy,we just can get '(t1 t1 t1) and '(t3 t3 t3)
;;; we can't obtain the type which we expect if we use this strategy


(define (apply-generic op . args)
  
  (define (all-coercable? coerce-procs)
    (not (member #f coerce-procs)))
  (define (coerce-args coercion-procs args)
    (map (lambda (coerce-proc arg) 
           (coerce-proc arg))
         coercion-procs
         args))
  
  ;;attempt to coerce all args into a common type among the args
  (define (apply-with-coercion arg-types)
    
    ;;attempt to coerce all args using each tag-type in turn
    ;;it's a scoped procedure to keep the original arguments (arg-types) for error reporting
    (define (coerce-types tags)
      (if (null? tags)    ;;all targets exhausted 
          (error "No method for these types - APPLY-GENERIC"
                 (list op arg-types))
          (let ((target-type (car tags)))
            (let ((arg-coercions (map    ;;get all the coercion procedures from the target
                                  (lambda (coerce-from)
                                    (if (eq? coerce-from target-type)
                                        identity
                                        (get-coercion coerce-from target-type)))
                                  arg-types)))
              (if (all-coercable? arg-coercions)
                  (apply apply-generic    ;;the target type is valid if all the args can be coerced
                         op
                         (coerce-args arg-coercions args))    ;;target-type is not valid, so try the next one in the list
                  (coerce-types (cdr tags)))))))
      (coerce-types arg-types))
   
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (apply-with-coercion type-tags)))))

;;; Reference: https://wizardbook.wordpress.com/2010/12/08/exercise-2-82/

