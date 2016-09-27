#lang racket

;;; Student Name: Andrew Pan
;;;
;;; Check one:
;;; [x] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).
;;
;; If the key is not found in the list, `assq` returns `#f`.

(define (assq key ass)
	(if (null? ass)
		#f
		(if (eq? (first (first ass)) key)
			(cons key (second (first ass)))
			(assq key (rest ass)))))

(display (assq 'b '((a "apple") (b "banana") (c "canteloupe")))) (newline) ;; -> banana
(display (assq 'd '((a "apple") (b "banana") (c "canteloupe")))) (newline) ;; -> #f

;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.

(define (lookup key ass)
	(if (null? ass)
		#f
		(if (eq? (first (first ass)) key)
			(second (first ass))
			(lookup key (rest ass)))))

(define (calculate x)
  (cond [(integer? x) x]
  		[(equal? (first x) 'ADD) (+ (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
  		[(equal? (first x) 'SUB) (- (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
  		[(equal? (first x) 'MUL) (* (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
  		[(equal? (first x) 'DIV) (/ (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
  		[(equal? (first x) 'GT) (> (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
  		[(equal? (first x) 'LT) (< (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
  		[(equal? (first x) 'GE) (>= (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
  		[(equal? (first x) 'LE) (<= (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
  		[(equal? (first x) 'EQ) (= (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
  		[(equal? (first x) 'NEQ) (= not ((calculate (first (rest x))) (calculate (first (rest (rest x))))))]
  		[(equal? (first x) 'ANDD) (and (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
  		[(equal? (first x) 'ORR) (or (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
  		[(equal? (first x) 'NOTT) (not (calculate (first (rest x))) (calculate (first (rest (rest x)))))]
  		[(equal? (first x) 'IPH) (if (calculate (first (rest x)))
  									(calculate (first (rest (rest x))))
  									(calculate (first (rest (rest (rest x))))))]
  		[(equal? (first x) 'LOOK) (lookup (second x) (third x))]))

(display (calculate '(LOOK c ((a "apple") (b "banana") (c "canteloupe"))))) (newline) ;; -> canteloupe
(display (calculate '(ADD 3 (LOOK b ((a 1) (b 2) (c 3)))))) (newline) ;; -> 5