##Jarvis Fosdick
##October 10, 2007
##Divide Hawaii by Davenport
from PIL import Image
AngFile = open('c:/angle_file.txt', "w")
hawaii = Image.open('c:/sunset.jpg')
davenport = Image.open('c:/davenport.jpg')
h_data = hawaii.getdata()
d_data = davenport.getdata()
last_ang = 5

for h in h_data:
    for d in d_data:
        #ha = (h[0]+h[1]+h[2])/3.0
        #da = (d[0]+d[1]+d[2])/3.0
        if not h[1] == 0:
            ang = d[1]/float(h[1])
            if not ang == last_ang:
                print >> AngFile, ang
            last_ang = ang
            

            

            

AngFile.close()        