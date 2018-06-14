;; ***********************************************************************
;; * AreaTools.lsp 09-09-2004           				 *
;; *									 *
;; * Copyright 2004 by G.L. "Chip" Harper.                               *
;; *                                                                     *
;; * Email: chip@hot4cad.com                                             *
;; * Homepage: http://www.hot4cad.com                                    *
;; *                                                                     *
;; * Utility for Area Callouts.                  			 *
;; *                                                                     *
;; * This application was written for and tested on AutoCAD 2004.        *
;; *                                                                     *
;; * Permission to use, copy, modify, and distribute this software       *
;; * for any purpose and without fee is hereby granted, provided         *
;; * that the above copyright notice appears in all copies and		 *
;; * that both that copyright notice and the limited warranty and	 *
;; * restricted rights notice below appear in all supporting		 *
;; * documentation.							 *
;; *									 *
;; * G.L. "Chip" Harper provides this program "AS IS", with any and	 *
;; * all faults. Additionally disclaims any implied warranty of		 *
;; * merchantability or fitness for a particular use, and		 *
;; * does not warrant that the operation of the program will be		 *
;; * uninterrupted or error free.					 *
;; *                                                                     *
;; *                                                                     *
;; ***********************************************************************
;;
;;
;; ****************************************
;; *    ==  Begin Error Handler  ==       *
;; *                                      *
;; ****************************************
;;
;;
   (defun ETRAP (msg)
      (if (or
             (= msg "Function cancelled")		; If user cancelled
             (= msg "quit / exit abort"))		; If user aborted
         (princ)	  			  	; Exit quietly
         (princ (strcat "\nError: " msg))		; Otherwise report error
      )	                                                ; End if sequence
;;
;;
;; ****************************************
;; *    ==  Error Variable Resets  ==     *
;; *                                      *
;; ****************************************
;;
;;
   (setvar "cmddia" CCDI)                            	; Reset cmddia variable
   (setvar "cmdecho" CCME)				; Reset cmdecho variable
   (setvar "cecolor" CCOL)                              ; Reset color variable
   (setvar "dimscale" CDMS)                             ; Reset dimscale variable
   (setvar "filedia" CFDI)                              ; Reset filedia variable
   (setvar "celtype" CLTY)                              ; Reset linetype variable
   (setvar "clayer" CLAY)                               ; Reset layer variable
   (setvar "orthomode" CORM)                            ; Reset ortho variable
   (setvar "osmode" COSM)                               ; Reset osnaps variable
   (setvar "snapang" CSAN)                              ; Reset snapang variable
;;
;;
;; ****************************************
;; *    ==  Error Screen Prompts  ==      *
;; *                                      *
;; ****************************************
;;
;;
   (prompt "\n")					; Clear text line
   (princ (strcat CLFN " Terminated"))	                ; Notify Operator
   (setq *error* PERROR)				; Reset Previous Error
   (princ)						; Nil supression
   )   	                                                ; End ETRAP
;;
;;
;; ****************************************
;; *    ==  Save Variable Settings  ==    *
;; *                                      *
;; ****************************************
;;
;;
   (defun GETVARS ()
      (setq CCDI (getvar "cmddia"))                    	; Get cmddia setting
      (setq CCME (getvar "cmdecho"))                    ; Get cmdecho setting
      (setq CCOL (getvar "cecolor"))                    ; Get current color
      (setq CDMS (getvar "dimscale"))                   ; Get dimscale setting
      (setq CFDI (getvar "filedia"))                    ; Get filedia setting
      (setq CLTY (getvar "celtype"))                    ; Get current linetype
      (setq CLAY (getvar "clayer"))                     ; Get current layer
      (setq CORM (getvar "orthomode"))                  ; Get ortho setting
      (setq COSM (getvar "osmode"))                     ; Get osnap settings
      (setq CSAN (getvar "snapang"))                    ; Get snapang setting
   )							; End defun GETVARS
