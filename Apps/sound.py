##calculate sound in Db at distance x

def soundp (it_db, dist):
    return it_db - ((6 / math.log10(2)) * math.log10(dist))

def soundpw (it_db, dist):
    return it_db - ((6.5 / math.log10(2)) * math.log10(dist))

def soundp9 (it_db, dist):
    return it_db - ((9.0 / math.log10(2)) * math.log10(dist))

def soundc (it_db, dist):
    return it_db - ((3 / math.log10(2)) * math.log10(dist))

def soundcavg (it_db, dist):
    return it_db - ((3.54 / math.log10(2)) * math.log10(dist))

def soundcs (it_db, dist):
    return it_db - ((4 / math.log10(2)) * math.log10(dist))

def soundcT (it_db, fn_db):
    d_db = it_db-fn_db
    return math.pow(10, (d_db /  (3.0 / math.log10(2))))

def soundcsT (it_db, fn_db):
    d_db = it_db-fn_db
    return math.pow(10, (d_db /  (4.0 / math.log10(2))))

def soundpT (it_db, fn_db, loss):
    d_db = it_db-fn_db
    return math.pow(10, (d_db /  (loss / math.log10(2))))

def soundpavg (it_db, fn_db):
    d_db = it_db-fn_db
    return math.pow(10, (d_db /  (3.54 / math.log10(2))))

def soundep (end_db, dist):
    return end_db + (math.log10(dist) * (6 / math.log10(2)))

def soundec (end_db, dist):
    return end_db + ((3 / math.log10(2)) * math.log10(dist))

def soundrf (it_db, fn_db, dist):
    d_db = it_db-fn_db
    return (d_db * math.log10(2)) / math.log10(dist)






