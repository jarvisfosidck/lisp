##Jarvis Fosdick
##August 6, 2007
##writes a file with lines of Morse-Thue Sequence generalized to base 5
##

ThueFile = open('c:/thue_base24.txt', "w")
Morse = 0
def base3(num) :
    a = (num / 24)
    b = num % 24
    return str(a)+str(b)

for x in range(0, 4000):
    m = (int(base3(x)) / 10) + int(base3(x)) % 24
    
        
    print >> ThueFile, m % 24
    
ThueFile.close()
    
