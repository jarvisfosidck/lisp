;;convert mix of code to make mercadorv3
;;jarvis, 09-20-2007
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

(vl-load-com)
(setq mspace (vla-get-modelSpace (vla-get-activeDocument (vlax-get-acad-object))))

(defun SS_2_List (ss / ssList cnt1)

  (setq	cnt1 0
	ssList '()
  )
  (while (> (sslength ss) cnt1)
    (setq ssList (append ssList (list (ssname ss cnt1))))

    (setq cnt1 (1+ cnt1))
    (setq sslist sslist)
  )
);defun
(defun pop3 (alist / ) 

(setq alist (cdddr alist))
);defun

(defun pline_vertex ( / cnt cntss ss coords ppnt1 pnt pnt2 obj_list pp_obj anarray pp_list)
  
(terpri) (princ "Select Polylines: ")
  (setq ss (ssget '()))
 (setq cntss 0)
  (while (< cntss (sslength ss))
    (setq coords (vlax-get-property
		   (vlax-ename->vla-object (ssname ss cntss)) 'coordinates)
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
    ))
;delete objects
(mapcar '(lambda (x) (entdel x)) (ss_2_list ss))
  (princ)(terpri)(princ "type 3df-3dl to convert 3dfaces to lines ")

    vla-addpolyline 