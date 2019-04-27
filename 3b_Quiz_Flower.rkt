;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3bQuiz_Flower) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; a star that grows on the screen where the mouse is clicked.
;; multiple stars can grow on the screen until the screen is cleared.


;; =====================
;; Constants:
(define WIDTH 600)
(define HEIGHT 400)

(define MTS (empty-scene WIDTH HEIGHT "black"))

(define SPEED 1)

(define STARMODE "solid")
(define STARCOLOR "yellow")


;; =====================
;; Data Definitions:

(define-struct starz (s x y))
;; coord is (make-coord Natural [0, WIDTH] Natural [0, WIDTH] Natural [0, HEIGHT])
;; interp. size and the cooridinates of stars
;;       the s is the size of the star in screen pixels
;;       the x is the center of the star in screen pixels
;;       the y is the center of the star in screen pixels

(define CR1 (make-starz 0 (/ WIDTH 2) (/ HEIGHT 2)))

#;
(define (fn-for-starz st)
  (... (starz-s st)     ;Natural [0, WIDTH]
       (starz-x st)     ;Natural [0, WIDTH]
       (starz-y st)))   ;Natural [0, HEIGHT]

;; Template rules used:
;;  - compound: 3 fields



;; =====================
;; Functions:

;; STARZ -> STARZ
;; start the world with (main(make-starz 0 0 0))

(define (main st)
  (big-bang st                   ; STARZ -> STARZ
            (on-mouse  handle-mouse)      ; STARZ Integer Integer MouseEvent -> STARZ
            (on-tick   grow)     ; STARZ -> STARZ
            (to-draw   render)))   ; STARZ -> Image


;; STARZ -> STARZ
;; produce the next star

(check-expect (grow (make-starz 0 (/ WIDTH 2) (/ HEIGHT 2))) (make-starz (+ 0 SPEED) (/ WIDTH 2) (/ HEIGHT 2)))

;(define (grow st) st)  ;stub

;<template from starz>
(define (grow st)
  (make-starz (+ (starz-s st) SPEED) (starz-x st) (starz-y st))) 


;; STARZ -> Image
;; render star image at appropriate place on MTS at starz-x and starz-y

(check-expect (render (make-starz 5 (/ WIDTH 2) (/ HEIGHT 2))) (place-image (star 5 STARMODE STARCOLOR) (/ WIDTH 2) (/ HEIGHT 2) MTS))

;(define (render st) MTS)  ;stub

;<template from starz>
(define (render st)
  (place-image (star (starz-s st) STARMODE STARCOLOR) (starz-x st) (starz-y st) MTS)) 


;; STARZ Integer Integer MouseEvent -> STARZ
;; start a new star at the x y coordinates where the mouse is clicked

(check-expect (handle-mouse (make-starz 10 100 200) 10 50 "button-down") (make-starz 0 10 50))
(check-expect (handle-mouse (make-starz 10 100 200) 10 50 "button-up") (make-starz 10 100 200))

;(define (handle-mouse st x y me) st) ;stub

(define (handle-mouse st x y me)
  (cond [(mouse=? "button-down" me) (make-starz 0 x y)]
        [else st]))