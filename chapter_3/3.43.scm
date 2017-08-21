;;; Exercise 3.43

;;; Complexity of using multiple shared resources
(define (exchange account1 account2)
  (let ((difference (- (account1 'balance)
                       (account2 'balance))))
    ((account1 'withdraw) difference)
    ((account2 'deposit) difference)))
    
(define (make-account balance) 
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
        
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
    
  (let ((balance-serializer (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'balance) balance)
            ((eq? m 'serializer) balance-serializer)
            (else (error "Unknow request: MAKE-ACCOUNT"
                         m))))
    dispatch))
    
(define (serialized-exchange account1 account2)
  (let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer)))
    ((serializer1 (serializer2 exchange))
     account1
     account2)))
     


;;; Exercise 3.43
;;; The origin version of the exchange program suffers from the same concurrency problems
;;; as unserialised access to a single resource.
;;; reference: https://wizardbook.wordpress.com/2010/12/19/exercise-3-43/

