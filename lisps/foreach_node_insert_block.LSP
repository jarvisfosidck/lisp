;;jarvis fosdick
;;05-13-05
;;-some code to apply functions to multipul objects-
(defun getbase ( / )
  (setq x (list (ssname ss cntss)))
  (setq base_pnt (cdr (assoc 10 (entget (car x)))))
  )

(defun c:inodes ( / cnt)
  
(terpri) (princ "Select Plant Nodes: ")
  (setq ss (ssget))

(setq file "c:/thue_base3.txt")
(setq ofile (open file "r"))
(setq cntss 0 cnt 0 cntx 0 cnty 0)
  
(while (< cntss (sslength ss))

(setq line (read-line ofile))
(cond
    ((= 1 1) (command ".insert" "street-lamp" (getbase) "" "" 0))
    ;((= line "1") (command ".insert" "pear" (getbase) "0.5" "0.5" 0))
    ;((= line "1") (command ".insert" "tree5" (getbase) "" "" 0))
    ;((= line "2") (command ".insert" "tree12" (getbase) "12" "12" 0))
    ;(t (princ line))
    )

  (setq cntss (1+ cntss))
)
(close ofile)
  )
