;;jarvis fosdick
;;10-15-2007
;;get blocks using wildcard
(defun c:gbn (  / )
  (terpri)(princ "enter block letters: ")
  (ssget (list (cons 2 (strcat (getstring) "*") )))
  )(princ)