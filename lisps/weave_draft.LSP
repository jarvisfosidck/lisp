;;
;;
(defun c:weave ( / cnt col cnt2 base );thread tread tie_up wrap_colors weft_colors)
;(setq thread '(1 2 3 4 1 2 3 4)
;      tread '(1 1 2 2 3 3 4 4)
;      tie_up  '((1 2) (3 4) (1 2) (3 4))
;      )
;  (setq thread '(1 2 3 4 1 2 3 4)
;	tread '(2 1 2 1 2 1 2 1)
;	tie_up '((1 3) (2 4))
;	wrap_colors '(1 1 0 0 1 1 0 0)
;	weft_colors '(0 0 1 1 0 0 1 1)
;	)
;  (setq thread '(1 2 3 2 3 4 1 5 6 5 6 4)
;	tread '(1 2 3 2 3 4 1 5 6 5 6 4)
;	tie_up '((2 4 5) (1 2 3) (2 3 4) (1 3 6) (1 5 6) (4 5 6) )
;	wrap_colors '(1 1 1 1 1 1 1 1 1 1 1 1)
;	weft_colors '(0 0 0 0 0 0 0 0 0 0 0 0)
;	)
  (setq tcnt 1
	thread '()
	)
  (repeat 255
    (setq thread (append thread (list tcnt)))
    (setq tcnt (1+ tcnt))
    (if (= tcnt 32) (setq tcnt 1))
    )
  (setq tcnt 1
	tread '()
	)
  (repeat 119
    (setq tread (append tread (list tcnt)))
    (setq tcnt (1+ tcnt))
    (if (= tcnt 20) (setq tcnt 1))
    )
  (setq tie_up '(
(1 2 4 5 6 8 9 10 12 13 14 17 18 22 26 30)
(7 8 9 11 12 13 15 16 17 21 25 29 31 32)
(5 10 11 12 14 15 16 19 20 24 28 29 30)
(2 6 11 13 14 15 17 18 19 22 23 27 28)
(3 7 12 13 14 16 17 18 20 21 22 25 26 27 31)
(4 8 9 13 15 16 17 19 20 21 23 24 25 26 32)
(1 5 6 9 10 14 15 16 18 19 20 22 23 24 29)
(2 3 6 7 10 11 17 18 19 21 26 30)
(3 4 5 7 8 9 11 12 15 23 27 31 32)
(1 2 4 5 6 8 9 10 12 13 16 20 24 28 32)
(1 2 3 5 6 7 9 10 11 13 14 17 21 25 29 30)
(2 3 4 6 7 8 15 16 18 22 26 30 31 32)
(1 3 4 5 10 17 18 19 23 27 28 31 32)
(1 2 4 9 13 19 20 21 24 25 28 29 30 32)
(1 2 3 8 12 16 20 21 22 25 26 27 29 30 31)
(2 6 7 11 15 21 22 23 24 26 27 28 30 31 32)
(1 5 6 10 14 18 23 24 25 27 28 29 31 32)
(4 5 8 9 12 13 17 21 26 28 29 30)
(3 4 6 7 8 11 12 16 20 24 32)
(2 3 5 6 7 9 10 11 14 15 19 23 27 31)
		 )
	)
	
	(repeat 256
	  (setq wrap_colors (append wrap_colors (list 1)))
	  )
	 (repeat 120
	(setq weft_colors (append weft_colors (list 0)))
	   )
	 
(terpri)
(princ "Pick Base Point of Draft: ")
(setq base (getpoint))
(setq col 0
      cnt2 0
      )
    (defun ins_p_block (name blist / )
  (entmake (append (list (cons 0 "insert") (cons 2 name)) blist))
  )
  
(defun row_places (tieup thread_list / cnt row_list)
	(setq cnt 0
      		row_list '()
      		)

	(foreach x thread_list (progn (cond ((member x tieup)
				     (setq row_list (append row_list (list cnt)))
				     ))
				     (setq cnt (1+ cnt))
				     )
				    )
	(setq row_list row_list)
  );defun
  
  (defun not_row_places (tieup thread_list / cnt row_list)
	(setq cnt 0
      		row_list '()
      		)

	(foreach x thread_list (progn (cond ((not (member x tieup))
				     (setq row_list (append row_list (list cnt)))
				     ))
				     (setq cnt (1+ cnt))
				     )
				    )
	(setq row_list row_list)
   	);defun

;;repeat the following to continue weave
  (setq cnt2 0)
 ;(setq row_scale 1
       ;col_scale 1
       ;)
  
(foreach i tread (progn
			   
  (foreach j (row_places (nth (1- i) tie_up) thread)
    (progn
      (cond
	((= (nth j wrap_colors) 0) 
    (ins_p_block "crataegus_crusgalli" (list (cons 10 (list (+ j (car base)) (+ col (cadr base)) ))
					     (cons 41 0.025)
					     (cons 42 0.025))
      ))
	((= (nth j wrap_colors) 1)
	 (ins_p_block "panicum_virgatum_dallas_blues" (list (cons 10 (list (+ j (car base)) (+ col (cadr base)) ))
					     (cons 41 0.05)
					     (cons 42 0.05))
	   ))
	 
      )))
  
  (foreach j (not_row_places (nth (1- i) tie_up) thread)
    (progn 
(cond
	((= (nth cnt2 weft_colors) 0) 
    (ins_p_block "crataegus_crusgalli" (list (cons 10 (list (+ j (car base)) (+ col (cadr base)) ))
					     (cons 41 0.025)
					     (cons 42 0.025))
      ))
	((= (nth cnt2 weft_colors) 1)
	 (ins_p_block "panicum_virgatum_dallas_blues" (list (cons 10 (list (+ j (car base)) (+ col (cadr base)) ))
					     (cons 41 0.05)
					     (cons 42 0.05))
	   ))
	       )))
	(setq col (1- col))
	(setq cnt2 (1+ cnt2))
	
  	);progn
  	)
  
  
  (terpri) (princ "Weave draft done. . "))(princ)