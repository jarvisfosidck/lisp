;;Jarvis Fosdick
;;Add x_y option
;;06-03-05
;;replace old dxmx to work with newer versions, i.e. ACAD2006
;;this file is dxmxv02.lsp
(DEFUN C:DXMX
	      (/ var_list NUM tent kwd tn );mtxt SS)

  ;;=======================================================================================
  ;;Error & Internal Functions
  (setq	var_list (list
		   (cons "cmdecho" (getvar "cmdecho"))
		   (cons "clayer" (getvar "clayer"))
		 )
  )


  (defun restore_user (/)
    ;;restores user system vars
    ;;changed with this program

    (setvar "cmdecho" (cdr (assoc "cmdecho" var_list)))
    (setvar "clayer" (cdr (assoc "clayer" var_list)))

  )					;defun (princ)


  (defun *error* (str)
    (restore_user)
    (Princ "\n Oops! ")
    (terpri)
    (princ str)
    (princ)
  )					;defun (princ)
  (command "undo" "mark")
  (princ)
  ;;==========================================================================================
(defun pop (alist obj / new_list) 
(foreach x alist (cond ((/= x obj)
		   (setq new_list (append new_list (list x)))
		));cond
	);foreach
(setq new_list new_list)
);defun
;;
;;
;;
(defun EmaxX (alist )
(apply 'max (mapcar 'caadr alist))
)
;;
;;
;;
(defun EmaxY (alist )
(apply 'max (mapcar 'cadadr alist))
)
;;
;;
;;
(defun EmaxObjX (num alist / c)
(foreach x alist
(cond 
((and (assoc num (list (cadr x)))) 
   (setq c x)) 
))
  (setq c c)
);defun
;;
;;
;;
(defun EmaxObjY (num alist / c)
(foreach x alist

(cond 
((and (assoc num (list (cdadr x)))) 
   (setq c x)) 
)) 

  (setq c c)
);defun
;;
;;
;;
(defun ent_list ( ss / cnt SSe)
(setq cnt 0)
(while (> (sslength ss) cnt)
(setq SSe (append SSe (list (list  
(cdr (assoc -1 (entget (ssname ss cnt)))) 
(cdr (assoc 10 (entget (ssname ss cnt))))
) ) ) )
(setq cnt (1+ cnt))
)
(setq SSe SSe)
)
;;
;;
;;
(defun sort_numX  (LLLL / LLLL nLLL sort_order flag1)

      (repeat (length LLLL)
	(setq sort_order
	       (append sort_order
		       (list
			 (EMaxObjX (EmaxX LLLL) LLLL)
		       )
	       )
	)
(setq llll (pop LLLL (emaxobjx (emaxx llll) llll)) )

      )					;repeat
      

            (setq sort_order sort_order) ;(reverse 
    
      )
    (princ)
    ;;=========================================================

(defun sort_numY  (LLLL / LLLL nLLL sort_order flag1)

      (repeat (length LLLL)
	(setq sort_order
	       (append sort_order
		       (list
			 (EMaxObjY (EmaxY LLLL) LLLL)
		       )
	       )
	)

(setq llll (pop LLLL (emaxobjy (emaxy llll) llll)) )

      )					;repeat
      

      (setq sort_order sort_order)


      )
    (princ)
  ;;==========================================================================================
  ;;Primary Function
  (setq ss nil)
  (while (= ss nil)
    (terpri)
    (princ "Pick Text")
    (SETQ SS (SSGET '((0 . "*TEXT"))))
  )
     (TERPRI)
  (PRINC "Sort by Left or Down <Down> ")
  (initget " Left Down ")
  (setq sort_by_x (getkword))
(cond
((= sort_by_x nil) (setq sort_by_x "Down" ) )
((= sort_by_x "Down") (eval "" ) )
((= sort_by_x "Left") (eval "" ) )
((= 1 1) (setq sort_by_x "Down" ) )
)

  (setq ss (sort_numy (sort_numx (ent_list ss))))

  (setq num 0)
  (terpri)
  (princ "Select Parent Object ")
  (if (setq tn (entsel))
    (setq tent (entget (car tn)))
  )

  (TERPRI)
  (PRINC "Force Line Y/N <N>")
  (initget "No Yes")
  (setq kwd (getkword))
  (if (and kwd (= (strcase kwd) "YES"))
    (progn
(setq mtxt (apply 'strcat (mapcar '(lambda (x)

(strcat (cdr (assoc 1 (entget (car x)))) " "))
			     
(sort_numy (sort_numx ss))
)))
    )					;progn

    (progn
(setq mtxt (apply 'strcat (mapcar '(lambda (x)

(strcat (cdr (assoc 1 (entget (car x)))) " "))
			     
(sort_numy (sort_numx ss))
)))
    )					;progn

  )					;if
  (if (or (not tent) (= "*TEXT" (car (assoc 0 tent))))
    (setq tent (entget (caar ss)))
  )

  (ENTMAKE
    (list
      (cons 0 "MTEXT")
      (cons 100 "AcDbEntity")
      ;;(if (= 1 (getvar "tilemode")) (cons 67 0) (cons 67 1) ) 
      (cons 8 (cdr (assoc 8 tent)))
      (if (assoc 62 tent)
	(cons 62 (cdr (assoc 62 tent)))
	(cons 62 256)
      )
      (cons 100 "AcDbMText")
      (cons 10
	    (progn
	      (list
		(cadr (assoc 10 (entget (caar ss))))
		(+ (cadadr (textbox (entget (caar ss))))
		   (caddr (assoc 10 (entget (caar ss))))
		)

		0
	      )
	    )
      )
      (cons 40 (cdr (assoc 40 tent)))
      
	(cons 41
	      (progn (abs (- (caadr (textbox (entget (car (eMaxobjy (emaxy ss) ss)))))
			     (cadar (textbox (entget (car (eMaxobjy (emaxy ss) ss)))))
			     )
			  )
		)
	     );cons
	

(cond 
((= 0 (cdr (assoc 72 tent))) (cons 71 1))
((= 1 (cdr (assoc 72 tent))) (cons 71 2))
((= 2 (cdr (assoc 72 tent))) (cons 71 3))
((= 3 (cdr (assoc 72 tent))) (cons 71 5))
((= 4 (cdr (assoc 72 tent))) (cons 71 5))
((= 5 (cdr (assoc 72 tent))) (cons 71 5))
((= 1 1) (cons 71 1))
)
      ;;(cons 71 1)
      (cons 72 5)
      (cons 1 mtxt)
      (cons 7 (cdr (assoc 7 tent)))
      ;(cons 210 (LIST 0.0 0.0 1.0))
      ;(cons 11 (LIST 1.0 0.0 0.0))
      ;(cons 42 4.46667)
      ;(cons 43 0.266667)
      (cons 50 (cdr (assoc 50 tent)))


    )
  )


  (mapcar '(lambda (x) (entdel (car x))) ss)


  ;;==========================================================================================
					;Notify User
  (restore_user)
  (TERPRI)
  (print (length ss))
  (PRINC "....Dtext Entities Converted to Mtext")
  (princ)
)					;defun
(TERPRI)
(princ "Type  DXMXlr  to Change Dtext to Mtext ")
(PRINC)