start_time<-Sys.time()

x<-scan(file = "number2.txt", what = numeric(), sep = "\n")
y<-scan(file = "number2.txt", what = numeric(), sep = "\n") 

x<-matrix(x, nrow = 5, byrow = TRUE)
y<-matrix(y, nrow=5, byrow = TRUE)


print("multiplied matrix is:")

x %*% y

end_time<-Sys.time()

end_time-start_time