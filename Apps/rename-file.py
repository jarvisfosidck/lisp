##jarvis fosdick July 25, 2006
##rename files with one extention to another
##

import os, re, string

def rename(path):
    for n in os.listdir(path):
        if n.endswith('.tmp') and os.path.isfile(os.path.join(path,re.sub('.tmp','.dwg',n))):
            os.rename(os.path.join(path,n),os.path.join(path,re.sub('.tmp','b.dwg',n)))
            
        elif n.endswith('.tmp') and not os.path.isfile(os.path.join(path,re.sub('.tmp','.dwg',n))):
            os.rename(os.path.join(path,n),os.path.join(path,re.sub('.tmp','b.dwg',n)))
            
        if n.endswith('.bak') and os.path.isfile(os.path.join(path,re.sub('.bak','.dwg',n))):
            os.rename(os.path.join(path,n),os.path.join(path,re.sub('.bak','b.dwg',n)))
            
        elif n.endswith('.bak') and not os.path.isfile(os.path.join(path,re.sub('.bak','.dwg',n))):
            os.rename(os.path.join(path,n),os.path.join(path,re.sub('.bak','b.dwg',n)))
                                                    
        if n.endswith('.TMP') and os.path.isfile(os.path.join(path,re.sub('.TMP','.dwg',n))):
            os.rename(os.path.join(path,n),os.path.join(path,re.sub('.TMP','b.dwg',n)))
            
        elif n.endswith('.TMP') and not os.path.isfile(os.path.join(path,re.sub('.TMP','.dwg',n))):
            os.rename(os.path.join(path,n),os.path.join(path,re.sub('.TMP','b.dwg',n)))
        
