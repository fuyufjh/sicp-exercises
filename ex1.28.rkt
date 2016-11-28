#lang racket

(define (square x) (* x x))

(define (non-zero-random n)
  (let ((r (random n)))
    (if (not (= r 0))
        r
        (non-zero-random n))))

(define (nontrival-but-square-get-one? a n)
  (and (not (= a 1))
       (not (= a (- n 1)))
       (= 1 (remainder (square a) n))))

(define (expmod base exp n)
  (cond ((= exp 0) 1)
        ((nontrival-but-square-get-one? base n) 0)
        ((odd? exp) (remainder (* base (expmod base (- exp 1) n)) n))
        ((even? exp) (remainder (square (expmod base (/ exp 2) n)) n))))

(define (miller-rabin n)
  (define (test-iter n times)
    (cond ((= 0 times) #t)
          ((= 1 (expmod (non-zero-random n) (- n 1) n))
           (test-iter n (- times 1)))
          (else #f)))
  (let ((times (ceiling (/ n 2))))
    (test-iter n times)))

; test
(miller-rabin 97)
(miller-rabin 561)