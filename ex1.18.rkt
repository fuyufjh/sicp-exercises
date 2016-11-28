#lang racket

; given
(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fast-mul a b)
  (define (fast-mul-iter s a b)
    (cond ((= b 0) s)
          ((even? b) (fast-mul-iter s (double a) (halve b)))
          ((odd? b) (fast-mul-iter (+ a s) a (- b 1)))))
  (fast-mul-iter 0 a b))

; test
(fast-mul 8 9)