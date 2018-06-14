;calendar functions
;jarvis fosdick
(defun c:dca ( / month_day_list  ss cnt day_list base7 base11 base12 base12_2 base365)
(setq month_day_list '(31 28 31 30 31 30 31 31 30 31 30 31)
      day_list '("m" "t" "w" "th" "f" "s" "sn")
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
(defun rotate ( a_list / )
  (setq a_list (append (cdr a_list) (list (car a_list))))
  (setq a_list a_list)
  )
   (setq base12 (open "c:/thue_base12.txt" "r")
	 base14 (open "c:/thue_base14.txt" "r")
	 base11 (open "c:/thue_base11.txt" "r")
	 base7 (open "c:/thue_base7.txt" "r")
	 base9 (open "c:/thue_base9.txt" "r")
	 base12_2 (open "c:/thue_base12.txt" "r")
         base365 (open "c:/thue_base365.txt" "r")
	 

	)
  (repeat (fix (* 10000 (randnum)))
    (read-line base12)
    )
  (repeat (fix (* 10000 (randnum)))
    (read-line base14)
    (read-line base11)
    )
    (repeat (fix (* 10000 (randnum)))
    (read-line base7)
    (read-line base9)
      (read-line base12_2)
      (read-line base365)
  )

(setq ss (ssget))
(setq cnt 0)
(while (> (sslength ss) cnt)
(foreach x month_day_list
  (setq line14 (read-line base14)
	line12_2 (read-line base12_2)
	)
  (cond
      ((or (= line14 "4") (= line14 "6") (= line14 "9"))
       (command ".insert" "events" (cdr (assoc 10 (entget (ssname ss cnt)))) "" "" "" )
       ))
  (repeat x
    (setq line7 (read-line base7))
    (setq line11 (read-line base11)
	  line12 (read-line base12)
	  line9 (read-line base9)
	  line365 (read-line base365)
	  )
    (cond
      ((or (= (car day_list) "m") (= (car day_list) "t")(= (car day_list) "w")(= (car day_list) "th")(= (car day_list) "f"))
       (command ".insert" "admin" (cdr (assoc 10 (entget (ssname ss cnt)))) "" "" "" )
       )
)
    (cond
      ((or (= (car day_list) "w") )
       (command ".insert" "ode" (cdr (assoc 10 (entget (ssname ss cnt)))) "" "" "" )
       )
)
    (cond
      ((or (= line7 "1") (= line7 "3") (= line7 "5"))
       (command ".insert" "shoot" (cdr (assoc 10 (entget (ssname ss cnt)))) "" "" "" )
       ))
      
    (cond
      ((or (= line11 "6") )
       (command ".insert" "partner" (cdr (assoc 10 (entget (ssname ss cnt)))) "" "" "" )
       ))
    (cond
      ((or (= line9 "3") )
       (command ".insert" "special" (cdr (assoc 10 (entget (ssname ss cnt)))) "" "" "" )
       ))
    (cond
      ((or (= line365 "25") (= line365 "26") (= line365 "27") (= line365 "28") (= line365 "29") (= line365 "30"))
       (command ".insert" "celebrity" (cdr (assoc 10 (entget (ssname ss cnt)))) "" "" "" )
       ))
    
    (cond
      ((or
       (and (= (car day_list) "f") (= line12 "3") )
       (and (= (car day_list) "s") (or (= line12 "3") (= line12 "4")))
       (and (= (car day_list) "sn") (or (= line12 "4") (= line12 "5")))
       )
       (command ".insert" "scouts" (cdr (assoc 10 (entget (ssname ss cnt)))) "" "" "" )
       ))

    (setq cnt (1+ cnt))
    (setq day_list (rotate day_list))
	  ))
  
)
  (close line12)
  (close line12_2)
  (close line11)
  (close line7)
  (close line14)
  (close line365)
  (princ))


