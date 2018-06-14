(DEFUN C:DXMX
	      (/ var_list mtxt SS NUM tent kwd tn)

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
  (defun tsort (ss1 / elist1 txt_sort txt_sort1 cnt txt_sort2 num ss)

    ;;=========================================================
    (defun sort_num (LLLL / LLLL nLLL sort_order flag1)

      (repeat (length LLLL)
	(setq sort_order
	       (append sort_order
		       (list
			 (apply 'max LLLL)
		       )
	       )
	)
	(setq flag1 nil)
	(foreach x LLLL

	  (if (or (not (= x (apply 'max LLLL))) flag1)
	    (setq nlll (append nlll (list x)))
	    (setq flag1 1)
	  )				;if

	)				;foreach

	(setq llll nlll
	      nlll nil
	)
      )					;repeat
      ;(setq sort_order sort_order)
            (setq sort_order (reverse sort_order))
    )
    (princ)
    ;;=========================================================



    (setq cnt 0)

    (repeat (sslength ss1)

      (setq elist1
	     (append elist1
		     (list
		       (cons
			 (cadr (assoc 10 (entget (ssname ss1 cnt))))
			 (cdr (assoc -1 (entget (ssname ss1 cnt))))
		       )
		     )
	     )
      )
      (setq cnt (1+ cnt))
    )

    (foreach x elist1
      (setq txt_sort (append txt_sort (list (car x))))
    )
    (setq txt_sort1 (sort_num txt_sort))
    (foreach x txt_sort1
      (setq txt_sort2 (append txt_sort2
			      (list (cons

				      (cdr (assoc x elist1))
				      x
				    )
			      )
		      )
      )
    )
    (setq ss nil)
    (setq num 0)
    (setq ss (ssadd (car (nth num txt_sort2))))

    (repeat (- (length txt_sort2) 1)
      (setq num (1+ num))
      (setq ss (ssadd (car (nth num txt_sort2)) ss))
    )
    (princ)
    (setq ss ss)
  )
  ;;==========================================================================================
  ;;Primary Function
  (setq ss1 nil)
  (while (= ss1 nil)
    (terpri)
    (princ "Pick Text")
    (SETQ SS1 (SSGET '((0 . "TEXT"))))
  )
  (setq ss (tsort ss1))
  (princ ss)
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
      (REPEAT (SSLENGTH SS)
	(if mtxt
	  (SETQ	mtxt (strcat mtxt
			     " "
			     "\\P"
			     (cdR (ASSOC 1 (ENTGET (SSNAME SS NUM))))
		     )
	  )
	  (SETQ mtxt (strcat (cdR (ASSOC 1 (ENTGET (SSNAME SS NUM))))))
	)				;if

	(setq num (1+ num))
      )					;repeat
    )					;progn
    (progn
      (REPEAT (SSLENGTH SS)
	(if mtxt
	  (SETQ	mtxt (strcat mtxt
			     " "
			     (cdR (ASSOC 1 (ENTGET (SSNAME SS NUM))))
		     )
	  )
	  (SETQ mtxt (strcat (cdR (ASSOC 1 (ENTGET (SSNAME SS NUM))))))
	)				;if

	(setq num (1+ num))
      )					;repeat
    )					;progn

  )					;if
  (if (or (not tent) (= "TEXT" (car (assoc 0 tent))))
    (setq tent (entget (ssname ss 0)))
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
		(cadr (assoc 10 (entget (ssname ss 0))))
		(+ (cadadr (textbox (entget (ssname ss 0))))
		   (caddr (assoc 10 (entget (ssname ss 0))))
		)

		0
	      )
	    )
      )
      (cons 40 (cdr (assoc 40 tent)))
      (if (and kwd (= (strcase kwd) "YES"))
	(cons 41 0)
	(cons 41
	      (progn (+ (CDR (ASSOC 40 tent)) (caadr (textbox tent))))
	)
      )
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

  (SETQ NUM 0)
  (REPEAT (SSLENGTH SS)
    (IF	(ENTGET (SSNAME SS NUM))
      (ENTDEL (SSNAME SS NUM))
    )
    (setq num (1+ num))
  )					;repeat		

  ;;==========================================================================================
					;Notify User
  (restore_user)
  (TERPRI)
  (print num)
  (PRINC "....Dtext Entities Converted to Mtext")
  (princ)
)					;defun
(TERPRI)
(princ "Type  DXMX  to Change Dtext to Mtext ")
(PRINC)