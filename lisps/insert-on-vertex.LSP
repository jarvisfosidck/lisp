;;add a 3' dia. circle at every vertex of a pline
;;Jeff Mishler May 2006
(defun c:cvx (/ ent i idx pt ss totparam rot)
  (if (setq ss (ssget '((0 . "*POLY*"))))
    (progn
      (vla-startundomark (vla-get-activedocument (vlax-get-acad-object)))
      (setq idx -1)
      (while (< (setq idx (1+ idx))(sslength ss))
	(setq ent (ssname ss idx))
	(setq totparam (fix (vlax-curve-getendparam ent))
	      i -1
	      r (getvar "circlerad"))
	(if (= r 0.0)
	  (setq r 1.5);;adjust default Radius here
	  )
	(while (< (setq i (1+ i)) totparam)
	  (setq pt (vlax-curve-getpointatparam ent i))
	  (entmake (list '(0 . "CIRCLE")
			 (cons 10 pt)
			 (cons 40 r)
			 ;(cons 8 "circlelayer");set the layer here
			 )
		   )
	  )
	(setq pt (vlax-curve-getpointatparam ent (vlax-curve-getendparam ent)))
	(entmake (list '(0 . "CIRCLE")
		       (cons 10 pt)
		       (cons 40 r)
		       ;(cons 8 "circlelayer");set the layer here
		       )
		 )
	)
      (vla-endundomark (vla-get-activedocument (vlax-get-acad-object)))
      )
    )
  (princ)
  )