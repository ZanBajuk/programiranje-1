from functools import lru_cache
import math

#rešimo koombinatorično:
#a)
def postavitve(n, m, l):
    #m korit širine l ki se ne smejo dotikat je enako m-1 korit dolzine l+1 in 1 korito dolzine l ki se lahko dotika.
    st_polj = n - ((m * (l + 1)) - 1) #Izracunamo stevilo prostih polj ko postavimo vsa 'nova' korita čisto na začetek (da lahko zračunamo stevilo vseh polj kjer se lahko nahajajo)
    #stevilo postavitev je enako problemu stevilo postavitev m enakih krogljic na (m+st_polj) polj, torej binomski koeficient
    if st_polj < 0:
        return 0
    else: #Binomski koeficient (m + st_polj, m)
        #print(m, st_polj)
        return int((math.factorial(m+st_polj)/(math.factorial(m)* math.factorial(st_polj))))

#b)
def postavitve2(n, sez):
    #Spet podobno vsako razen zadnjega korita obravnavamo kot korito daljse za 1, na kar se problem spet prenese na stetje kroglic
    st_polj = n - (sum(sez) + len(sez) - 1) #podobno kot prej izracunamo stevilo prostih polj, ko postavimo "nova" korita na začetek
    if st_polj < 0:
        return 0
    else: #Binomski koeficient (m + st_polj, m)
        return int((math.factorial(len(sez)+st_polj)/(math.factorial(len(sez))* math.factorial(st_polj))))

#rešimo z dinamičnim programiranjem(za vsak slučaj, če je prva rešitev narobe, bo upam vsaj ta pravilna(Težko je na roke računati večje primere ¯\_(ツ)_/¯))
#a)
@lru_cache(maxsize=None)
def postavitve3(n, m, l):
    if m == 0:
        return 1
    st_polj = n - ((m - 1) * (l + 1)) - l #Pove na koliko prvih polj lahko postavimo 1. korito
    if st_polj < 0:
        return 0
    elif st_polj == 0:
        return 1
    else:
        #print(st_polj, [(n-l-i-1, m-1, l) for i in range(st_polj + 1)])
        #return 5
        return sum([postavitve3(n-l-i-1, m-1, l) for i in range(st_polj + 1)])

#b)
@lru_cache(maxsize=None)
def postavitve4(n, sez):
    if len(sez) == 0:
        return 1
    st_polj = n - (sum(sez) + len(sez) - 1)
    if st_polj < 0:
        return 0
    elif st_polj == 0:
        return 1
    else:
        return sum([postavitve4(n-sez[0]-i-1, sez[1:]) for i in range(st_polj + 1)])

#lep dan želim