##jarvis fosdick
##07-28-06
##first generator using yield
import os

def dirs(path):
    for d in os.listdir(path):
        yield d


for x in dirs('c:/'):
    print x


print '\nAll that on the c:/ drive?'


##The above is also the same as follows, however
##os.walk includes subdirectoies and returns a tuple of stuff

for x in os.walk('e:/'):
    print x[1]
        

print 'Done by using the os.walk module'

##so try this, which somehow seems to copy ereased files as well?!:

def dirs(path):
    for d in os.listdir(path):
        yield d


def sdirs(path):
    for x in dirs(path):
        try:
            if os.path.isdir(os.path.join(path,x)):
                sdirs(os.path.join(path,x))
            
            shutil.copy2(os.path.join(path,x),(os.path.join('c:/dwg',x)))
        except:
            pass
#sdirs('e:/')

print '\nAll that erased what?'
