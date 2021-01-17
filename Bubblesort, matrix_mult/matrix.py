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
    y = x   #copying x into 2 new arrays

result=[[0 for col in range(5)] for row in range(5)]


for r in y:
   print(r)
   
for r in x:
   print(r)
   
# iterate through rows of X
for i in range(len(x)):
   # iterate through columns of Y
   for j in range(len(y[0])):
       # iterate through rows of Y
       for k in range(len(y)):
           result[i][j] += x[i][k] * y[k][j]

for r in result:
   print(r)
