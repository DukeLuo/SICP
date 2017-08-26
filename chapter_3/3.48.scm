;;; Exercise 3.48

(define (make-account balance)
  (define id (generate-account-id))

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
            ((eq? m 'id) id)
            (else (error "Unknow request: MAKE-ACCOUNT"
                         m))))
    dispatch))

(define (counter)
  (let ((i 0))
    (lambda () (set! i (+ i 1))
               i)))

(define generate-account-id (counter))

(define (exchange account1 account2)
  (let ((difference (- (account1 'balance)
                       (account2 'balance))))
    ((account1 'withdraw) difference)
    ((account2 'deposit) difference)))

(define (serialized-exchange account1 account2)
  (define (serialized a1 a2)
    (let ((serializer1 (account1 'serializer)))
      (let ((serializer2 (account2 'serializer)))
        ((serializer1 (serializer2 exchange))
         account1
         account2))))
  (let ((id1 (account1 'id))
        (id2 (account2 'id)))
    (if (< id1 id2)
        (serialized account1 account2)
        (serialized account2 account1))))
        
reference: http://sicp.readthedocs.io/en/latest/chp3/48.html

