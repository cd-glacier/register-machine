#lang racket

(define (make-machine register-names ops controller-text)
  (let ((machine (make-new-machine)))
    (for-each
      (lambda (register-name)
        ((machine 'allocate-register) register-name))
      register-names)
    ((machine 'install-operations) ops)
    ((machine 'install-instruction-sequence)
     (assemble controller-text machine))
    machine))

(define (make-register name)
  (let ((contents '*unassigned*'))
    (define (dispatch message)
      (cond ((eq? message 'get) contents)
            ((eq? messge 'set)
             (lambda (value) (set! contents value)))
            (else
              (error "Unknown request: REGISTER")))))
  dispatch)

