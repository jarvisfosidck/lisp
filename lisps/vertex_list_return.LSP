;;Return a list for visual lisp to make object
;;Jarvis Fosdick Oct 2007
;;modified from code by Jeff Mishler May 2006
(defun cvx (ent /  i pt totparam)
  
  
	
	(setq totparam (fix (vlax-curve-getendparam ent))
	      i -1
	      vertex_list '()
	)      
	(while (< (setq i (1+ i)) totparam)
	  (setq pt (append pt (vlax-curve-getpointatparam ent i)))
	 (setq pt (append pt (vlax-curve-getpointatparam ent (vlax-curve-getendparam ent))))
	
      )
    )
  (princ)
  