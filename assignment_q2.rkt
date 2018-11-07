#lang racket

;This is an example implementation of ins_beg,
;It obviously doesn't do what it should, so you
;can edit this function to get started.
;
;Please note the provide function is necessary
;for the unit tests to work. Please include a
;(provide) for each function you write in your
;submitted assignment.
;
;You may delete these comments!

(provide ins_beg)
;A.
(define (ins_beg el1 list1)
  (display "Hello, I'm ins_beg!\n")
  (cons el1 list1)
)
;B.
(define (ins_end el1 list1)
  (display "Hello, I'm ins_end!\n")
  (append list1 (cons el1 empty))
)

;C.
(define (count_top_level list1 length)
  (if (empty? list1)
      (display length)

      (begin
        (set! length ((lambda (length) (+ length 1)) length))
        (set! list1 ((lambda (list1) (cdr list1)) list1))
        (count_top_level list1 length )
      )
      )
)

;D.
(define (count_occurence list1 num)
  (cond
    [(empty? list1) 0]
    [(= num (car list1)) (+ 1 (count_occurence (cdr list1) num))]
    [(not (= num (car list1))) (+ 0 (count_occurence (cdr list1) num))]
      )
)

;E
(define (count_occurence1 list1 num count)
  (cond
    [(empty? list1) count]
    [(= num (car list1)) (begin
                           (set! count ((lambda (count) (+ count 1)) count))
                           (count_occurence1 (cdr list1) num count)
                           )
                         ]
    [(not (= num (car list1))) (count_occurence1 (cdr list1) num count)]
      )
)

;F
(define (count_instance_deep list1 num count)
  (cond
    [(empty? list1) count]
    [(list? (car list1)) (begin (+ (count_instance_deep (car list1) num count) (count_instance_deep (cdr list1) num count))
                                )]
    [(= num (car list1)) (begin
                           (set! count ((lambda (count) (+ count 1)) count))
                           (count_occurence1 (cdr list1) num count)
                           )
                         ]
    [(not (= num (car list1))) (count_occurence1 (cdr list1) num count)]
      )
)