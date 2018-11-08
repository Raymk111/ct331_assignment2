#lang racket

(define bst (list (list(list(list '() 1 '()) 2 (list '() 3 '()))4 '()) 5 (list '() 6 (list (list '() 7 '()) 8 (list '() 9 '())))))

(define (traverse tree)
  (cond [(not (empty? (car tree)))  (traverse (car tree))])
  (cond [(not (empty? (cadr tree))) (display (cadr tree))])
  (cond [(not (empty? (caddr tree))) (traverse (caddr tree))])
  )
(traverse bst)

(define (contains tree num)
  (cond
    [(and (not (empty? (car tree))) (< num (cadr tree)))
     (contains (car tree) num)]
    [(and (not (empty? (cadr tree))) (= num (cadr tree)))
     (display #t)]
    [(and (not (empty? (caddr tree))) (> num (cadr tree)))
     (contains (caddr tree) num)]
    [else (display #f)]
        )
  )

(define (insert tree num)
  (cond
    [(empty? tree) (list '() num '())]
    [(and (not (empty? (cadr tree))) (= num (cadr tree)))
     (display "ITEM ALREADY EXISTS")]
    [(> num (cadr tree))
     (cond
       [(empty? (caddr tree)) (reverse (append (list (list '() num '())) (cdr (reverse tree))))]
       [else (list (car tree) (cadr tree) (insert (caddr tree) num))]
       )
     ]
    [else
     (cond
       [(empty? (car tree)) (append (list (list '() num '())) (cdr tree))]
       [else (list (insert (car tree) num) (cadr tree) (caddr tree))]
       )
     ]
    )
  )

(define (insert_list tree lst)
  (cond
    [(empty? lst) tree]
    [(and (not (empty? (car lst))) (not (list? (car lst))))
      (insert_list (insert tree (car lst)) (cdr lst))]
    [else (display "error with tree construction list must not be nested")]
  )
  )

(define (tree_sort lst)
  (traverse (insert_list empty lst))
  )

;F
(define (insert_comp tree num comparator)
  (cond
    [(empty? tree) (list '() num '())]
    [(and (not (empty? (cadr tree))) (= num (cadr tree)))
     (display "ITEM ALREADY EXISTS")]
    [(comparator num (cadr tree))
     (cond
       [(empty? (caddr tree)) (reverse (append (list (list '() num '())) (cdr (reverse tree))))]
       [else (list (car tree) (cadr tree) (insert_comp (caddr tree) num comparator))]
       )
     ]
    [else
     (cond
       [(empty? (car tree)) (append (list (list '() num '())) (cdr tree))]
       [else (list (insert_comp (car tree) num comparator) (cadr tree) (caddr tree))]
       )
     ]
    )
  )

(define (insert_comp_list tree lst comparator)
  (cond
    [(empty? lst) tree]
    [(and (not (empty? (car lst))) (not (list? (car lst))))
      (insert_comp_list (insert_comp tree (car lst) comparator) (cdr lst) comparator)]
    [else (display "error with tree construction list must not be nested")]
  )
  )

(define (compLastEl num1 num2)
  (> (getLastNum num1) (getLastNum num2))
  )

(define (getLastNum num)
  (- num (* (quotient num 10) 10))
  )