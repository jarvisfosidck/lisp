##jarvis fosdick
##July 27, 2007
##copies misnamed, .bak and .tmp files from tree-directory to single directory

       
      
global cnt
cnt = 0

def isacad(f, cnt):
    

    fo = open(f, "r")
    ac = open.read(fo, 6)
    if ac == 'AC1014':
        cnt = cnt + 1
        shutil.copy(f,'e:\de/'+str(cnt)+'.dwg')
        print f
        
    open.close(fo)

        
    
def foreach_file_in_dir(path):
    
    for d in os.listdir(path):
        if os.path.isdir(os.path.join(path, d)):
            foreach_file_in_dir(os.path.join(path, d))
        elif os.path.isfile(os.path.join(path, d)):
            cnt = cnt + 1
            isacad(os.path.join(path, d), cnt)


 

