
(defun c:draft ( / ss cnt ent)

  ;(setq ofile (open (getfiled "chose a file" "c:/" "txt" 1) "w"))
  
  (defun dx (pnt pnt2 / )
(apply '- (mapcar 'car (list pnt2 pnt)))
)
(defun dy (pnt pnt2 / )
(apply '- (mapcar 'cadr (list pnt2 pnt)))
)
;(defun list-2-str (alist / list-str)
 ; (setq list-str "")
  ;(foreach x alist (setq list-str (strcat list-str x)))
;)
  (terpri)(princ "pick base point: ")
  (setq base_point (getpoint))
(setq cnt -1)
  (setq ss (ssget ))
(while (> (sslength ss) (setq cnt (1+ cnt)))
(terpri)
  (setq ent (entget (ssname ss cnt)))
  (princ "(command \"._insert\" \"")
  (princ (cdr (assoc 2 ent))) (princ "\" (getoffset obj (+ ")
  (princ (dx base_point (cdr (assoc 10 ent)))) (princ " along) ")
  (princ (dy base_point (cdr (assoc 10 ent)))) (princ ") ")
  ;(princ (cdr (assoc 10 ent)))(princ " ")
  (princ (cdr (assoc 42 ent)))(princ " ")
  (princ (cdr (assoc 43 ent)))(princ " ")
  (princ (/ (* 180 (cdr (assoc 50 ent))) pi) )(princ ") ")
  )(princ)
)
(princ)(terpri)(princ "type DRAFT to princ offset requirements for template")


