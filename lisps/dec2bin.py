def dec2bin (num ):
    bin = []
    num = int(num)
    if num > 1:
        while num > 1 :
            x = num % 2
            num = num / 2
            bin.append(x)

        bin.append(1)
    else:
        x = num % 2
        bin.append(x)

    bin.reverse()
    sum = ''
    for a in bin:
        sum = sum + str(a)

    sum = int(sum)        
   ##bin = bin.reverse()
    return sum, bin   
    