;;
;;
;; ****************************************
;; *    ==  Reset Variable Settings  ==   *
;; *                                      *
;; ****************************************
;;
;;
   (defun SETVARS ()
      (setvar "cmddia" CCDI)                    	; Reset cmddia setting
      (setvar "cecolor" CCOL)                    	; Reset current color
      (setvar "dimscale" CDMS)                   	; Reset dimscale setting
      (setvar "filedia" CFDI)                    	; Reset filedia setting
      (setvar "celtype" CLTY)                    	; Reset current linetype
      (setvar "clayer" CLAY)                     	; Reset current layer
      (setvar "orthomode" CORM)                  	; Reset ortho setting
      (setvar "osmode" COSM)                     	; Reset osnap settings
      (setvar "snapang" CSAN)                    	; Reset snapang setting
      (setvar "cmdecho" CCME)                    	; Reset cmdecho setting
   )							; End defun SETVARS
;;
;;
;; ****************************************
;; *     ==  Specify Conditions  ==       *
;; *                                      *
;; ****************************************
;;
;;
   (defun SPECOND ()
      (setq BLAYN "AREA BORDER")			; Specify boundary layername
      (setq BLAYC 1)					; Specify boundary layercolor
      (setq BLINEN "CONTINUOUS")               		; Specify boundary linetype
;
      (setq LLAYN "AREA")				; Specify leader layername
      (setq LLAYC 3)					; Specify leader layercolor
      (setq LLINEN "CONTINUOUS")               		; Specify leader linetype
;
      (setq DELBPL 0)					; Auto delete boundary 
;							; polyline 0=NO  1=YES
;
      (setq LTSF "acad.lin")                            ; set linetype file
;							; alternate is "acadiso.lin"
;
      (setq AP1 0)					; Specify SI precision
      (setq AP2 0)					; Specify SF precision
      (setq AP3 0)					; Specify SY precision
      (setq AP4 2)					; Specify AC precision
      (setq AP5 2)					; Specify HT precision
      (setq AP6 0)					; Specify PR precision
   )							; End defun SPECOND
;;
;;
;; ****************************************
;; *       ==  Set Conditions  ==         *
;; *                                      *
;; ****************************************
;;
;;
   (defun SETCOND ()
         (if (and (= APATH "BOUND")			; Don't make layer
                  (= DELBPL 0)				; if autodeleted
             )						; End and
            (progn					; Area setup
               (setq LAYN BLAYN)			; Set layername
               (setq LAYC BLAYC)			; Set layercolor
               (setq LINEN BLINEN)			; Set linetype
            )						; End progn
;
            (progn					; Boundary setup
               (setq LAYN LLAYN)			; Set layername
               (setq LAYC LLAYC)			; Set layercolor
               (setq LINEN LLINEN)			; Set linetype
            )						; End progn
         )						; End if

      (VLINE)						; Run VLINE
      (VLAYER)						; Run VLAYER
      (setvar "clayer" LAYN)				; Set layer
      (setvar "cecolor" "bylayer")                      ; Set color to "bylayer"
      (setvar "celtype" "bylayer")			; Set linetype to "bylayer"
   )							; End defun SETCOND
;;
;;
;; ****************************************
;; *    ==  Verify-Load Linetype  ==      *
;; *                                      *
;; ****************************************
;;
;; 
   (defun VLINE ()
      (if (not (tblsearch "ltype" LINEN))               ; Check for Linetype
          (progn                                        ; If not found
              (setvar "filedia" 0)                      ; Turn off dialog box
              (command "._linetype" "_load" LINEN LTSF "")
;							; Load linetype 
              (setvar "filedia" CFDI)                   ; Reset filedia
          )                                             ; End Progn
      )                                                 ; End If
   )							; End defun VLINE
;;
;;
;; ****************************************
;; *    ==  Verify-Create Layer  ==       *
;; *                                      *
;; ****************************************
;;
;;
   (defun VLAYER ()
      (if (TBLSEARCH "layer" LAYN)                      ; Check for layer name
         (progn                                         ; If found
            (setvar "filedia" 0)			; Turn off dialog box
            (command "._layer" "_thaw" LAYN "_on" LAYN ""); Thaw and turn on
            (command "._layer" "_color" LAYC LAYN "")   ; Set color
            (command "._layer" "_unlock" LAYN "")       ; Unlock
            (setvar "filedia" CFDI)			; Reset filedia
       )                                                ; End progn
;;
;;
       (progn                                      	; If not found
          (setvar "filedia" 0)				; Turn off dialog box
          (command "._layer" "_make" LAYN "")           ; Make layer
          (command "._layer" "_color" LAYC LAYN "")     ; Set color
          (command "._layer" "_ltype" LINEN LAYN "")	; Set linetype
          (setvar "filedia" CFDI)			; Reset filedia
       )                                                ; End progn
   )                                                    ; End If 
  )							; End defun VLAYER
