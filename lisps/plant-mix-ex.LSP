;;jarvis fosdick
;;10-10-07
;;return offsets along a curve (polyines, splines, etc.)
;;
(defun c:ppmix ( / cnt ss ins_pnt line base7 splash_line_count )
;;stuff to come from other applications at future date:

(terpri)(princ "select Objects: ")
(setq ss (ssget))
;;
;;
;;internal functions

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
 (setq base7 (open "c:/thue_base7.txt" "r")
       spalsh_line_count (fix (* 10000 (randnum)))

	)
  (repeat spalsh_line_count
    (read-line base7)
   ;(read-line base3)
   ; (read-line base4)
  )
  
(setq cnt -1)
(while (> (sslength ss) (setq cnt (1+ cnt)))

  (setq ins_pnt (cdr (assoc 10 (entget (ssname ss cnt)))))
  
  (setq line (read-line base7))
  (cond

((= line "0") (command "._insert" "Acer_saccharum" ins_pnt 0.64 0.64 0.0) )
((= line "1") (command "._insert" "Acer_rubrum_red_sunset" ins_pnt 0.7 0.7 0.0) )
((= line "2") (command "._insert" "Acer_rubrum_autumn_flame" ins_pnt 0.77 0.77 0.0) )
((= line "3") (command "._insert" "Quercus_macrocarpa" ins_pnt 0.97 0.97 0.0) )
((= line "4") (command "._insert" "Gymnocladus_dioica" ins_pnt 0.74 0.74 0.0) )
((= line "5") (command "._insert" "Catalpa_speciosa" ins_pnt 0.66 0.66 0.0) )
((= line "6") (command "._insert" "Quercus_robur" ins_pnt 0.64 0.64 0.0) )
  )
(entdel (ssname ss cnt))
  )(princ)
  
  )
(princ)

       
