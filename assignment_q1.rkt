#lang racket
(cons 1 2)

(cons 1 (cons 2 (cons 3 empty)))

(cons "MUP" (cons 70 (cons (cons 1 (cons 2 (cons 3 empty))) empty)))

(list "MUP" 70 (list 1 2 3 ))

(append '("MUP") '(70) '((1 2 3)))

;PART B:

;cons is for constructing pairs of elements in either a dotted or proper list
;to construct a proper list with cons the last element must be paired with empty or '()

;append on the other hand only takes lists and concatenates their top level elements to one list

;list takes any number of lists and elements and concatenates them all together on a new list one step up
;each element being an element in the list and each list being an element