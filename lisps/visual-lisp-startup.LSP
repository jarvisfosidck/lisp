;;basic template for loading visual lisp
;;jarvis, 09-20-2007

(vl-load-com)
(setq acaddoc (vla-get-activedocument (vlax-get-acad-object)))
(setq mspace (vla-get-modelspace acaddoc))
