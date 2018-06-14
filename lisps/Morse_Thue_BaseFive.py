##Jarvis Fosdick
##August 6, 2007
##writes a file with lines of Morse-Thue Sequence generalized to base 5
##

ThueFile = open('base5.txt', "w")
Morse = 0
def dec2bin (num ):
    bin = []
    num = int(num)
    if num > 1:
        while num > 1 :
            x = num % 5
            num = num / 5
            bin.append(x)

        bin.append(1)
    else:
        x = num % 5
        bin.append(x)

    bin.reverse()
    sum = 0
    for a in bin:
        sum = sum + a

    #sum = int(sum)
   ##bin = bin.reverse()
    return sum

for x in range(0, 30):
    sum = dec2bin(x)
    print >> ThueFile, sum%5

ThueFile.close()
