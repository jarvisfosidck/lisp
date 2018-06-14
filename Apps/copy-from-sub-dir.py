##COPY JPG FILES 
##jarvis fosdick 09-17-2008

import os, math, random, shutil
path = 'n:/acad/projects/Web Page Info/ga_com'
#path = 'n:/acad/projects/Web Page Info/Residential'
#path = 'N:/Acad/Projects/Web Page Info/Theatre Gallery'
dir = os.listdir(path)
cnt = 1000
for x in dir:
    if os.path.isdir(os.path.join(path, x)):
        for y in os.listdir(os.path.join(path, x)):
            n=int(100*random.random())
            cnt = cnt+1
            n = str(cnt)+str(n)
            if y.endswith('.jpg') or y.endswith('JPG'):
                shutil.copy2(os.path.join(path, x, y), os.path.join('n:/www/ca',n+'.jpg'))
            elif y.endswith('.tif') or y.endswith('.TIF'):
                shutil.copy2(os.path.join(path, x, y), os.path.join('n:/www/ca',n+'.tif'))

            

            