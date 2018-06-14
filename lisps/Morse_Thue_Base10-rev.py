##Jarvis Fosdick
##August 6, 2007
##writes a file with lines of Morse-Thue Sequence generalized to base 5
##

ThueFile = open('c:/base10.txt', "w")
Morse = 0
def dec2bin (num ):
    bin = []
    num = int(num)
    if num > 1:
        while num >= 1 :
            x = num % 4
            num = num / 
            bin.append(x)

        
    else:
        x = num % 10
        bin.append(x)

    bin.reverse()
    sum = 0
    for a in bin:
        sum = sum + a

    #sum = int(sum)        
   ##bin = bin.reverse()
    return sum

for x in range(0, 30000):
    sum = dec2bin(x)
    print >> ThueFile, sum%10
    
ThueFile.close()
    
