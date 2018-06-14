;;drawing towner
;;jarvis 11-12-2007

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
  (defun along_3dline ( pnt pnt2 dist / zang ang apnt)
    (setq zang (atan (/ (sqrt (+ (expt (dx pnt pnt2) 2) (expt (dy pnt pnt2) 2))) (dz pnt pnt2)))
	  ang (angle pnt pnt2)
	  )
    
    (setq apnt (list (* dist (cos ang) (sin zang))
		     (* dist (sin ang) (sin zang))
		     (* dist (cos zang))
		     )
	  )
    )
  (defun c:dtn ( / obj obj2 ht obj obj2 obj3 ss  ang ang2 jig
		     jag jig_dist jag_dist along_dist along_dist2
		     anarray pp_obj pl_list pl_list2 mspace inc_dist cnt
		  )
  (terpri)
  (princ "Select base and top: ")
  (setq ss (ssget)
        obj (entget (ssname ss 0))
        obj2 (entget (ssname ss 1))
	obj3 (list (cdr (assoc 10 (entget (ssname ss 0)))) (cdr (assoc 10 (entget (ssname ss 1)))))
	jig (entget (ssname ss 2))
      	jag (entget (ssname ss 3))
	bkjig (entget (ssname ss 4))
	bkjag (entget (ssname ss 5))
	)
    
  (setq inc_dist (/ (distance (cdr (assoc 10 obj)) (cdr (assoc 11 obj))) space)
	inc_dist2 (/ (distance (cdr (assoc 10 obj2)) (cdr (assoc 11 obj2))) space)
	cnt -1	
	 )

(while (< (setq cnt (1+ cnt)) (fix (/ (distance (cdr (assoc 10 obj))  (cdr (assoc 11 obj))) inc_dist)))
  (setq obj3 (list
	       (mapcar '+ (car obj3)  (along_3dline (cdr (assoc 10 obj))  (cdr (assoc 11 obj))  inc_dist))
	       (mapcar '+ (cadr obj3) (along_3dline (cdr (assoc 10 obj2)) (cdr (assoc 11 obj2)) inc_dist2))
	       )
	)
    (princ obj3)
      
    (setq 
pl_list (list (inters (cdr (assoc 10 obj)) (cdr (assoc 11 obj)) (car obj3) (cadr obj3) nil))
pl_list (append pl_list (list (inters (cdr (assoc 10 jig)) (cdr (assoc 11 jig)) (car obj3) (cadr obj3) nil)))
pl_list (append pl_list (list (list (cadr (assoc 10 bkjig)) (caddr (assoc 10 bkjig)) (caddr (last pl_list)))))
pl_list (append pl_list (list (list (cadr (assoc 10 bkjag)) (caddr (assoc 10 bkjag)) (caddr (last pl_list)))))
pl_list (append pl_list (list (inters (cdr (assoc 10 jag)) (cdr (assoc 11 jag)) (car obj3) (cadr obj3) nil)))
pl_list (append pl_list (list (inters (cdr (assoc 10 obj2)) (cdr (assoc 11 obj2)) (car obj3) (cadr obj3) nil)))
	)
  (princ pl_list)

	(foreach x pl_list (setq pl_list2 (append pl_list2 x))) 
  (setq pl_list pl_list2 )
  (vl-load-com)
  (setq mspace (vla-get-modelSpace (vla-get-activeDocument (vlax-get-acad-object))))
  (setq anarray (vlax-make-safearray vlax-vbDouble (cons 0 (1- (length pl_list))) ))
  (vlax-safearray-fill anarray pl_list)
  (setq pp_obj (vla-add3dPoly mspace anarray)
	
	pl_list2 nil
	)
  ;; (vla-put-closed pp_obj :vlax-true)
  ;;drawings one segment
  )
   (princ)
  ) (princ )
