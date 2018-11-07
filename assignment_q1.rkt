#lang racket
(cons 1 2)

(cons 1 (cons 2 (cons 3 empty)))

(cons "MUP" (cons 70 (cons (cons 1 (cons 2 (cons 3 empty))) empty)))

(list "MUP" 70 (list 1 2 3 ))

(append '("MUP") '(70) '((1 2 3)))