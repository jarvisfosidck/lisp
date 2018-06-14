#Find which files are not longer good
#jarvis 06-08-06


from win32com.shell import shell
import pythoncom, os, re, os.path, shutil, string

ckpath = 'd:/'
def write2log(str):
    log = open('c:/file_report.txt', 'a')
    open.write(log, str)
    open.close(log)
    
   
def inspectprj(prj):
    dirs = []
    files = []
    if os.path.isdir(prj):
        try:
            for x in os.listdir(prj):
                inspectprj(os.path.join(prj, x))
                                                                    
        except (WindowsError):
            dirs.append(os.path.join(prj))

                               
##            try:
##                if os.path.isfile(os.path.join(prj, x)):
##                    op = open(os.path.join(prj, x), 'r')
##                    open.close(op)
##                
##            except (WindowsError):
##                files.append(x)

        if len(dirs) > 0:
            #write2log(str(len(dirs)) +  ' Corrupt Directories Found: \n')
            for x in dirs:
                write2log ('Corrupt: ' + str(os.path.join(prj, x)) + '\n' )
        

##        if len(files) > 0:        
##            write2log(str(len(files)) +  ' Corrupt Files Found: \n')
##            for x in files:
##                write2log ('Corrupt: ' + str(os.path.join(files, x)) + '\n')
##
##         
