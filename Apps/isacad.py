##jarvis fosdick
##July 27, 2007
##see if first charactors in file are 'ACAD1014'

def isacad(f):
    try:
        fo = open(f, "r")
        if open.read(f, 6) == 'ACAD1014':
            shutil.copy(f,dst)
            
        open.close(fo)
        
    except:
        pass
    