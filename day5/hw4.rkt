#lang racket

;;; Student Name: Andrew Pan
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or esexprternal resources.
;;; [x] I completed this assignment with assistance from Anne
;;;     and/or using these esexprternal resources: ___

(define (run-repl)
  (display "welcome to my repl.  type some scheme-ish")
  (repl '()))

(define (repl ass)
  (display "> ")
  (display (myeval (read) ass))
  (newline)
  (repl ass))

(define operator-list
   (list (list 'ADD +)
         (list 'SUB -)
         (list 'MUL *)
         (list 'DIV /)
         (list 'GT >)
         (list 'LT <)
         (list 'GE >=)
         (list 'LE <=)
         (list 'EQ =)
         (list 'NEQ (lambda (x y) (not (= x y))))
         (list 'ANND (lambda (x y) (and x y))) ;; 
         (list 'ORR (lambda (x y) (or x y)))
         (list 'NOTT (lambda (x y) (not x y)))
         (list 'IPH (lambda (x y z) (if x y z)))
         (list 'LOOK (lambda (x y) (lookup x y)))))   ;; 


(define (myeval sexpr ass)
	(if (false? (lookup sexpr ass))
	  (cond [(number? sexpr) sexpr]
	  		[(and (list? (first sexpr))(equal? (first (first sexpr)) 'LAMBDA)) (apply-proc sexpr ass)]
	  		[(equal? (first sexpr) 'DEFINE) (repl (append ass (list (list (second sexpr) (third sexpr)))))]
	  		[(equal? (first sexpr) 'LAMBDA) (cons sexpr ass)]
	  		[(= (length sexpr) 3) ((lookup (first sexpr) operator-list) (myeval (second sexpr) ass) (myeval (third sexpr) ass))]
	  		[(= (length sexpr) 4) ((lookup (first sexpr) operator-list) (myeval (second sexpr) ass) (myeval (third sexpr) ass) (myeval (fourth sexpr) ass))]
	  		[else (display "Could not run function")])
	  	(lookup sexpr ass)))

(define (apply-proc sexpr ass)
	(myeval (third (first sexpr)) (apply-proc-helper (second (first sexpr)) (rest sexpr)))
	)

(define (apply-proc-helper params args)
	(if (null? params)
		'()
		(cons (list (first params) (myeval (first args) '())) (apply-proc-helper (rest params) (rest args)))))


(define (lookup key ass)
	(if (null? ass)
		#f
		(if (eq? (first (first ass)) key)
			(second (first ass))
			(lookup key (rest ass)))))

(display (run-repl)) (newline)