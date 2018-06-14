;;jarvis fosdick
;;10-10-07
;;return offsets along a curve (polyines, splines, etc.)
;;
(defun c:ppline( / )
;;stuff to come from other applications at future date:
(setq inc_dist 35.0)
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
(setq len (vlax-curve-getdistatpoint obj (vlax-curve-getendpoint obj)))
(setq IncLen (atof (rtos (/ len inc_dist) 2 0)))
(setq adj_inc_dist (/ len IncLen))
(setq cnt -1)
(while (<= (setq cnt (1+ cnt)) inclen)
  (setq along (* cnt adj_inc_dist)
	adj_sc (/ inc_dist adj_inc_dist)
	)
  (setq adj_sc (* adj_sc (/  35.0 35.0 )))
  (setq line (read-line base3))
  (cond
    ((= line "0") (command "._insert" "tree12" (getoffset obj (+ (* adj_sc 1) along) 0.0) 19.20 19.20 0.0))
    ((= line "1") (command "._insert" "tree5" (getoffset obj (+ (* adj_sc 1) along) 0.0) 1.6 1.6 0.0))
    ((= line "2") (command "._insert" "tree2" (getoffset obj (+ (* adj_sc 1) along) 0.0) 1.6 1.6 0.0))
    ;((= line "0") (command "._insert" "tree1" (getoffset obj (+ (* adj_sc 1) along) 0.0) 0.8 0.8 0.0))	
    ;((= line "1") (command "._insert" "pear" (getoffset obj (+ (* adj_sc 1) along) 0.0) 0.4 0.4 0.0))
    ;((= line "2") (command "._insert" "tree6" (getoffset obj (+ (* adj_sc 1) along) 0.0) 0.8 0.8 0.0))
    ;((= line "3") (command "._insert" "tree15" (getoffset obj (+ (* adj_sc 1) along) 0.0) 0.8 0.8 0.0))	

    ; ((= line "0")
    ;  (command "._insert" "Picea_pungens" (getoffset obj (+ (* adj_sc 1) along) 0.0) 0.84 0.84 0.0)
    ; )
    ;((= line "1") (command "._insert" "Picea_engelmannii" (getoffset obj (+ (* adj_sc 1) along) 0.0) 0.84 0.84 0.0))
    ;((= line "2") (command "._insert" "Pseudotsuga_menziesii" (getoffset obj (+ (* adj_sc 1) along) 0.0) 0.84 0.84 0.0))
    ;((= line "3") (command "._insert" "crataegus_viridis_winter_king" (getoffset obj (+ (* adj_sc 1) along) 0) "0.6" "" ""))
    )
  
)
  (close base2)
  (close base3)
  (close base4)
  )
(princ)

       