;;
;;
;; ****************************************
;; *         ==  Get Units  ==            *
;; *                                      *
;; ****************************************
;;
;;
   (defun GETUNITS ()
      (setq AUNITS (getvar "lunits"))			; Get drawing units
        ; 1 Scientific
        ; 2 Decimal
        ; 3 Engineering
        ; 4 Architectural
        ; 5 Fractional
      (if (not (or (= AUNITS 4)
                   (= AUNITS 2)
              ))					; End not
         (progn
            (ALERT "This Utility is not configured for your units!")
            (SETVARS)
            (EXIT)
            (princ)
         )						; End progn
      )							; End if
   )							; End defun GETUNITS
;;
;;
;; ****************************************
;; *        ==  Get Points  ==            *
;; *                                      *
;; ****************************************
;;
;;
   (defun GETPTS ()
      (setq PT1 (getpoint "\nPick a point within area"))
      (setq PT2 (getpoint PT1 "\nPick a point to place text"))
      (initget "Yes No")
      (setq ANS1 (getkword "\nPolyline Already Defined? Yes/No <Yes>: "))
         (if 
            (or (= ANS1 "Yes")
             (= ANS1 nil)
            )						; End or
             (progn
                (setq APATH "AREA")			; Area setup
                (SETCOND)				; Set conditions
                (GETAREA)				; Run GETAREA
             )						; End progn
;
             (progn
                (setq APATH "BOUND")			; Bound setup
                (SETCOND)				; Set conditions
                (GETBOUND)				; Run GETBOUND
             )						; End progn
         )						; End if
   )							; End GETPTS
;;
;;
;; ****************************************
;; *         ==  Get Area  ==             *
;; *                                      *
;; ****************************************
;;
;;
   (defun GETAREA ()
      (while (null (setq PLSEL (car (entsel))))		; Verify Polyline
         (princ "\nSelect Closed Polyline...")		; selection
         (princ)
      )
;;        
      (setq VP (entget PLSEL))
      (setq VAR (cdr (assoc 70 VP)))
      (if (= VAR 1)
         (command "._area" "_e" PLSEL )			; Get area from polyline
         (progn
            (ALERT "Not A Closed Polyline!")
            (SETVARS)
            (EXIT)
            (princ)
         )						; End progn
      )							; End if
   )							; End GETAREA
;;
;;
;; ****************************************
;; *       ==  Get Boundary  ==           *
;; *                                      *
;; ****************************************
;;
;;
   (defun GETBOUND ()
      (setvar "filedia" 0)				; Turn off dialog box
      (command "._boundary" PT1 "")			; Start boundary cmd
;
;  If not autodeleting boundary polyline change layer for leader and text
;
      (if (= DELBPL 0)
         (progn
            (setq APATH "AREA")
            (SETCOND)
         )						; End progn
      )							; End if
;
      (command "._area" "_object" "_last")		; Get area from polyline
      (if (= DELBPL 1)					; If cond set to erase
          (command "._erase" "_last" "")		; Erase polyline
      )							; End if
          (setvar "filedia" CFDI)			; Reset filedia
   )							; End GETBOUND
