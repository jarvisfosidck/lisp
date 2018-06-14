;;jarvis fosdick
;;10-10-07
;;return offsets along a curve (polyines, splines, etc.)
;;
(defun c:pplants ( / inc_dist obj cnt adj_inc_dist Ps Pe inclen along len line base2 base3 base4 splash_line_count adj_y_sc)
;;stuff to come from other applications at future date:
;(setq inc_dist 28.0)
(setq inc_dist 10.0)
(terpri)(princ "select a polyline")
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
   (defun randnum (/ modulus multiplier increment random)

  (if (not seed)

    (setq seed (getvar "DATE"))

  )

  (setq modulus    65536

        multiplier 25173

        increment  13849

        seed  (rem (+ (* multiplier seed) increment) modulus)

        random     (/ seed modulus)

  )

)
  (defun ins_p_block (name blist / )
  (entmake (append (list (cons 0 "insert") (cons 2 name)) blist))
  )
;;
;;
;;interal variables
 (setq base2 (open "c:/thue_base2.txt" "r")
	base3 (open "c:/thue_base3.txt" "r")
	base4 (open "c:/thue_base4.txt" "r")
	spalsh_line_count (fix (* 10000 (randnum)))

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
  (setq adj_y_sc 1.0)
(setq cnt -1)
(while (< (setq cnt (1+ cnt)) inclen)
  (setq along (* cnt adj_inc_dist)
	adj_sc (/ inc_dist adj_inc_dist)
	)
  
  (setq adj_sc (* adj_sc (/ 36.0 36.0)))
  (setq line (read-line base2))
  (cond
    ;((= line "0") (ins_p_block "angle" (list (cons 10 (getoffset obj (+ (* adj_sc 25.6) along) (* adj_y_sc 11.5)) ))))
    ((= line "1") (ins_p_block "angle" (list (cons 10 (getoffset obj (+ (* adj_sc 0) along) (* adj_y_sc 1)) ))))
    ;((= line "2") (ins_p_block "crataegus_phaenopyrum" (list (cons 10 (getoffset obj (+ (* adj_sc 25.6) along) (* adj_y_sc 11.5)) ))))
    ;((= line "3") (ins_p_block "crataegus_viridis_winter_king" (list (cons 10 (getoffset obj (+ (* adj_sc 25.6) along) (* adj_y_sc 11.5)) ))))
    )
  )
  

  (close base2)
  (close base3)
  (close base4)
  )
(princ)

       
