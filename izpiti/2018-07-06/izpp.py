import math

def simetricen(s):
    if len(s) <= 1:
        return True
    if s[0] != s[-1]:
        return False
    else:
        return simetricen(s[1:-1])

def stevilo_delov(s):
    if simetricen(s):
        return 1
    else:
        return min([(1 + stevilo_delov(s[i:]))for i in range(1,len(s)+1) if simetricen(s[:i])])

'''def razdeli(s):
    if simetricen(s):
        return [s]
    else:
        sez = []
        for i in range(1,len(s)+1):
            if simetricen(s[:i]):
                sez.append([s[:i][:]] + razdeli(s[i:])[:])
        return min(sez, key=lambda x: len(x))'''

def vsotno_simetricen(s):
    m = math.floor(len(s)/2)
    l1 = s[:m]
    l2 = s[m:]
    return sum([int(i) for i in l1]) == sum([int(i) for i in l2])

def razdeli(s, f):
    if f(s):
        return [s]
    else:
        sez = []
        for i in range(1,len(s)+1):
            if f(s[:i]):
                sez.append([s[:i][:]] + razdeli(s[i:], f)[:])
        return min(sez, key=lambda x: len(x))