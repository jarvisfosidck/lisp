##jarvis fosdick
##July 27, 2007
##copies misnamed, .bak and .tmp files from tree-directory to single directory

import os, shutil
class dwg:
    
    cnt = 800

    def isacad(self, f, cnt):
            
        try:
            
            fo = open(f, "r")
            
            ac = open.read(fo, 6)
            print ac
            if ac == 'AC1014':
                cnt = cnt + 1
                shutil.copy(f,'h:/vander/'+str(cnt)+'.dwg')
                print f
            
                
            open.close(fo)
        except:
            pass

                
            
    def foreach_file_in_dir(self, path):
        
        
        for d in os.listdir(path):
            if os.path.isdir(os.path.join(path, d)):
                self.foreach_file_in_dir(os.path.join(path, d))
            elif os.path.isfile(os.path.join(path, d)):
                dwg.cnt = dwg.cnt + 1
                self.isacad(os.path.join(path, d), dwg.cnt)


    
dwg.foreach_file_in_dir(dwg(),'H:\Data Doctors Transfer\prj\P-5964-Panda\DWG')



     

