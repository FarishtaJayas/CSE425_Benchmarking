
bubblesort <- function(arr){
  
  n = length(arr)
  v = arr
  
  for(j in 1:(n-1))
  {
    for(i in 1:(n-j))
    {
      if(v[i+1]<v[i])
      {
        t = v[i+1]
        v[i+1] = v[i]
        v[i] = t    
      }
    }
  }
  print(v)
  arr = v 
}

y<-scan(file = "numbers.txt", what = numeric(), sep = "\n") 

sortedarray<-bubblesort(y)

print("Sorted array is:")

sortedarray
