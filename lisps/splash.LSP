;;jarvis fosdick
;;10-10-07
;;-some code to apply functions to multipul objects-
(defun getbase ( / )
  (setq x (cdr (assoc 10 (entget (ssname ss cntss)))))
  (setq base_pnt (polar x (atof (read-line ang_file)) (* scale (+ 0.2 (atof (read-line dist_file))))))
  
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

(defun c:splash ( / cnt)
  
(terpri) (princ "Select Plant Nodes: ")
  (setq ss (ssget))


  (setq dist_file (open "c:/thue_base5.txt" "r")
  	ang_file (open "c:/angle_file.txt" "r")
	ofile (open "c:/thue_base3.txt" "r")
	base24 (open "c:/thue_base24.txt" "r")
  	cntss -1
  	cnt 0
  	spalsh_line_count (fix (* 10000 (randnum)))
  	cnty 0
	scale 5.0
  )
  (repeat spalsh_line_count
    (read-line ang_file)
    (read-line dist_file)
    )
  
(while (> (sslength ss) (setq cntss (1+ cntss)))

  (repeat 4
    
(setq line (read-line ofile))
(cond
    ((= line "0") (command ".insert" "forsythia_meadowlark" (getbase) ".2" "" 0))
    ((= line "1") (command ".insert" "forsythia_northern_gold" (getbase) ".2" "" 0))
    ((= line "2") (command ".insert" "forsythia_northern_sun" (getbase) ".2" "" 0))
    )
    
  (repeat (atoi (read-line ofile))
    (setq line (read-line base24))
    (cond
    ((= line "4") (command ".insert" "malus_brandywine" (getbase) ".5" "" 0))
    ;((= line "5") (command ".insert" "malus_centurion" (getbase) "" "" 0))
    ;((= line "6") (command ".insert" "malus_dolgo" (getbase) "" "" 0))
    ;((= line "7") (command ".insert" "malus_hopa" (getbase) "" "" 0))
    ((= line "8") (command ".insert" "malus_radiant" (getbase) ".5" "" 0))
    ;((= line "9") (command ".insert" "malus_robinson" (getbase) "" "" 0))
    ;((= line "10") (command ".insert" "malus_selkirk" (getbase) "" "" 0))
    ((= line "11") (command ".insert" "malus_spring_snow" (getbase) ".5" "" 0))
    ((< 12 (atof line) 19) (command ".insert" "rosa_glauca" (getbase) ".3" "" 0))
    ;((= line "13") (command ".insert" "rosa_foetida" (getbase) "" "" 0))
   ; ((= line "14") (command ".insert" "rosa_woodsii" (getbase) "" "" 0))
    )
    (setq spalsh_line_count (1+ spalsh_line_count ))
    )
    )
   ; ((= line "15") (command ".insert" "forsythia_northern_sun" (getbase) "" "" 0))
    ;((= line "16") (command ".insert" "forsythia_northern_sun" (getbase) "" "" 0))
    ;((= line "17") (command ".insert" "forsythia_northern_sun" (getbase) "" "" 0))
    ;((= line "18") (command ".insert" "forsythia_northern_sun" (getbase) "" "" 0))
    ;((= line "19") (command ".insert" "forsythia_northern_sun" (getbase) "" "" 0))
    ;((= line "20") (command ".insert" "forsythia_northern_sun" (getbase) "" "" 0))
    ;((= line "21") (command ".insert" "forsythia_northern_sun" (getbase) "" "" 0))
    ;((= line "22") (command ".insert" "forsythia_northern_sun" (getbase) "" "" 0))
    ;((= line "23") (command ".insert" "forsythia_northern_sun" (getbase) "" "" 0))
    ;((= line "24") (command ".insert" "forsythia_northern_sun" (getbase) "" "" 0))
    
    
    ;(t (princ line))
    
    )
    (setq spalsh_line_count (+ 3 spalsh_line_count ))

    

  
  
  
 
(close ofile)
  (close ang_file)
  (close dist_file)
  (setvar "useri5" spalsh_line_count)
  
  )
