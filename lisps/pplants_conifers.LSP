;;jarvis fosdick
;;10-10-07
;;return offsets along a curve (polyines, splines, etc.)
;;
(defun c:cplants ( / )
;;stuff to come from other applications at future date:
(setq inc_dist 20.0)
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
  (defun ins_p_block (name blist / )
  (entmake (append (list (cons 0 "insert") (cons 2 name)) blist))
  )
;;
;;
;;interal variables
 (setq base3 (open "c:/thue_base3.txt" "r")
	base4 (open "c:/thue_base4.txt" "r")
	base5 (open "c:/thue_base5.txt" "r")
       base6 (open "c:/thue_base6.txt" "r")
       base7 (open "c:/thue_base7.txt" "r")
	spalsh_line_count (fix (* 10000 (randnum)))

	)
  (repeat spalsh_line_count
    (read-line base3)
   (read-line base4)
    (read-line base5)
    (read-line base6)
    (read-line base7)
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

  (setq line (read-line base3))
  (cond
    ((= line "0") (ins_p_block "Populus_tremuloides_5g" (list (cons 10 (getoffset obj (+ 8.94178 along) 2.30939)) (cons 41 0.4) (cons 42 0.4) )))
    ((= line "1") (princ))
    ((= line "2") (ins_p_block "Populus_tremuloides_5g" (list (cons 10 (getoffset obj (+ 8.94178 along) 2.30939)) (cons 41 0.4) (cons 42 0.4) )))
    )
  (setq line (read-line base4))
  (cond
((= line "0") (ins_p_block "Pinus_mugo" (list (cons 10 (getoffset obj (+ 14.4978 along) -0.0890585)) (cons 41 0.2048) (cons 42 0.2048) )))
((= line "1") (ins_p_block "Juniperus_sabina_calgary_carpet" (list (cons 10 (getoffset obj (+ 14.4978 along) -0.0890585)) (cons 41 0.2048) (cons 42 0.2048) )))
((= line "2") (ins_p_block "Juniperus_sabina_skandia" (list (cons 10 (getoffset obj (+ 14.4978 along) -0.0890585)) (cons 41 0.2048) (cons 42 0.2048) )))
((= line "3") (ins_p_block "Juniperus_sabina_broadmoor" (list (cons 10 (getoffset obj (+ 14.4978 along) -0.0890585)) (cons 41 0.2048) (cons 42 0.2048) )))
)
(setq line (read-line base4))
  (cond
    ((= line "0") (ins_p_block "Acer_tataricum" (list (cons 10 (getoffset obj (+ 10.4986 along) 6.5613)) (cons 41 0.64) (cons 42 0.64) )))
    ((= line "1") (ins_p_block "Acer_grandidentatum" (list (cons 10 (getoffset obj (+ 10.4986 along) 6.5613)) (cons 41 0.64) (cons 42 0.64) )))
    ((= line "2") (ins_p_block "Acer_glabrum" (list (cons 10 (getoffset obj (+ 10.4986 along) 6.5613)) (cons 41 0.64) (cons 42 0.64) )))
    ((= line "3") (ins_p_block "Quercus_gambelii" (list (cons 10 (getoffset obj (+ 10.4986 along) 6.5613)) (cons 41 0.64) (cons 42 0.64) )))
    )
  (setq line (read-line base7))
(cond
    ((= line "0") (ins_p_block "Populus_tremuloides" (list (cons 10 (getoffset obj (+ 14.3672 along) 3.13081)) (cons 41 0.64) (cons 42 0.64) )))
    ((= line "1") (ins_p_block "Quercus_gambelii" (list (cons 10 (getoffset obj (+ 14.3672 along) 3.13081)) (cons 41 0.512) (cons 42 0.512) )))
    ((= line "2") (ins_p_block "Amelanchier_alnifolia" (list (cons 10 (getoffset obj (+ 14.3672 along) 3.13081)) (cons 41 0.4096) (cons 41 0.4096) )))
    ((= line "3") (princ))
    ((= line "4") (ins_p_block "Amelanchier_alnifolia"  (list (cons 10 (getoffset obj
									  (+ 14.3672 along) 3.13081)) (cons 41 0.4096) (cons 41 0.4096) )))
    ((= line "5") (ins_p_block "Quercus_gambelii"        (list (cons 10 (getoffset obj
									  (+ 14.3672 along) 3.13081)) (cons 41 0.512) (cons 42 0.512) )))
    ((= line "6") (ins_p_block "Populus_tremuloides_1in" (list (cons 10 (getoffset obj
									  (+ 14.3672 along) 3.13081)) (cons 41 0.8) (cons 42 0.8) )))
    )

(setq line (read-line base7))
  (cond
    ((= line "0") (ins_p_block "Pinus_edulis" (list (cons 10 (getoffset obj (+ 5.19185 along) 3.75533)) (cons 41 0.4096) (cons 41 0.4096) )))
    ((= line "1") (ins_p_block "Quercus_gambelii" (list (cons 10 (getoffset obj (+ 5.19185 along) 3.75533)) (cons 41 0.512) (cons 42 0.512) )))
    ((= line "2") (ins_p_block "Amelanchier_alnifolia" (list (cons 10 (getoffset obj (+ 5.19185 along) 3.75533)) (cons 41 0.4096) (cons 41 0.4096) )))
    ((= line "3") (princ))
    ((= line "4") (ins_p_block "Acer_grandidentatum" (list (cons 10 (getoffset obj (+ 5.19185 along) 3.75533)) (cons 41 0.64) (cons 41 0.64) )))
    ((= line "5") (ins_p_block "Pinus_edulis" (list (cons 10 (getoffset obj (+ 5.19185 along) 3.75533)) (cons 41 0.4096) (cons 41 0.4096) )))
    ((= line "6") (ins_p_block "Populus_tremuloides_1in" (list (cons 10 (getoffset obj (+ 5.19185 along) 3.75533)) (cons 41 0.8) (cons 41 0.8) )))
    )
  
    (setq line (read-line base3))
  (cond
((= line "0") (ins_p_block "Juniperus_sabina_calgary_carpet" (list (cons 10 (getoffset obj (+ 5.19865 along) -0.149503)) (cons 41 0.32) (cons 41 0.32) )))
((= line "1") (ins_p_block "Juniperus_sabina_skandia" (list (cons 10 (getoffset obj (+ 5.19865 along) -0.149503)) (cons 41 0.32) (cons 41 0.32) )))
((= line "2") (ins_p_block "Juniperus_sabina_broadmoor" (list (cons 10 (getoffset obj (+ 5.19865 along) -0.149503)) (cons 41 0.32) (cons 41 0.32) )))
)


  (setq line (read-line base4))
  (cond
    ((= line "0") (ins_p_block "Juniperus_chinensis_old_gold" (list (cons 10 (getoffset obj (+ 0.0 along) 1.81003)) (cons 41 0.64) (cons 41 0.64) )))
    ((= line "1") (ins_p_block "Juniperus_chinensis_armstrong" (list (cons 10 (getoffset obj (+ 0.0 along) 1.81003)) (cons 41 0.64) (cons 41 0.64) )))
    ((= line "2") (ins_p_block "Juniperus_chinensis_sea_green" (list (cons 10 (getoffset obj (+ 0.0 along) 1.81003)) (cons 41 0.64) (cons 41 0.64) )))
    ((= line "3") (ins_p_block "Juniperus_scopulorum_table_top_blue" (list (cons 10 (getoffset obj (+ 0.0 along) 1.81003)) (cons 41 0.64) (cons 41 0.64) )))
    )


  (setq line (read-line base3))
  (cond
    ((= line "0") (princ))
    ((= line "1") (ins_p_block "Amelanchier_alnifolia" (list (cons 10 (getoffset obj (+ 7.68677 along) 6.77221)) (cons 41 0.4096) (cons 41 0.4096) )))
    ((= line "2") (princ))
    )

  (setq line (read-line base3))
  (cond
    ((= line "0") (ins_p_block "Populus_tremuloides_5g" (list (cons 10 (getoffset obj (+ 0.826421 along) 2.41841)) (cons 41 0.4) (cons 41 0.4) )))
    ((= line "1") (princ))
    ((= line "2") (princ))
    )

  (setq line (read-line base4))
  (cond
    ((= line "0") (ins_p_block "Juniperus_chinensis_old_gold" (list (cons 10 (getoffset obj (+ 9.6683 along) 1.81003)) (cons 41 0.64) (cons 41 0.64) )))
    ((= line "1") (ins_p_block "Juniperus_chinensis_armstrong" (list (cons 10 (getoffset obj (+ 9.6683 along) 1.81003)) (cons 41 0.64) (cons 41 0.64) )))
    ((= line "2") (ins_p_block "Juniperus_chinensis_sea_green" (list (cons 10 (getoffset obj (+ 9.6683 along) 1.81003)) (cons 41 0.64) (cons 41 0.64) )))
    ((= line "3") (ins_p_block "Juniperus_scopulorum_table_top_blue" (list (cons 10 (getoffset obj (+ 9.6683 along) 1.81003)) (cons 41 0.64) (cons 41 0.64) )))
    )
    
(setq line (read-line base3))
  (cond
    ((= line "0") (ins_p_block "Acer_tataricum" (list (cons 10 (getoffset obj (+ 2.49695 along) 7.8257)) (cons 41 0.64) (cons 41 0.64) )))
    ((= line "1") (ins_p_block "Acer_grandidentatum" (list (cons 10 (getoffset obj (+ 2.49695 along) 7.8257)) (cons 41 0.64) (cons 41 0.64) )))
    ((= line "2") (ins_p_block "Acer_glabrum" (list (cons 10 (getoffset obj (+ 2.49695 along) 7.8257)) (cons 41 0.64) (cons 41 0.64) )))
    )

  
  (setq line (read-line base3))
  (cond
    ((= line "0") (ins_p_block "Pseudotsuga_menziesii" (list (cons 10 (getoffset obj (+ 12.3003 along) 13.1834)) (cons 41 0.8) (cons 41 0.8) )))
    ((= line "1") (ins_p_block "Picea_engelmannii" (list (cons 10 (getoffset obj (+ 12.3003 along) 13.1834)) (cons 41 0.8) (cons 41 0.8) )))
    ((= line "2") (ins_p_block "Picea_pungens" (list (cons 10 (getoffset obj (+ 12.3003 along) 13.1834)) (cons 41 0.8) (cons 41 0.8) )))
    )

(setq spalsh_line_count (+ spalsh_line_count 12))
  
  
  );while
  (close base2)
  (close base3)
  (close base4)
  (setvar "useri5" spalsh_line_count)
  )
(princ)

       
