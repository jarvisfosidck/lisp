;;jarvis fosdick
;;10-10-07
;;return offsets along a curve (polyines, splines, etc.)
;;
(defun c:ploffset ( / )
;;stuff to come from other applications at future date:
(setq inc_dist 28.0)
(terpri)(princ "select a polylines")
(setq obj (car (entsel)))
;;
;;
;;internal functions
(defun getoffset (obj dist offset / dpt npt)
  (setq dpt (vlax-curve-getfirstderiv obj (vlax-curve-getparamatpoint obj
	 (vlax-curve-getpointatdist obj dist)))
	)
  
(setq npt
       (polar (vlax-curve-getpointatdist obj dist)
		 (+ (/ pi 2.0) (angle (list 0 0) dpt))
		 offset)
      )
  (setq npt npt)
  )
;;
;;
;;
(vl-load-com)
(setq obj (vlax-ename->vla-object obj))
(setq Ps (vlax-curve-getstartparam obj)
      Pe (vlax-curve-getendparam obj)
      )
(setq len (vlax-curve-getdistatpoint obj (vlax-curve-getendpoint obj)))
(setq IncLen (atof (rtos (/ len inc_dist) 2 0)))
(setq inc_dist (/ len IncLen))
(setq cnt -1)
(while (<= (setq cnt (1+ cnt)) inclen)
  (command "._insert" "fallugia_paradoxa" (getoffset obj (* cnt inc_dist) 16.0) "" "" "")
  )

)(princ)

       
