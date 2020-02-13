matrika = [ [ 1 , 2 , 0 ],
     [ 2 , 4 , 5 ],
     [ 7 , 0 , 1 ] ]

def geodetka(mat, i, j):
    if (i,j) in memo:
        return memo[(i,j)]
    elif i == 1:
        memo[(i,j)] = sum(mat[0][:j])
        return memo[(i,j)]
    elif j == 1:
        memo[(i,j)] = sum([i[0] for i in mat[:i]])
        return memo[(i,j)]
    else:
        memo[(i,j)] = mat[i-1][j-1] + max(geodetka(mat, i, j-1), geodetka(mat, i-1, j))
        return memo[(i,j)]

memo = {}