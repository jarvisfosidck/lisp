;;jarvis fosdick
;;10-10-07
;;return offsets along a curve (polyines, splines, etc.)
;;
(defun c:ppssmix ( / cnt ss ins_pnt line base splash_line_count ss_loop )
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
  
 (setq base (open "c:/thue_base12.txt" "r")
       spalsh_line_count (fix (* 10000 (randnum)))

	)
  (repeat spalsh_line_count
    (read-line base)
   ;(read-line base3)
   ; (read-line base4)
  )
  
(setq cnt 0
      ss_loop ss
      flag 0
      )
  
(while (< 0 (sslength ss_loop))


  (setq ins_pnt (cdr (assoc 10 (entget (ssname ss_loop cnt)))))
  
  (setq line (read-line base))
    (cond


((= line "0") (command "._insert" "Pinus_mugo" ins_pnt 0.192 0.192 0.0) (entdel (ssname ss_loop cnt)) (ssdel (ssname ss_loop cnt) ss_loop) )
((= line "2") (command "._insert" "Miscanthus_sinensis" ins_pnt 0.375 0.375 0.0) (entdel (ssname ss_loop cnt)) (ssdel (ssname ss_loop cnt) ss_loop) )
((= line "4") (command "._insert" "Saccharum_ravennae" ins_pnt 0.375 0.375 0.0) (entdel (ssname ss_loop cnt)) (ssdel (ssname ss_loop cnt) ss_loop) )
((= line "6") (command "._insert" "Panicum_virgatum_shenandoah" ins_pnt 0.375 0.375 0.0) (entdel (ssname ss_loop cnt)) (ssdel (ssname ss_loop cnt) ss_loop) )
((= line "8") (command "._insert" "Panicum_virgatum_heavy_metal" ins_pnt 0.375 0.375 0.0) (entdel (ssname ss_loop cnt)) (ssdel (ssname ss_loop cnt) ss_loop) )
((= line "10") (command "._insert" "Panicum_virgatum_dallas_blues" ins_pnt 0.375 0.375 0.0) (entdel (ssname ss_loop cnt)) (ssdel (ssname ss_loop cnt) ss_loop) )
  )


  )(princ)
  
  )
(princ)

       
