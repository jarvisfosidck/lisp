;;jarvis fosdick
;;10-10-07
;;return offsets along a curve (polyines, splines, etc.)
;;
(defun c:ppegmix ( / cnt ss ins_pnt line base13 splash_line_count )
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
  
 (setq base14 (open "c:/thue_base14.txt" "r")
       spalsh_line_count (fix (* 10000 (randnum)))

	)
  (repeat spalsh_line_count
    (read-line base14)
   ;(read-line base3)
   ; (read-line base4)
  )
  
(setq cnt 0
      ss_loop ss
      flag 0
      )
  
(while (< 0 (sslength ss_loop))


  (setq ins_pnt (cdr (assoc 10 (entget (ssname ss_loop cnt)))))
  
  (setq line (read-line base14))
    (cond

((= line "0") (command "._insert" "Pinus_aristata" ins_pnt 0.729907 0.729907 0.0) (entdel (ssname ss_loop cnt)) (ssdel (ssname ss_loop cnt) ss_loop) )
((= line "2") (command "._insert" "Pinus_strobiformis" ins_pnt 0.67584 0.67584 0.0) (entdel (ssname ss_loop cnt)) (ssdel (ssname ss_loop cnt) ss_loop) )
((= line "4") (command "._insert" "Pinus_sylvestris" ins_pnt 0.546133 0.546133 0.0) (entdel (ssname ss_loop cnt)) (ssdel (ssname ss_loop cnt) ss_loop) )
((= line "6") (command "._insert" "Picea_engelmannii" ins_pnt 0.84 0.84 0.0) (entdel (ssname ss_loop cnt)) (ssdel (ssname ss_loop cnt) ss_loop) )
((= line "8") (command "._insert" "Pseudotsuga_menziesii" ins_pnt 0.84 0.84 0.0) (entdel (ssname ss_loop cnt)) (ssdel (ssname ss_loop cnt) ss_loop) )
((= line "10") (command "._insert" "Picea_pungens" ins_pnt 0.84 0.84 0.0) (entdel (ssname ss_loop cnt)) (ssdel (ssname ss_loop cnt) ss_loop) )
((= line "12") (command "._insert" "Pinus_ponderosa" ins_pnt 0.84 0.84 0.0) (entdel (ssname ss_loop cnt)) (ssdel (ssname ss_loop cnt) ss_loop) )
  )


  )(princ)
  
  )
(princ)

       
