;;Return a list for visual lisp to make object 
;;Jarvis Fosdick Oct 2007
(vl-load-com)

(defun tan (ang / )
(/ (sin ang) (cos ang))
)
(defun dx (pnt pnt2 / )
(apply '- (mapcar 'car (list pnt2 pnt)))
)
(defun dy (pnt pnt2 / )
(apply '- (mapcar 'cadr (list pnt2 pnt)))
)
(defun dz (pnt pnt2 / )
(apply '- (mapcar 'caddr (list pnt2 pnt)))
)

(defun ht (r pnt pnt2 / )
(* r (/ (dz pnt pnt2) (sqrt (+ (expt (dx pnt pnt2) 2) (expt (dy pnt pnt2) 2)))))
)
(defun sd (r pnt pnt2 / )
;(* r (atan (/ (dy pnt pnt2) (dx pnt pnt2))))
(* r (angle pnt pnt2))
)
;;
;;
(defun Ppnt ( pnt / )
(list
(- (car Cen_mp) (sd r_mp base_mp pnt))
(+ (cadr Cen_mp) (ht r_mp base_mp pnt))
) );defun
;;
;;
;;
(defun pvx (ent /  i pt totparam)
  
  
	
	(setq totparam (fix (vlax-curve-getendparam ent))
	      i -1
	      vertex_list '()
	)      
	(while (< (setq i (1+ i)) totparam)
	  (setq pt (append pt (ppnt (vlax-curve-getpointatparam ent i))))
	 ;(setq pt (append pt (ppnt (vlax-curve-getpointatparam ent (vlax-curve-getendparam ent)))))
	
      )
    )
(defun mkpobj (pp_list / mspace anarray pp_obj)
  (setq mspace (vla-get-modelSpace (vla-get-activeDocument (vlax-get-acad-object))))
  (setq anarray (vlax-make-safearray vlax-vbDouble (cons 0 (1- (length pp_list))) ))
  (vlax-safearray-fill anarray pp_list)
  (setq pp_obj (vla-addLightweightPolyline mspace anarray))
  (cond
    ((< 2 (length pp_list))
    (vla-put-closed pp_obj :vlax-true)
     )
    );cond
)  
  (princ)
  