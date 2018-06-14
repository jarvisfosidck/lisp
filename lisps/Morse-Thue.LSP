;;Jarvis Fosdick
;;August 6, 2007
;;Read file of the Morse-Thue Sequence and insert blocks at 2'O.C. on x,y grid
(setq xoff 0 yoff 0 xmax 12 ymax 0 cnt_jump 78) 
(setq cnt 0 cntx 0 cnty 0)
(setq file "c:/thue_base5.txt")
(setq ofile (open file "r"))

(repeat 450
  (setq line (read-line ofile))
  (cond
    ((= line "0") (command ".insert" "Item_A" (list (* cntx 2) (* cnty 2)) "" "" 0))
    ((= line "1") (command ".insert" "Item_B" (list (* cntx 2) (* cnty 2)) "" "" 0))
    ((= line "2") (command ".insert" "Item_C" (list (* cntx 2) (* cnty 2)) "" "" 0))
    ((= line "3") (command ".insert" "Item_D" (list (* cntx 2) (* cnty 2)) "" "" 0))
    ((= line "4") (command ".insert" "Item_E" (list (* cntx 2) (* cnty 2)) "" "" 0))
    ((= line "5") (command ".insert" "Item_F" (list (* cntx 2) (* cnty 2)) "" "" 0))
    ((= line "6") (command ".insert" "Item_G" (list (* cntx 2) (* cnty 2)) "" "" 0))
    (t (princ line))
    )

  (setq cnt (1+ cnt))
  (cond
    ((= cnt cnt_jump)  (setq cntx xmax cnty 0 xoff 13) (setq xmax (* xmax 2)))
    ((= cnt 150) (setq cntx -1 cnty -6 xoff 12 xmax 12 xoff 0))
    ((= cnt 228) (setq cntx xmax cnty -6 xoff 13) (setq xmax (* xmax 2)))
    ((= cnt 300) (setq cntx -1 cnty -12 xoff 12 xmax 12 xoff 0))
    ((= cnt 378) (setq cntx xmax cnty -12 xoff 13) (setq xmax (* xmax 2)))
    )
  (cond
    ;((= cnt cnt_jump) (setq xmax (* xmax 2)) (setq cntx xmax cnty 0))
    ((= cntx xmax) (setq cnty (1- cnty)) (setq cntx xoff))
  (t (setq cntx (1+ cntx)))
    )
  )
(close ofile)

