;;jarvis fosdick
;;10-10-07
;;return offsets along a curve (polyines, splines, etc.)
;;
(defun c:ppjmix ( / cnt ss ins_pnt line base10 splash_line_count )
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
 (setq base10 (open "c:/thue_base10.txt" "r")
       spalsh_line_count (fix (* 10000 (randnum)))

	)
  (repeat spalsh_line_count
    (read-line base10)
   ;(read-line base3)
   ; (read-line base4)
  )
  
(setq cnt -1)
(while (> (sslength ss) (setq cnt (1+ cnt)))

  (setq ins_pnt (cdr (assoc 10 (entget (ssname ss cnt)))))
  
  (setq line (read-line base10))
  (cond


((= line "0") (command "._insert" "Juniperus_sabina_skandia" ins_pnt 0.512 0.512 0.0) )
((= line "1") (command "._insert" "Populus_tremuloides_1in" ins_pnt 0.64 0.64 0.0) )
((= line "2") (command "._insert" "Juniperus_sabina_broadmoor" ins_pnt 0.512 0.512 0.0) )
((= line "3") (command "._insert" "Juniperus_sabina_calgary_carpet" ins_pnt 0.512 0.512 0.0) )
((= line "4") (command "._insert" "Populus_tremuloides_5g" ins_pnt 0.64 0.64 0.0) )
((= line "5") (command "._insert" "Juniperus_scopulorum_table_top_blue" ins_pnt 0.512 0.512 0.0) )
((= line "6") (command "._insert" "Populus_tremuloides" ins_pnt 0.512 0.512 0.0) )
((= line "7") (command "._insert" "Juniperus_chinensis_old_gold" ins_pnt 0.512 0.512 0.0) )
((= line "8") (command "._insert" "Juniperus_chinensis_sea_green" ins_pnt 0.512 0.512 0.0) )
((= line "9") (command "._insert" "Juniperus_chinensis_Armstrong" ins_pnt 0.512 0.512 0.0) )
  )
(entdel (ssname ss cnt))
  )(princ)
  
  )
(princ)

       
