#!/usr/bin/clisp

;; The reason for the 'quote' operator is that sometimes you just want to work on a list such as (1 2 3 4 5). So you'll have to quote it like so (quote (1 2 3 4 5)). Otherwise is this (1 2 3 4 5) is done instead, lisp tries to evaluate a function '1' with the other values 2,3,4,5 taken as parameters which obviously is wrong.

(princ (quote 5)) ;quote operator tells lisps not to evaluate but just as the word quote suggests, to only quote the value.
(terpri)
(princ '5); This is the same as the line two places above.

#|Symbols are a bit difficult to explain why they are important in language. As you become a better and better lisp programmer, you get to appreciate them more and more. As you get into packages, you kind of hate them more. Using the c program template below, notice how in not place in the code is PRINT is equal to zero used. We are only using PRINT and READ for their symbolic value. As programmers the symbols are used to basically improve code readablility in future.

enum command {PRINT = 0, READ};

void doCommand(enum command c)
{
if (c == PRINT)
printf(...);
else if( c == READ)
scanf(...);
}
|#


;;writing the lisp version of the code below (Symbols in lisp). We are only using 'c' below, for it's symbolic value (i.e if it's 'print' or 'read'. We do not care of the value of 'print' or 'read'. So symbols could be considered as little constants.
(defun do-command (c)
  (if (eq c 'print)
      (princ 'print)
    (if (eq c 'read)
	(read 'here))))

(terpri)
(do-command 'print); our function call


;;Lists. For lists, there are two functions that are basically important. These are 'car' and 'cdr'. 'car' gives us the header of the list. 'cdr' gives us everything other than the header of the list.
(terpri)
(princ (car '(a b c)))
(car '(b c))
(car ())

(cdr '(a b c))
(cdr '(b c))
(cdr ())

;;Two cases.
;; nil => 0
;; a->(more numbers) =>
;;PNB:Recursive function using 'car' and 'cdr'
(defun sum (list)
  (if (null list)
      0
    (+ (car list) (sum(cdr list))))
  )

(terpri)
(princ (sum '(1 2 3 4))); our defined function 'sum' called here.
