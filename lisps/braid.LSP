;;jarvis fosdick
;;10-10-07
;;return offsets along a curve (polyines, splines, etc.)
;;
(defun c:braid ( / )
;;stuff to come from other applications at future date:
(setq inc_dist 14.0)
(terpri)(princ "select a polylines")
(setq obj (car (entsel)))
;;
;;
;;internal functions
(defun getoffset (obj dist offset / );dpt npt)
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
;;interal variables
 (setq base2 (open "c:/thue_base2.txt" "r")
	base3 (open "c:/thue_base3.txt" "r")
	base4 (open "c:/thue_base4.txt" "r")
	spalsh_line_count (getvar "useri5")

	)
  (repeat spalsh_line_count
    (read-line base2)
   (read-line base3)
    (read-line base4)
  )
  

;;
;;
(vl-load-com)
(setq obj (vlax-ename->vla-object obj))
(setq Ps (vlax-curve-getstartparam obj)
      Pe (vlax-curve-getendparam obj)
      )
(setq len (vlax-curve-getdistatparam obj (vlax-curve-getendparam obj)))
(setq IncLen (atof (rtos (/ len inc_dist) 2 0)))
(setq adj_inc_dist (/ len IncLen))
(setq cnt -1)
(while (< (setq cnt (1+ cnt)) inclen)
  (setq along (* cnt adj_inc_dist)
	adj_sc (/ inc_dist adj_inc_dist)
	)
;;;  (setq line (read-line base4))
;;;  (cond
;;;    ((= line "0")
;;;      (command "._insert" "crataegus_crusgalli" (getoffset obj (+ (* adj_sc 25.6) along) 16.03) "" "" "")
;;;     )
;;;    ((= line "1") (command "._insert" "crataegus_ambigua" (getoffset obj (+ (* adj_sc 25.6) along) 16.03) "" "" ""))
;;;    ((= line "2") (command "._insert" "crataegus_phaenopyrum" (getoffset obj (+ (* adj_sc 25.6) along) 16.03) "" "" ""))
;;;    ((= line "3") (command "._insert" "crataegus_viridis_winter_king" (getoffset obj (+ (* adj_sc 25.6) along) 16.03) "" "" ""))
;;;    )
  
;(command "._insert" "Kniphofia_uvaria" (getoffset obj (+ 13.6634 along) -0.924034) 0.36 0.36 0.0)
(command "._insert" "Schizachyrium_scoparium_the_blues" (getoffset obj (+ 11.3861 along) 0.850888) 0.36 0.36 0.0)
(command "._insert" "yucca_color_guard" (getoffset obj (+ 9.1089 along) -0.924034) 0.36 0.36 0.0)
(command "._insert" "Kniphofia_uvaria" (getoffset obj (+ 6.83168 along) 0.850888) 0.36 0.36 0.0)
(command "._insert" "Schizachyrium_scoparium_the_blues" (getoffset obj (+ 4.55445 along) -0.924034)0.36 0.36 0.0)
(command "._insert" "yucca_color_guard" (getoffset obj (+ 2.27723 along) 0.850888) 0.36 0.36 0.0)
(command "._insert" "Kniphofia_uvaria" (getoffset obj (+ 0.0 along) -0.924034)0.36 0.36 0.0)
;(command "._insert" "yucca_color_guard" (getoffset obj (+ 13.6634 along) 2.62581) 0.36 0.36 0.0)
(command "._insert" "Kniphofia_uvaria" (getoffset obj (+ 11.3861 along) -2.69896) 0.36 0.36 0.0)
(command "._insert" "Schizachyrium_scoparium_the_blues" (getoffset obj (+ 9.1089 along) 2.62581) 0.36 0.36 0.0)
(command "._insert" "yucca_color_guard" (getoffset obj (+ 6.83168 along) -2.69896) 0.36 0.36 0.0)
(command "._insert" "Schizachyrium_scoparium_the_blues" (getoffset obj (+ 2.27723 along) -2.69896) 0.36 0.36 0.0)
(command "._insert" "Schizachyrium_scoparium_the_blues" (getoffset obj (+ 9.1089 along) 2.62581) 0.36 0.36 0.0)
(command "._insert" "Kniphofia_uvaria" (getoffset obj (+ 4.55445 along) 2.62581) 0.36 0.36 0.0)
(command "._insert" "yucca_color_guard" (getoffset obj (+ 0.0 along) 2.62581)0.36 0.36 0.0)

  
  )

  (close base2)
  (close base3)
  (close base4)
  )
(princ)

       
