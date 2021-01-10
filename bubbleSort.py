def bubbleSort(arr):
    n = len(arr)
    
    for i in range(n):
        
        for j in range(0, n-i-1):
            if arr[j] > arr[j+1] :
                arr[j], arr[j+1] = arr[j+1], arr[j]

arr = list()
filename = 'numbers.txt'
with open(filename) as fin:
    for line in fin:
        arr.append(line)
print(arr)  

bubbleSort(arr)

print ("Sorted array is:") 
for i in range(len(arr)): 
    print ("%s" %arr[i]), 