;;
;;
;; ****************************************
;; *       ==  Get Area Values  ==        *
;; *                                      *
;; ****************************************
;;
;;
   (defun GETAREAV ()
      (setq AREAV (getvar "area"))			; Get area 
      (setq PERIV (getvar "perimeter"))			; Get perimeter
;;
;; 	*** ARCHITECTURAL ***
;;
      (if (= AUNITS 4)
         (progn						
;;
;;	** SQUARE INCHES **
;;
           (setq num AREAV # AP1)
           (setq AREAV1 (rtoc num #))			; convert to SI with commas
;;
;;	** SQUARE FEET **
;;
           (setq num (/ AREAV 144) # AP2)
           (setq AREAV2 (rtoc num #))			; convert to SF with commas
;;
;;	** SQUARE Yards **
;;
           (setq num (/ (/ AREAV 144) 9) # AP3)
           (setq AREAV3 (rtoc num #))			; convert to SY with commas
;;
;;	** ACRES **
;;
           (setq num (cvunit AREAV "sq in" "acre") # AP4)
           (setq AREAV4(rtoc num #))			; convert to AC with commas
;;
;;	** HECTARES **
;;
           (setq num (/ (cvunit AREAV "sq in" "acre") 2.4710437) # AP5)
           (setq AREAV5 (rtoc num #))			; convert to HT with commas
;;
;;	** PERIMETER **
;;
           (setq num (/ PERIV 12) # AP6)
           (setq PERIV1 (rtoc num #))			; convert to PR with commas
      )							; End progn Architectural
   )							; End if
;;
;;
;; 	*** DECIMAL ***
;;
      (if (= AUNITS 2)
         (progn						
;;
;;	** SQUARE INCHES **
;;
           (setq num (* AREAV 144) # AP1)
           (setq AREAV1 (rtoc num #))			; convert to SI with commas
;;
;;	** SQUARE FEET **
;;
           (setq num AREAV # AP2)
           (setq AREAV2 (rtoc num #))			; convert to SF with commas
;;
;;	** SQUARE Yards **
;;
           (setq num (/ AREAV 9) # AP3)
           (setq AREAV3 (rtoc num #))			; convert to SY with commas
;;
;;	** ACRES **
;;
           (setq num (cvunit (* AREAV 144) "sq in" "acre") # AP4)
           (setq AREAV4 (rtoc num #))			; convert to AC with commas
;;
;;	** HECTARES **
;;
           (setq num (/ (cvunit (* AREAV 144) "sq in" "acre") 2.4710437) # AP5)
           (setq AREAV5 (rtoc num #))			; convert to HT with commas
;;
;;	** PERIMETER **
;;
           (setq num PERIV # AP6)
           (setq PERIV1 (rtoc num #))			; convert to PR with commas
      )							; End progn Decimal
   )							; End if
;;
   )							; End GETAREAV
 

;;
;;
;; ****************************************
;; *          ==  Add Commas  ==          *
;; *                                      *
;; ****************************************
;;
;;
;; Code Source: John Uhden
;; This function pads a numeric string with commas.
;; Arguments:
;; num = any number, real or integer (>= 0)
;; # = precision, integer (>= 0)
;;
   (defun rtoc (num # / p#)
   (setq num (rtos num 2 #) # 1)
   (while (and (/= (substr num # 1) ".")(<= # (strlen num)))
   (setq # (1+ #))
   )
   (setq # (1- #) p# #)
   (if (= (setq # (rem # 3)) 0)(setq # 3))
   (while (< # p#)
   (setq num (strcat (substr num 1 #) "," (substr num (1+ #)))
   # (+ 4 #)
   p# (1+ p#)
   )
   )
   num
   )
;;
;;
;; ****************************************
;; *         ==  Set Call Out  ==         *
;; *                                      *
;; ****************************************
;;
;;
   (defun SETCALL ()
      (command "._leader" PT1 PT2 "" ATEXT "")
   )							; End SETCALL
;;
;;
;; ****************************************
;; *   ==  Run Area Tools Functions  ==   *
;; *                                      *
;; ****************************************
;;
;;
   (defun RATOOLS ()
;;
;;
   (setvar "cmdecho" 0)                              	; Turn cmdecho off
   (GETVARS)						; Get Variables	
   (setq PERROR *error*)				; Get previous error
   (setq *error* ETRAP)					; Set error trap
   (setq CLFN "AreaTools")				; Set current lisp name

;;
;;
   (GETUNITS)
   (SPECOND)
;;
;;

   (GETPTS)
   (GETAREAV)
;;
;;
   (if (= ATF 1)
      (setq ATEXT (strcat "AREA = " AREAV1 " SI")))	; Set ATI string
   (if (= ATF 2)
      (setq ATEXT (strcat "AREA = " AREAV2 " SF")))	; Set ATF string
   (if (= ATF 3)
      (setq ATEXT (strcat "AREA = " AREAV3 " SY")))	; Set ATY string
   (if (= ATF 4)
      (setq ATEXT (strcat "AREA = " AREAV4 " AC")))	; Set ATA string
   (if (= ATF 5)
      (setq ATEXT (strcat "AREA = " AREAV5 " HECTARE"))); Set ATH string
   (if (= ATF 6)
      (setq ATEXT (strcat "PERIMETER = " PERIV1 " FT"))); Set ATP string
   (if (= ATF 7)
      (setq ATEXT (strcat "AREA = " AREAV2 " SF" 
                          "\nAREA = " AREAV4 " AC"))) 	; Set ATC string 
   (if (= ATF 8)
      (setq ATEXT (strcat "AREA = " AREAV2 " SF" 
                        "\nPERIMETER = " PERIV1 " FT"))); Set ATS string 
;;
   (SETCALL)
;;
;;
   (SETVARS)						; Reset variables
   (setq *error* PERROR)                                ; Reset previous error
   (prompt "\n.    ")                                   ; Clear the command Line
   (prompt "\n.    ")                                   ; Clear the command Line
   (princ)                                              ; Nil supression
   )                                                    ; End RATOOLS
;;
;;
;; ****************************************
;; *     ==  Area Tools Print Help  ==    *
;; *                                      *
;; ****************************************
;;
;;
   (defun c:ATH ()
   (prompt "\n ")
   (prompt "\n ")
   (prompt "\n *** Area Tools Help ***")
   (prompt "\n
You can set the layer name, layer color and line type that the leaders and
Boundary Polylines will use. Note: if polyline is auto deleted then just
the leader layer is used. If the polyline is not auto deleted then the
ployline is placed on the seperate layer. The default layer name is
Area Border, and the default setting is to NOT DELETE the Boundary polyline.")
   (prompt "\n
To change the settings open the lisp file in notepad and look for the section
marked == Specify Conditions ==. Additionally you may individually reset the
precision of the values returned. By default SI, SF, and PR are set to 0;
AC and HT are set to 2.")
   (prompt "\n
After you load the utility, type in a command (lets say ATF <enter>). Pick a
point inside the area to be measured...Pick where you want the text placed...
Then the utility will ask if you have a defined polyline...if not type in NO or
N ... it will use the boundary command to create a polyline around the area you
picked...it will use that polyline to determine the area and delete the polyline
if the auto deletion option is set to yes, then place the text.")
   (prompt "\n
If you have a polyline type in YES, Y or hit enter as the default and pick the
polyline. Note: must be a closed polyline.")
   (prompt "\n ")
   (prompt "\n KEY      FUNCTION")
   (prompt "\n ---	--------")
   (prompt "\n ATI	SQUARE INCHES")
   (prompt "\n ATF	SQUARE FEET")
   (prompt "\n ATY     SQUARE YARDS")
   (prompt "\n ATA	ACRES")
   (prompt "\n ATT	HECTARE")
   (prompt "\n ATP	PERIMETER")
   (prompt "\n ATC	COMBO [SF & AC]")
   (prompt "\n ATS	STANDARD [SF & PR]")
   (prompt "\n ATH	AREA TOOLS HELP")
   (prompt "\n ---	--------")
   (prompt "\n ")
   (textscr)
   (prompt "\n ")
   (princ)
   )
;;
;;
;; ****************************************
;; *     ==  Area Tools Functions  ==     *
;; *                                      *
;; ****************************************
;;
;;
   (defun C:ATI ( / ATF CLFN LAYN LAYC LINEN CCDI CCME CCOL CDMS
                    CFDI CLTY CLAY CORM COSM CSAN PT1 PT2 ATEXT
                    AREAV AREAV1 AREAV2 AREAV3 AREAV4 PERIV ANS1
                    AP1 AP2 AP3 AP4 AP5 AP6 AUNITS VP VAR BLAYC
                    BLAYN BLINEN LLAYC LLAYN LLINEN DELBPL APATH
                    LTSF)
      (setq ATF 1)
      (RATOOLS)
      (princ)
   )
;;
   (defun C:ATF ( / ATF CLFN LAYN LAYC LINEN CCDI CCME CCOL CDMS
                    CFDI CLTY CLAY CORM COSM CSAN PT1 PT2 ATEXT
                    AREAV AREAV1 AREAV2 AREAV3 AREAV4 PERIV ANS1
                    AP1 AP2 AP3 AP4 AP5 AP6 AUNITS VP VAR BLAYC
                    BLAYN BLINEN LLAYC LLAYN LLINEN DELBPL APATH
                    LTSF)
      (setq ATF 2)
      (RATOOLS)
      (princ)
   )
;;
   (defun C:ATY ( / ATF CLFN LAYN LAYC LINEN CCDI CCME CCOL CDMS
                    CFDI CLTY CLAY CORM COSM CSAN PT1 PT2 ATEXT
                    AREAV AREAV1 AREAV2 AREAV3 AREAV4 PERIV ANS1
                    AP1 AP2 AP3 AP4 AP5 AP6 AUNITS VP VAR BLAYC
                    BLAYN BLINEN LLAYC LLAYN LLINEN DELBPL APATH
                    LTSF)
      (setq ATF 3)
      (RATOOLS)
      (princ)
   )
;;
   (defun C:ATA ( / ATF CLFN LAYN LAYC LINEN CCDI CCME CCOL CDMS
                    CFDI CLTY CLAY CORM COSM CSAN PT1 PT2 ATEXT
                    AREAV AREAV1 AREAV2 AREAV3 AREAV4 PERIV ANS1
                    AP1 AP2 AP3 AP4 AP5 AP6 AUNITS VP VAR BLAYC
                    BLAYN BLINEN LLAYC LLAYN LLINEN DELBPL APATH
                    LTSF)
      (setq ATF 4)
      (RATOOLS)
      (princ)
   )
;;
   (defun C:ATT ( / ATF CLFN LAYN LAYC LINEN CCDI CCME CCOL CDMS
                    CFDI CLTY CLAY CORM COSM CSAN PT1 PT2 ATEXT
                    AREAV AREAV1 AREAV2 AREAV3 AREAV4 PERIV ANS1
                    AP1 AP2 AP3 AP4 AP5 AP6 AUNITS VP VAR BLAYC
                    BLAYN BLINEN LLAYC LLAYN LLINEN DELBPL APATH
                    LTSF)
      (setq ATF 5)
      (RATOOLS)
      (princ)
   )
;;
   (defun C:ATP ( / ATF CLFN LAYN LAYC LINEN CCDI CCME CCOL CDMS
                    CFDI CLTY CLAY CORM COSM CSAN PT1 PT2 ATEXT
                    AREAV AREAV1 AREAV2 AREAV3 AREAV4 PERIV ANS1
                    AP1 AP2 AP3 AP4 AP5 AP6 AUNITS VP VAR BLAYC
                    BLAYN BLINEN LLAYC LLAYN LLINEN DELBPL APATH
                    LTSF)
      (setq ATF 6)
      (RATOOLS)
      (princ)
   )
;;
   (defun C:ATC ( / ATF CLFN LAYN LAYC LINEN CCDI CCME CCOL CDMS
                    CFDI CLTY CLAY CORM COSM CSAN PT1 PT2 ATEXT
                    AREAV AREAV1 AREAV2 AREAV3 AREAV4 PERIV ANS1
                    AP1 AP2 AP3 AP4 AP5 AP6 AUNITS VP VAR BLAYC
                    BLAYN BLINEN LLAYC LLAYN LLINEN DELBPL APATH
                    LTSF)
      (setq ATF 7)
      (RATOOLS)
      (princ)
   )
;;
   (defun C:ATS ( / ATF CLFN LAYN LAYC LINEN CCDI CCME CCOL CDMS
                    CFDI CLTY CLAY CORM COSM CSAN PT1 PT2 ATEXT
                    AREAV AREAV1 AREAV2 AREAV3 AREAV4 PERIV ANS1
                    AP1 AP2 AP3 AP4 AP5 AP6 AUNITS VP VAR BLAYC
                    BLAYN BLINEN LLAYC LLAYN LLINEN DELBPL APATH
                    LTSF)
      (setq ATF 8)
      (RATOOLS)
      (princ)
   )
;;
;;
;; ****************************************
;; *    ==  Load Message  ==              *
;; *                                      *
;; ****************************************
;;
;;
   (prompt "\n  AreaTools.lsp Loaded")
   (prompt "\n  Written by G.L. Chip Harper")
   (prompt "\n  ATH for HELP")
   (prompt "\n    ")
   (princ)
;;
;;
;; ****************************************
;; *    ==  End of File  ==               *
;; *                                      *
;; ****************************************