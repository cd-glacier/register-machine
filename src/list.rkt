#lang racket

(define (set-cdr! target li)
  (cond ((list? li) (error "ERROR set-cdr!: arguments is not list"))
        (else (cons (car li) target))))

(define (tagged-list? exp tag)
  (if (pair? exp)
    (eq? (car exp) tag)
    false))

(provide set-cdr!)
(provide tagged-list?)
