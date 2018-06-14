;;
;;
(defun row_places (tieup thread_list / cnt row_list)
(setq cnt 0
      row_list '()
      )

(foreach x thread_list (progn (cond ((member x tieup)
				     (setq row_list (append row_list (list cnt)))
				     ))
				     (setq cnt (1+ cnt))
				     )
				    )
  
(setq row_list row_list)
  )