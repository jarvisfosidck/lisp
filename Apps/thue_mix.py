##Jarvis Fosdick
##October 10, 2007
##mix ThueMoore sequence lists
from PIL import Image
angle_file = open('c:/angle_file.txt', "w")

base3 = open('c:/thue_base2.txt', 'r')
base6 = open('c:/thue_base6.txt', 'r')
base24 = open('c:/thue_base24.txt', 'r')
base72 = open('c:/thue_base72.txt', 'r')

for x3 in base3:
    if int(x3) == 0 and int(x3) != '':
        print >> angle_file, 360 / (1+float(base24.readline()))
    if int(x3) < 3 and int(x3) != '':
        print >> angle_file, 360 / (1+ float(base72.readline()))

base3.close()
base6.close()
base24.close()
base72.close()