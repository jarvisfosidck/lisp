##Jarvis Fosdick
##August 6, 2007
##writes a file with lines of Morse-Thue Sequence generalized to base 5
##

ThueFile = open('c:/thue_base2.txt', "w")
Morse = 0
def base2(num) :
    a = (num / 2)
    b = num % 2
    return str(a)+str(b)

dec2bin = lambda x: (dec2bin(x/2) + str(x%2)) if x else ''

for x in range(1, 6000):
    m = dec2bin(x)
    
    
        
    print >> ThueFile, int(m)%2
    
ThueFile.close()
    
