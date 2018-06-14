(defun c:lba (/ ar kword kw)

  (terpri)
  (princ "Select Internal Point for Text :")
  (setq pnt1 (getpoint))
  (command "bpoly" pnt1 "")
  (command "area" "e" "l")
  (command "erase" "l" "")
  (terpri)

  (setq	kword
	 (cond ((= (getvar "users3") "Acres") (eval "Acres"))
	       ((= (getvar "users3") "Sf") (eval "Sf"))
	       (t (eval "Acres"))
	 )
  )

  (princ (strcat "Acres/SF<" kword "> "))


  (initget "Acres Sf")
  (setq kw (getkword))
  (if (/= nil kw)
    (setq kword kw)
  )


  (cond	((= kword "Sf")
	 (setq ar (getvar "area"))
	 (terpri)
	 (princ ar)
	 (princ "Square Feet")
	 (princ)
	 (command "text"
		  "c"
		  pnt1
		  0
		  (strcat (rtos ar 2 2) "%%p S.F.")
	 )
	)

	((= kword "Acres")
	 (setq ar (/ (getvar "area") 43560.0))
	 (terpri)
	 (princ ar)
	 (princ "Acres")
	 (princ)
	 (command
	   "text"
	   "c"
	   pnt1
	   0
	   (strcat (rtos ar 2 2) "%%p Acres")
	 )
	)
  )
  (if kword
    (setvar "users3" kword)
  )
)
(princ)
