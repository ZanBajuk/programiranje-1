from functools import lru_cache

###############################################################################
# Napisite funkcijo [najdaljse_narascajoce_podazporedje], ki sprejme seznam in
# poisce najdaljse (ne strogo) narascajoce podzaporedje stevil v seznamu.
#
# Na primer: V seznamu [2, 3, 6, 8, 4, 4, 6, 7, 12, 8, 9] je najdaljse naj vrne
# rezultat [2, 3, 4, 4, 6, 7, 8, 9].
###############################################################################


def najdaljse_narascajoce_podzaporedje(sez):
    l = len(sez)
    def zap(sez, last, i, s):
        #print(sez, last, i, s)
        if l - i <= 1:
            #print("konec", s)
            return s
        elif sez[i] >= last:
            return zap(sez, sez[i], i+1, s + [sez[i]])
        else:
            s1 = zap(sez, last, i+1, s)
            s2 = zap(sez, sez[i],i+1,sez_od(s, sez[i]))
            if len(s1) > len(s2):
                return s1
            else:
                return s2
    return zap(sez, sez[0], 1, [sez[0]])

def sez_od(sez, n):
    for i in range(len(sez)):
        if sez[i] > n:
            return sez[0:i] + [n]
    return sez + [n]


###############################################################################
# Nepreviden študent je pustil robotka z umetno inteligenco nenadzorovanega.
# Robotek želi pobegniti iz laboratorija, ki ga ima v pomnilniku
# predstavljenega kot matriko števil:
#   - ničla predstavlja prosto pot
#   - enica predstavlja izhod iz laboratorija
#   - katerikoli drugi znak označuje oviro, na katero robotek ne more zaplejati

# Robotek se lahko premika le gor, dol, levo in desno, ter ima omejeno količino
# goriva. Napišite funkcijo [pobeg], ki sprejme matriko, ki predstavlja sobo,
# začetno pozicijo in pa število korakov, ki jih robotek lahko naredi z
# gorivom, in izračuna ali lahko robotek pobegne. Soba ima vedno vsaj eno
# polje.
#
# Na primer za laboratorij:
# [[0, 1, 0, 0, 2],
#  [0, 2, 2, 0, 0],
#  [0, 0, 2, 2, 0],
#  [2, 0, 0, 2, 0],
#  [0, 2, 2, 0, 0],
#  [0, 0, 0, 2, 2]]
#
# robotek iz pozicije (3, 1) pobegne čim ima vsaj 5 korakov, iz pozicije (5, 0)
# pa v nobenem primeru ne more, saj je zagrajen.
###############################################################################

soba = [[0, 1, 0, 0, 2],
        [0, 2, 2, 0, 0],
        [0, 0, 2, 2, 0],
        [2, 0, 0, 2, 0],
        [0, 2, 2, 0, 0],
        [0, 0, 0, 2, 2]]


def dist(x,y):
    return abs(x[0]-y[0]) + abs(x[1]-y[1])

def pobeg(soba, pozicija, koraki):
    cilj = (0,0)
    m = []
    for i in range(len(soba)):
        for j in range(len(soba[0])):
            if soba[i][j] == 1:
                cilj = (i,j)
            m.append((i,j))
    polja = {}
    def pob(soba, pozicija, koraki):
        if koraki == 0:
            return
        else:
            for i in range(4):
                if i == 0: #desno
                    ps = (pozicija[0]+1,pozicija[1])
                elif i == 1:
                    ps = (pozicija[0],pozicija[1]+1)
                elif i == 2:
                    ps = (pozicija[0]-1,pozicija[1])
                else:
                    ps = (pozicija[0],pozicija[1]-1)
                if ps in m:
                        if soba[ps[0]][ps[1]] == 0:
                            if ps in polja:
                                if koraki > polja[ps]:
                                    polja[ps] = koraki
                            else:
                                polja[ps] = koraki
                                pob(soba, ps, koraki-1)
    if (pozicija[0],pozicija[1]) in polja:
        return True
    return False


