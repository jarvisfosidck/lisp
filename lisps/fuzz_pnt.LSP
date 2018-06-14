;;jarvis fosdick
;;10-26-07
;;given point "fuzz" its position by factor

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

(defun get_r_angle ( / return_value )

  (while
    (< 0 (setq return_value (* 10 (randnum))) 7)
    
    )
  (setq return_value return_value)
  )

(defun get_r_dist ( / return_value )

  (while
     (< 0 (setq return_value (* 10 (randnum))) 7)
    
    )
  (setq return_value return_value)
  )

(defun fuzz_pnt (pnt_fac_list / return_pnt)
  (cond
    ((not (listp (car pnt_fac_list))) (setq return_pnt (polar pnt_fac_list (get_r_angle) (log (get_r_dist)))))
    ((listp (car pnt_fac_list)) (setq return_pnt (polar (car pnt_fac_list) (get_r_angle)
							 (* (log (cadr pnt_fac_list)) (log (get_r_dist))))))
    ((= 0 0) (setq return_pnt pnt_fac_list))
     )
  
  (setq return_pnt return_pnt)
  )