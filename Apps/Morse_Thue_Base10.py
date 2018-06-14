##Jarvis Fosdick
##August 6, 2007
##writes a file with lines of Morse-Thue Sequence generalized to base 5
##

ThueFile = open('c:/base10.txt', "w")
Morse = 0
def base5(num) :
    a = (num / 10)
    b = num % 10
    return str(a)+str(b)

for x in range(0, 30000):
    m = (int(base5(x)) / 10) + int(base5(x)) % 10
    
        
    print >> ThueFile, m % 10
    
ThueFile.close()
    
