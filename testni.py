k = 0
for j in range(100):
    for i in range(46867749):
        k += k % 10
    print("..")
print(k)