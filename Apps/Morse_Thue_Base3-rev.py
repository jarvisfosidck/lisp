##Jarvis Fosdick
##August 6, 2007
##writes a file with lines of Morse-Thue Sequence generalized to base 5
##

ThueFile = open('c:/thue_base3.txt', "w")
Morse = 0
def dec2base (num, base ):
    bin = []
    num = int(num)
    if num > 1:
        while num >= 1 :
            x = num % base
            num = num / base
            bin.append(x)

        #bin.append(1)
    else:
        x = num % base
        bin.append(x)
        
    # print bin
    bin.reverse()
    #print bin
    sum = ''
    #print bin
    for a in bin:
        sum = sum + str(a)
    #print sum
    #sum = int(sum)        
   ##bin = bin.reverse()
    return int(sum),bin

for x in range(0, 30000):
    sum = dec2base(x,3)
    print >> ThueFile, sum[0]%3
    
ThueFile.close()
    
