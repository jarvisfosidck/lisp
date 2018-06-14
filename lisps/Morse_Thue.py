##Jarvis Fosdick
##August 6, 2007
##writes a file with lines of Morse-Thue Sequence generalized to base 5
##

ThueFile = open('thue_base3.txt', "w")
Morse = 0
def base3(num) :
    a = (num / 3)
    b = num % 3
    return str(a)+str(b)

for x in range(0, 30000):
    m = (int(base3(x)) / 3) + int(base3(x)) % 3


    print >> ThueFile, m % 3

ThueFile.close()
