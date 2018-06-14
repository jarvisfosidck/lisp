;;convert 3d faces to 3d lines
;;jarvis, 09-20-2007

(vl-load-com)
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

(defun c:3df-3dl ( / cnt cntss ss coords ppnt1 pnt pnt2 obj_list)
  
(terpri) (princ "Select 3d faces: ")
  (setq ss (ssget '((0 . "3dface"))))
 (setq cntss 0)
  (while (< cntss (sslength ss))
    (setq coords (vlax-get-property
		   (vlax-ename->vla-object (ssname ss cntss)) 'coordinates)
	  );setq
(setq obj_list (vlax-safearray->list (variant-value coords)))
    (setq ppnt1 (list (car obj_list) (cadr obj_list) (caddr obj_list)))
    (while (and obj_list)
    
    (setq pnt1 (list (car obj_list) (cadr obj_list) (caddr obj_list)))  
    (setq obj_list (pop3 obj_list))
      (cond
	((and obj_list)
    (setq pnt2 (list (car obj_list) (cadr obj_list) (caddr obj_list)))
	 )
	((not obj_list)
	 (setq pnt2 ppnt1)
	 )
	)
    
    
    (entmake (list (cons 0 "line")
(cons 10 pnt1)
(cons 11 pnt2)
) );entmake

    );repeat
    (setq cntss (1+ cntss))
    )
  ;;delete objects
(mapcar '(lambda (x) (entdel x)) (ss_2_list ss))
  (princ))(terpri)(princ "type 3df-3dl to convert 3dfaces to lines ")

    

