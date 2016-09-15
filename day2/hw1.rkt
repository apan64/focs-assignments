#lang racket

;;; Student Name: Andrew Pan
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;     NOTE:  You need not worry about error checking in the programs below.

;; 1.  WRITE SQUARE:  given n, returns n^2.  Hint:  use *
(define (square x)
  (* x x))
  
(display (square 2)) (newline)  ;; -> 4

;; 2.  WRITE is-right-triangle:  given three numbers, returns true iff the third
;;     could be the hypotenuse of a right triangle with the specified three side lengths
;;     Hint:  use = to compare numeric values

(define (is-right-triangle arg1 arg2 arg3)
  (= (+ (square arg1) (square arg2)) (square arg3)))
  
(display (is-right-triangle 3 4 5)) (newline)  ;; -> #t
(display (is-right-triangle 4 5 6)) (newline)  ;; -> #f

;; 3.  WRITE FACTORIAL:  given n, returns n!
;;     Hint:  recursion is your friend
(define (fact n)
	(if(= n 1)
		1
		(* n (fact (- n 1)))))
;;  (cond [(= n 1) (1)]
;;  		[else (* n (fact (- n 1)))]))

(display (fact 1)) (newline) ;; -> 1
(display (fact 2)) (newline) ;; -> 2
(display (fact 3)) (newline) ;; -> 6

;; 4.  WRITE FIBONACCI:  given n, returns the nth fibonacci number as shown below
;;     Hint:  don't run this on really big numbers!
(define (fib n)
   (cond [(= n 1) 1]
   		[(= n 0) 0]
   		[else (+ (fib (- n 2)) (fib (- n 1)))]))

(display (fib 1)) (newline) ;; -> 1
(display (fib 2)) (newline) ;; -> 1
(display (fib 3)) (newline) ;; -> 2
(display (fib 4)) (newline) ;; -> 3
(display (fib 5)) (newline) ;; -> 5
(display (fib 6)) (newline) ;; -> 8

;; 5.  WRITE a procedure that takes a list of numbers and returns the sum of those numbers
;;     Hint:  first, rest, cons
(define (sum lst)
  (cond [(null? lst) 0]
  		[else (+ (first lst) (sum (rest lst)))]))

(display (sum '(1 2 3 4))) (newline) ;; -> 10
(display (sum '(1 20 300))) (newline) ;; -> 321

;; 6.  WRITE a procedure that takes a list of numbers and returns the largest one.
;;     While there are solutions using scheme's built-in max, we were actually hoping you'd do something else...
(define (my-max lst)
	(my-max-helper (first lst) (rest lst)))

(define (my-max-helper cur lst)
	(if (null? lst)
		cur
		(if (> cur (first lst))
			(my-max-helper cur (rest lst))
			(my-max-helper (first lst) (rest lst)))))

;;  (cond [(= (length lst) 1) (first lst)])
;;  (define maxRest (my-max (rest lst)))
;;  (if (> (first lst) maxRest)
;;  	(first lst)
;;  	maxRest))


(display (my-max '(1 10 2 20 3))) (newline) ;; -> 20
(display (my-max '(1))) (newline)
