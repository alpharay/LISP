#!/usr/bin/clisp

(defun m-length (list)
  (if (null list)
      0
    (+ 1 (m-length (cdr list)))))

(defun print-list (list)
  (if (not (null list))
      (progn; this is a command essentially for essentially converting the prepended opening parenthesis into an open brace. Just as we would have done '{' in c or c++. The corresponding parenthesis will therefore in the same vain behave as a closing brace(i.e '}') It prevents the line with '(print-list (cdr-list))', from becoming an else statement for the if block. If 'progn' isn't place here, that'll be an else statement.
	(princ (car list))
	(print-list (cdr list)))))

(princ (print-list '(1 2 3 4)));print-list function call
(terpri)

;;For this, we can't assume that the list will contain only numbers. It may contain numbers, symbols or lists. An example of such a constract could be ((((1 5 x) o 1) a) 7 2 3). The function of the program is to extract the numbers in the list and add them up.
(defun sum-numbers (list)
  (cond ; the 'cond' macro is just like an 'if' operator however it accepts multiple conditions in multiple sequences.
   ((null list);condition 1
    0);return value 1.
   ((numberp (car list));condition 2. 'numberp' is a number predicate (a function that tests it's argument(s) for some specific condition and returns nill if the condition is false or some non-nil value if the condition is true) which takes one argument and returns 't' if the argument or nil otherwise.
    (+ (car list) (sum-numbers (cdr list))));return value 2.
   ((symbolp (car list));condition 3. 'symbolp' is a symbol predicate.
    (sum-numbers (cdr list)));return value 3.
   (t ;condition 4. '(listp (car list))' could have been used in place of 't'. However since that is the last condition, just using 't' works here as well.
    (+ (sum-numbers (car list)) (sum-numbers (cdr list))))));return value 4

(princ (sum-numbers '((((1 5 x) o 1) a) 7 2 3)))
