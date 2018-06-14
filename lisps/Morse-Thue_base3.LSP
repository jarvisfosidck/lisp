;;Jarvis Fosdick
;;August 6, 2007
;;Read file of the Morse-Thue Sequence and insert blocks at 2'O.C. on x,y grid

(setq cnt 0 cntx 0 cnty 0)
(setq file "c:/thue_base3.txt")
(setq ofile (open file "r"))

(repeat 250
  (setq line (read-line ofile))
  (cond
    ((= line "0") (command ".insert" "Item_A" (list (* cntx 2) (* cnty 2)) "" "" 0))
    ((= line "1") (command ".insert" "Item_B" (list (* cntx 2) (* cnty 2)) "" "" 0))
    ((= line "2") (command ".insert" "Item_C" (list (* cntx 2) (* cnty 2)) "" "" 0))
    
    (t (princ line))
    )

  
  (cond
    ;;295 is the long one for entryway
    ;;((= cntx 295) (setq cnty (1- cnty)) (setq cntx 0))

    ;;61 is the north-south at entry way
    ((= cntx 300) (setq cnty (1- cnty)) (setq cntx 0))
  (t (setq cntx (1+ cntx)))
    )
  )
(close ofile)

