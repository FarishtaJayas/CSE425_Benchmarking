
with open('number2.txt') as f:
    l = [int(i) for i in f]
    part = 5
    x = []
    start, end = 0, part


    while end <= len(l):
        temp = []
        for i in range(start, end):
            temp.append(l[i])
            x.append(temp)
            start += part
            end += part
    y = result = x   #copying x into 2 new arrays

# iterate through rows of X
for i in range(len(X)):
   # iterate through columns of Y
   for j in range(len(Y[0])):
       # iterate through rows of Y
       for k in range(len(Y)):
           result[i][j] += X[i][k] * Y[k][j]

for r in result:
   print(r)

