;;Jarvis Fosdick
;;October 8, 2007
;;Project Perspective with Mercador Cylindar
;;V3 projects polyline and 3dfaces without converting to lines

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
	      pt '()
	)      
	(while (<= (setq i (1+ i)) totparam)
	  (setq pt (append pt (ppnt (vlax-curve-getpointatparam ent i))))
	 ;(setq pt (append pt (ppnt (vlax-curve-getpointatparam ent (vlax-curve-getendparam ent)))))
	
      )
    

  (setq mspace (vla-get-modelSpace (vla-get-activeDocument (vlax-get-acad-object))))
  (setq anarray (vlax-make-safearray vlax-vbDouble (cons 0 (1- (length pt))) ))
  (vlax-safearray-fill anarray pt)
  (setq pp_obj (vla-addLightweightPolyline mspace anarray))
  (cond
    ((= 1 (cdr (assoc 70 (entget ent))))
    (vla-put-closed pp_obj :vlax-true)
     )
    ((= (cdr (assoc 0 (entget (ssname ss cnt)))) "CIRCLE")
     (vla-put-closed pp_obj :vlax-true)
     )
    );cond
)
;;
;;
;;
(defun pop3 (alist / ) 

(setq alist (cdddr alist))
);defun
(defun p3df ( ent / cnt cntss ss coords ppnt1 pnt pnt2 obj_list pp_obj anarray pp_list)
 
 (setq cntss 0)
    (setq coords (vlax-get-property
		   (vlax-ename->vla-object ent) 'coordinates)
	  );setq
(setq obj_list (vlax-safearray->list (variant-value coords)))
    (setq pp_list '())
(while (and obj_list)
    (setq pp_List (append pp_list (ppnt (list (car obj_list) (cadr obj_list) (caddr obj_list)))))
    (setq obj_list (pop3 obj_list))
  )
  (setq anarray (vlax-make-safearray vlax-vbDouble (cons 0 (1- (length pp_list))) ))
  (vlax-safearray-fill anarray pp_list)
  (setq pp_obj (vla-addLightweightPolyline mspace anarray))
    (vla-put-closed pp_obj :vlax-true)
  
 (setq cntss (1+ cntss))
    )
;;
;;
;;
(defun c:mpbase (  / );cen_mp r_mp base_mp)
(terpri)(princ "Enter Radius: ")
(setq r_mp (getreal))
(terpri)(princ "Pick Base: ")
(setq base_mp (getpoint))
(terpri)(princ "Pick Center Drawing Area: ")
(setq cen_mp (getpoint))
)
;;
;;
;;
(defun c:pss ( / ss cnt)
(command "undo" "mark")
(terpri)(princ "Pick Objects: ")
(setq ss (ssget))
(setq cnt 0)
(while (< cnt (sslength ss))
  (cond
    ((= (cdr (assoc 0 (entget (ssname ss cnt)))) "LINE")
     
(entmake (list (cons 0 "line")
(cons 10
(ppnt (cdr (assoc 10 (entget (ssname ss cnt)))) ) 
)
(cons 11
(ppnt (cdr (assoc 11 (entget (ssname ss cnt)))) )
)))
     )
    ((wcmatch (cdr (assoc 0 (entget (ssname ss cnt)))) "*POLY*")
     (pvx (ssname ss cnt))
     )
((= (cdr (assoc 0 (entget (ssname ss cnt)))) "3DFACE")
     (p3df (ssname ss cnt))
     )
    ((= (cdr (assoc 0 (entget (ssname ss cnt)))) "CIRCLE")
     (pvx (ssname ss cnt))
     )
    
    );cond
  
    
(setq cnt (1+ cnt))
);while
)

