#lang racket

(define (fast-expt b n)
  (define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter (* b b) (/ n 2) a))
          ((odd? n) (fast-expt-iter b (- n 1) (* a b)))))
  (fast-expt-iter b n 1))

; test
(fast-expt 2 10)