#lang racket

(require (file "assignment_q2.rkt")
         (file "assignment_q3.rkt"))

;
;Don't worry about this file unless you are doing the extra credit tests. 
;

;This structure allows a single function call
;to run every test in sequence, rather than
;calling each function separately. 
(define (runTests)
  (begin
    (display "Running tests...\n")
    ;begin calling test functions
    (printf "1: ~a\n" (test_ins_beg1))
    (printf "2: ~a\n" (test_ins_end1))
    (printf "3: ~a\n" (test_count_top_level))
    (printf "4: ~a\n" (test_count_occurence))
    (printf "5: ~a\n" (test_count_occurence1))
    (printf "6: ~a" (test_count_instance_deep))
    ;end calling test functions
    (display "\nTests complete!\n"))
  )

;Begin test functions
(define (test_ins_beg1)
  (equal? (ins_beg 1 '(2 3 4)) '(1 2 3 4)))

(define (test_ins_end1)
  (equal? (ins_end 1 '(2 3 4)) '(2 3 4 1)))

(define (test_count_top_level)
  (equal? (count_top_level (list 1 (list 2 (list 0 5) 3 4) 0) 0 ) 1))

(define (test_count_occurence)
  (equal? (count_occurence (list 1 2 5 4 5 3 5) 5) 3))

(define (test_count_occurence1)
  (equal? (count_occurence1 (list 1 2 3 4 5 3 5) 3 0) 2))

(define (test_count_instance_deep)
  (equal? (count_instance_deep (list 1 (list 2 (list 0 5) 3 4)) 0) 1))

;End test functions

;Run the tests
(runTests)