#lang racket

(define eps 1e-6)

(define (cube-root-iter old-guess x)
  (define (improve y x)
    (/ (+ (/ x (* y y)) (* 2 y)) 3))
  (define (good-enough? old-guess new-guess)
    (> eps
       (/ (abs (- new-guess old-guess))
          old-guess)))
  (let ((new-guess (improve old-guess x)))
    (if (good-enough? old-guess new-guess)
        new-guess
        (cube-root-iter new-guess x))))

(define (cube-root x)
  (cube-root-iter 1.0 x))

; test
(cube-root 5)