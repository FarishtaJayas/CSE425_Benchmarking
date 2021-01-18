start_time<-Sys.time()

x<-scan(file = "numbers.txt", what = numeric(), sep = "\n")
y<-scan(file = "numbers.txt", what = numeric(), sep = "\n") 

x<-matrix(x, nrow = 1000, byrow = TRUE)
y<-matrix(y, nrow=1000, byrow = TRUE)


print("multiplied matrix is:")

x %*% y

end_time<-Sys.time()

end_time-start_time