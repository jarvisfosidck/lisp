##Jarvis Fosdick
##August 6, 2007
##writes a file with lines of Morse-Thue Sequence generalized to base 5
##

ThueFile = open('c:/thue_base4.txt', "w")
Morse = 0
def base4(num) :
    a = (num / 4)
    b = num % 4
    return str(a)+str(b)

for m in range(0, 30000):
    #m = (int(base4(x)) / 10) + int(base4(x)) % 4
    
        
    print >> ThueFile, m % 3
    
ThueFile.close()
    
