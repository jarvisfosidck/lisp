;;
;;
(defun c:weave ( / cnt col cnt2 base bbase thread tread tie_up wrap_colors weft_colors)
     (defun randnum (/ modulus multiplier increment random)

  (if (not seed)

    (setq seed (getvar "DATE"))

  )

  (setq modulus    65536

        multiplier 25173

        increment  13849

        seed  (rem (+ (* multiplier seed) increment) modulus)

        random     (/ seed modulus)

  )

)

  (setq thread '(1 2 3 2 3 4 1 5 6 5 6 4)
	tread '(1 2 3 2 3 4 1 5 6 5 6 4)
	tie_up '((2 4 5) (1 2 3) (2 3 4) (1 3 6) (1 5 6) (4 5 6) )
	wrap_colors '(1 1 1 1 1 1 1 1 1 1 1 1)
	weft_colors '(0 0 0 0 0 0 0 0 0 0 0 0)
	)
  
   (setq base2 (open "c:/thue_base2.txt" "r")
	base3 (open "c:/thue_base3.txt" "r")
	base4 (open "c:/thue_base4.txt" "r")
	spalsh_line_count (fix (* 10000 (randnum)))

	)
    (repeat spalsh_line_count
    (read-line base2)
   (read-line base3)
    (read-line base4)
  )
	
	 
(terpri)
(princ "Pick Base Point of Draft: ")
(setq bbase (getpoint))

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

(foreach r '(0 1 2 3) 
		      (foreach c '(0 1 2 3 4)
					    (setq base (mapcar '+ (list (* c 12) (* r -12)) bbase)
						  )			  
;;repeat the following to continue weave
  (setq cnt2 0
	col 0
	)
			
 ;(setq row_scale 1
       ;col_scale 1
       ;)
  
(foreach i tread (progn
			   
  (foreach j (row_places (nth (1- i) tie_up) thread)
    (progn
      (cond
	((= (nth j wrap_colors) 0) 
    	(ins_p_block "item_a" (list (cons 10 (list (+ j (car base)) (+ col (cadr base)) ))
					     (cons 41 0.5)
					     (cons 42 0.5))
      ))
	((= (nth j wrap_colors) 1)
	 (ins_p_block "item_b" (list (cons 10 (list (+ j (car base)) (+ col (cadr base)) ))
					     (cons 41 0.5)
					     (cons 42 0.5))
	   ))
	((= (nth j wrap_colors) 6)
	 (ins_p_block "item_c" (list (cons 10 (list (+ j (car base)) (+ col (cadr base)) ))
					     (cons 41 0.5)
					     (cons 42 0.5))
	   ))
	((= (nth j wrap_colors) 6)
	 (ins_p_block "item_d" (list (cons 10 (list (+ j (car base)) (+ col (cadr base)) ))
					     (cons 41 0.5)
					     (cons 42 0.5))
	   ))
      )))
  (foreach j (not_row_places (nth (1- i) tie_up) thread)
    (progn 
(cond
	((= (nth cnt2 weft_colors) 0) 
 	 (ins_p_block "item_e" (list (cons 10 (list (+ j (car base)) (+ col (cadr base)) ))
					     (cons 41 0.5)
					     (cons 42 0.5))
	   ))
	((= (nth cnt2 weft_colors) 1)
	 (ins_p_block "item_f" (list (cons 10 (list (+ j (car base)) (+ col (cadr base)) ))
					     (cons 41 0.5)
					     (cons 42 0.5))
	   ))
	((= (nth cnt2 weft_colors) 6)
	 (ins_p_block "item_g" (list (cons 10 (list (+ j (car base)) (+ col (cadr base)) ))
					     (cons 41 0.5)
					     (cons 42 0.5))
	   ))
	       )))
	(setq col (1- col))
	(setq cnt2 (1+ cnt2))
  	);progn
  	);makes one weave 
  ));end repeat rows columns
  
  (terpri) (princ "Weave draft done. . "))(princ)