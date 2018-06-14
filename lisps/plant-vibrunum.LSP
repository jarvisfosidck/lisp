;;jarvis fosdick
;;10-10-07
;;return offsets along a curve (polyines, splines, etc.)
;;
(defun c:ppvib ( / inc_dist obj cnt adj_inc_dist Ps Pe inclen along len line base9 splash_line_count )
;;stuff to come from other applications at future date:
(setq inc_dist 16.0)
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
;;
;;
;;interal variables
 (setq base9 (open "c:/thue_base9.txt" "r")
       spalsh_line_count (fix (* 10000 (randnum)))

	)
  (repeat spalsh_line_count
    (read-line base9)
   ;(read-line base3)
   ; (read-line base4)
  )
  

;;
;;
(vl-load-com)
(setq obj (vlax-ename->vla-object obj))
(setq Ps (vlax-curve-getstartparam obj)
      Pe (vlax-curve-getendparam obj)
      )
(setq len (vlax-curve-getdistatpoint obj (vlax-curve-getendpoint obj)))
(setq IncLen (atof (rtos (/ len inc_dist) 2 0)))
(setq adj_inc_dist (/ len IncLen))
(setq cnt -1)
(while (<= (setq cnt (1+ cnt)) inclen)
  (setq along (* cnt adj_inc_dist)
	adj_sc (/ inc_dist adj_inc_dist)
	)
  (setq adj_sc (* adj_sc (/ 16.0 16.0)))
  (setq line (read-line base9))
  (cond
((= line "0") (command "._insert" "Viburnum_lantana" (getoffset obj (+ (* adj_sc  1) along) 0) 0.6 0.6 0.0) )
((= line "1") (command "._insert" "Viburnum_opulus_roseum" (getoffset obj (+ (* adj_sc  1) along) 0) 0.6 0.6 0.0) )
((= line "2") (command "._insert" "Viburnum_lentago" (getoffset obj (+ (* adj_sc  1) along) 0) 0.6 0.6 0.0) )
((= line "3") (command "._insert" "Viburnum_trilobum" (getoffset obj (+ (* adj_sc  1) along) 0) 0.6 0.6 0.0) )
((= line "4") (command "._insert" "Chaenomeles_spp" (getoffset obj (+ (* adj_sc  1) along) 0) 0.35 0.35 0.0) )
((= line "5") (command "._insert" "Viburnum_opulus" (getoffset obj (+ (* adj_sc  1) along) 0) 0.6 0.6 0.0) )
((= line "6") (command "._insert" "Viburnum_prunifolium" (getoffset obj (+ (* adj_sc  1) along) 0) 0.6 0.6 0.0) )
((= line "7") (command "._insert" "Viburnum_dentatum" (getoffset obj (+ (* adj_sc  1) along) 0) 0.6 0.6 0.0) )
((= line "8") (command "._insert" "Viburmum_alleghany" (getoffset obj (+ (* adj_sc  1) along) 0) 0.6 0.6 0.0) )
  )
)
  
  )
(princ)

       
