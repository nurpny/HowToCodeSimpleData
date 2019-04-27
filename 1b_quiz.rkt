;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1b-quiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; Image, Image -> Boolean

;; consumes two images and produce true if the first is larger than the second



(check-expect (larger? (circle 5 "solid" "red" ) (rectangle 20 20 "solid" "red")) false)
(check-expect (larger? (circle 5 "solid" "red" ) (rectangle 10 20 "solid" "red")) false)
(check-expect (larger? (circle 5 "solid" "red" ) (rectangle 5 20 "solid" "red")) false)

(check-expect (larger? (circle 5 "solid" "red" ) (rectangle 20 5 "solid" "red")) false)
(check-expect (larger? (circle 5 "solid" "red" ) (rectangle 10 5 "solid" "red")) false)
(check-expect (larger? (circle 5 "solid" "red" ) (rectangle 5 5 "solid" "red")) true)

(check-expect (larger? (circle 5 "solid" "red" ) (rectangle 20 10 "solid" "red")) false)
(check-expect (larger? (circle 5 "solid" "red" ) (rectangle 10 10 "solid" "red")) false)
(check-expect (larger? (circle 5 "solid" "red" ) (rectangle 5 10 "solid" "red")) false)


; (define (larger? img1 img2) true) ;stub


; (define (larger? img1 img2) ;template
;  ... a b )

(define (larger? img1 img2)
  (and (> (image-width img1) (image-width img2))
       (> (image-height img1) (image-height img2))))

