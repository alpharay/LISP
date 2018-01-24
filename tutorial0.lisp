#!/usr/bin/clisp
(let (var) ;var not initialized
  (princ var);notice that this is 'princ' and not 'print'
  (terpri)
  ) 

(let ((x 5) (y 3)) ;initializing x and y. 'let' keyword used variable declaration
  (princ x)
  (terpri) ;for printing a new line
  (princ y)
  (terpri)
  (princ (+ x y)) ;polish notation. Reverse polish notation is 'x y +'. Infix notation which is nomally used in most programming languages would have been 'x+y'.
  (terpri)
  )

(let (var (x 3) (y 3)) ;combining uninitialized variables and initialized ones.
  (princ (* x y))
  var
  )



(let* ((x 5) (y x));However you can use 'let*'
  (terpri)
  (princ y); variable 'y' should now have the value of 'x'.
  )

#|
Using 'setq'. This is akin to doing something something like 'x = 5' in c or c++.
|#
(let (x)
  (princ x);prints nill. x has not been set
  (terpri);for newlien
  (setq x 5)
  (princ x);prints 5
  (+ 1333 x))

=> 1337

;; 'defun' keyword used to define functions
(defun square (x)
  (princ x)
  (* x x)
  )

(defun mult (x y)
  (*x y))
