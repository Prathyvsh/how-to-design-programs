#lang racket 
(require lang/htdp-intermediate-lambda)

;; A peg is a boolean

;; A solitaire board is:
;;(vectorof (vectorof peg))

;; A move is
;; (make-move posn posn posn)
(define-struct move (from over to))

(define BOARD-SIZE 3)

;; build-board : number -> (vectorof (vectorof number))
;; Builds a board
(define (build-board size f)
  (cond
   [(= 0 size) (vector)]
   [else (vector-append (vector (build-vector size (lambda (x) 1)))
                        (build-board (sub1 size)))]))

;; board-ref : number number board -> peg
;; Refers to a location in the board
(define (board-ref i j r)
  (vector-ref (vector-ref b i) j))


;; TESTS
(define board (vector (vector 1)
                      (vector 1 1)
                      (vector 1 1 0)
                      (vector 1 1 1 1)))

(equal? (board-ref 0 0 board) 1)
(equal? (board-ref 2 2 board) 0)
