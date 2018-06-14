##Updates custom lisp and other files on network
##jarvis 12-12-03
from win32com.shell import shell
import pythoncom, os, re, os.path, shutil, string, cmd

def do2linfile(input_file, xfunction, output_file):
    readfile = open(input_file, "r")
    output = open(output_file, "w")
    flag1 = 1
    while flag1 < 2 :
        line = open.readline(readfile)
        newline = xfunction(line)
        open.write(output, newline)
        if line == '':
            flag1 = 3
    open.close(readfile)
    open.close(output)

def do2append(input_file, xfunction):
    readfile = open(input_file, "r")
    flag1 = 1
    while flag1 < 2 :
        line = open.readline(readfile)
        xfunction(line, "c:/temp2.txt", "c:/temp1.txt")
        if line == '':
            flag1 = 3
    open.close(readfile)
    
def do2line(line, acadlsp, master):
    if findinfile(master, line):
        line = '(autoload \" + line + "\ (list \" + line + "\)'
        acad = open(acadlsp, "r")
        open.write(acad, line)
        open.close(acad)

def findinfile(file, string):
    file = open(file, "r")
    cnt, flag1 = 0 , 1
    while flag1 < 2 :
        line = open.readline(file)
        if re.search(string, line):
            flag1 = 3
        if line == '':
            flag1 = 3
        cnt = cnt + 1
    open.close(file)
    return cnt

def checkacadlisp(master, acadlsp):
    
    do2append(acadlsp, do2line)

def checklsp(acadlsp, master):
   if os.path.isfile(acadlsp) and os.path.isfile(master):
       if not cmp(acadlsp, master) == 0:
           shutil.copy2(master, acadlsp)

def fileage(file):
    fileage = time.time() - os.stat(file).st_mtime
    return fileage

def updatelisp(station, master):
    for x in os.listdir(master):
        if os.path.isfile(os.path.join(master, x)) and os.path.isdir(station):
            if os.path.isfile(os.path.join(station, x)):
                shutil.copy2(os.path.join(master, x), os.path.join(station, x))
                                                
##def updatemaster(develop, master):
##    for x in os.listdir(master):
##        if os.path.isfile(os.path.join(master, x)) and os.path.isfile(os.path.join(develop, x)):
##            shutil.copy2(os.path.join(develop, x), os.path.join(master, x))
##            print x

def copyfile2station(station_list, source):
    for x in station_list:
        if os.path.isfile(source) and os.path.isdir(x):
            shutil.copy2(source, x)
            print source + ' ' + 'copied to ' + x + ' \n'         
        else: print 'did not copy ' + source, 'to: ', x
            
def stations():
    files = ["//rob/c/program files/autocad r14/lisp/acad.lsp", "//steve/c/program files/autocad r14/lisp/acad.lsp", "//jim/c/program files/autocad r14/lisp/acad.lsp", "//hal/c/program files/autocad r14/lisp/acad.lsp", "//toby/c/program files/autocad r14/lisp/acad.lsp", "//jarvis/jarvis/program files/autocad r14/lisp/acad.lsp"]
    sdsk14 = ["//rob/c/sdsk/programs/cg/setup","//steve/c/sdsk/programs/cg/setup","//jim/c/sdsk/programs/cg/setup","//hal/c/sdsk/programs/cg/setup","//jarvis/jarvis/sdsk/programs/cg/setup","//toby/c/sdsk/programs/cg/setup"]
    dirs = ["//rob/c/program files/autocad r14/lisp", "//steve/c/program files/autocad r14/lisp", "//jim/c/program files/autocad r14/lisp", "//hal/c/program files/autocad r14/lisp", "//toby/c/program files/autocad r14/lisp","//jarvis/jarvis/program files/autocad r14/lisp"]
    startup = ["//toby/c/WINDOWS/Start Menu/Programs/StartUp", "//hal/c/WINDOWS/Start Menu/Programs/StartUp", "//jim/c/WINDOWS/Start Menu/Programs/StartUp", "//steve/c/WINDOWS/Start Menu/Programs/StartUp", "//rob/c/WINDOWS/Start Menu/Programs/StartUp", "//jarvis/jarvis/Documents and Settings/Intermill/Start Menu/Programs/Startup"]
    master = "//hal/cad/r14/lisp"
    #masteracad = "//hal/cad/r14/lisp/acad.lsp"
    #mastersdsktxt = "//hal/cad/r14/sdsk/leroy.stp"
    master_startup = "//hal/ctrl/servesock.pyw"
    ##########updatemaster("//jarvis/jarvis/cad/apps/", master)
    for x in files:
        checklsp(x, masteracad)
        print x
    for x in dirs:
        updatelisp(x, master)
        print x
    copyfile2station(sdsk14, mastersdsktxt)
    copyfile2station(startup, master_startup)

def inspectprj(prj):
    dirs = []
    files = []
    if os.path.isdir(prj):
        for x in os.listdir(prj):
            if os.path.isdir(os.path.join(prj, x)):
                dirs.append(x)
            if os.path.isfile(os.path.join(prj, x)):
                files.append(x)

        print str(len(dirs)) +  ' Directories Found: '
        for x in dirs:
            print '  ' + str(len(os.listdir(os.path.join(prj, x)))) + ' items found in subfolder- ' + x
            for y in os.listdir(os.path.join(prj, x)):
                print '    ' + y
        
        print str(len(files)) + ' Top Level Files Found: '
        for x in files:
            print '  ' + x


