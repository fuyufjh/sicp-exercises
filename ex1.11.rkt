#lang racket

(define (f1 n)
  (if (< n 3)
      n
      (+ (f1 (- n 1))
         (* 2 (f1 (- n 2)))
         (* 3 (f1 (- n 3))))))

; test
(f1 5)

(define (f2 n)
  (define (f-iter f-1 f-2 f-3 i)
    (if (= i n)
        f-1
        (f-iter (+ f-1 (* 2 f-2) (* 3 f-3))
                f-1
                f-2
                (+ i 1))))
  (if (< n 3)
      n
      (f-iter 2 1 0 2)))

; test
(f2 5)