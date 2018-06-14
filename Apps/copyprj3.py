##copy project folders from one computer to //hal/prj
##and modify the dfm file, if possible
##jarvis 10-14-03
from win32com.shell import shell
import pythoncom, os, re, os.path, shutil, string

#this function creats a .dfm file for a project given a project directory
#It is used by the other progrmas
def copysdsk(sdskfile, newpath, pjroot):
    sdsk = open(sdskfile, "r")
    newsdsk = open(os.path.join (newpath, 'sdsk.dfm'), "w")
    flag1 = 1
    while flag1 < 2 :
        line = open.readline(sdsk)       
        if re.search('^PROJ=', line):
            open.write(newsdsk, "PROJ=(\\\\hal\\prj\\amanda\\" + pjroot + "\PROJ\,Project Root)" + '\n')												 
        if not re.search('^PROJ=', line):
            open.write(newsdsk, line) # + '\n')
        if line == '':
            flag1 = 3
    open.close(sdsk)
    open.close(newsdsk)
#use this command to copy projects set up with the dfm file next to the dwg file
def copydir(path2look, destin):
    for f in os.listdir(path2look):
            if os.path.exists(os.path.join(path2look, f)) and os.path.isdir(os.path.join(path2look, f)):
                for x in os.listdir(os.path.join(path2look, f)):
                    x = string.lower(x)
                    path = os.path.join(path2look, f, x)
                    if os.path.isfile(path) and x.endswith('dsk.dfm') and not os.path.exists(os.path.join(destin, f)):
                        shutil.copytree(os.path.join(path2look, f), os.path.join(destin, f))
                        copysdsk(path, os.path.join(destin, f), f) 

                    

###deletes directories in the delpath if it exists in the savepath
##def delcopy(delpath, savepath):
##    for f in os.listdir(savepath):
##        if os.path.exists(os.path.join(delpath, f)) and os.path.isdir(os.path.join(delpath, f)):
##            shutil.rmtree(os.path.join(delpath, f))
##
##        

#will fix .dfm file in project directory if created errouosly by copysdsk    
def fixsdsk(path2look):
    for f in os.listdir(path2look):
            if os.path.exists(os.path.join(path2look, f)) and os.path.isdir(os.path.join(path2look, f)):
                for x in os.listdir(os.path.join(path2look, f)):
                    x = string.lower(x)
                    path = os.path.join(path2look, f, x)
                    if os.path.isfile(path) and x.endswith('dsk.dfm'):
                        copysdsk('//hal/cad/sdsk2.dfm', os.path.join(path2look, f), f) 
        

#use this command to copy projects with the project root in the c:/sdsk path  
def projectnet(prjpath, dwgpathlist, dstn):
    for f in os.listdir(prjpath):
        if not os.path.exists(os.path.join(dstn, f)) and os.path.isdir(os.path.join(prjpath, f)):
            os.makedirs(os.path.join(dstn, f, 'proj'),mode=0777)
            shutil.copytree(os.path.join(prjpath, f), os.path.join(dstn, f, 'proj', f))
            copysdsk('//hal/cad/sdsk2.dfm', os.path.join(dstn, f), f)
            if os.path.exists(os.path.join(prjpath, f, 'dwg')):
                for dfm in os.listdir(os.path.join(prjpath, f, 'dwg')):
                    if dfm.endswith('.dfm'):
                        for x in dwgpathlist:
                            fndfile = re.sub('.dfm', '.dwg', dfm)
                            if os.path.isfile(os.path.join(x, fndfile)):
                                shutil.copy2(os.path.join(x, fndfile), os.path.join(dstn, f))

                            if os.path.isfile(os.path.join(x, f, fndfile)):
                                shutil.copy2(os.path.join(x, f, fndfile), os.path.join(dstn, f))

                            for fdir in x:
                                if re.match(f+'.', fdir) or re.match(fdir+'.', f) and os.path.isdir(os.path.join(x, fdir)):
                                    shutil.copytree(os.path.join(x, fdir), os.path.join(dstn, f, fdir))
##
###deletes stuff
##def rmnodwg(path):
##    for x in path:
##        if x.endswith('.dwg'):
##            flag = 1
##        else:
##            flag = 0
##
##        if flag == 0:
##            os.rmdir(os.path.join(path, x))            

#tries to copy a single project given its parent directory
#if the .dfm file is in the project direcotry it will search
#for the assocated drawings in the paths supplied by dwgpathlist
def singlepnet(prjpath, project, dwgpathlist):    
    if not os.path.exists(os.path.join('//hal/prj', project)) and os.path.isdir(os.path.join(prjpath, project)):
        os.mkdir(os.path.join('//hal/prj', project))
        os.mkdir(os.path.join('//hal/prj', project, 'proj'))
        shutil.copytree(os.path.join(prjpath, project), os.path.join('//hal/prj', project, 'proj', project))
        copysdsk('//hal/cad/sdsk2.dfm', os.path.join('//hal/prj', project), project)
        if os.path.exists(os.path.join(prjpath, project, 'dwg')):
            for dfm in os.listdir(os.path.join(prjpath, project, 'dwg')):
                if dfm.endswith('.dfm'):
                    for x in dwgpathlist:
                        fndfile = re.sub('.dfm', '.dwg', dfm)
                        if os.path.isfile(os.path.join(x, fndfile)):
                            shutil.copy2(os.path.join(x, fndfile), os.path.join('//hal/prj', project))

                        if os.path.isfile(os.path.join(x, project, fndfile)):
                            shutil.copy2(os.path.join(x, project, fndfile), os.path.join('//hal/prj', project))

                        for fdir in x:
                            if re.match(project+'.', fdir) or re.match(fdir+'.', project) and os.path.isdir(os.path.join(x, fdir)):
                                shutil.copytree(os.path.join(x, fdir), os.path.join('//hal/prj', project, fdir))            

    


