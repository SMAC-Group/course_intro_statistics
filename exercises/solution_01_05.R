data(mtcars)
x = mtcars$mpg
x = x * 0.425144 
print(paste("mean: ", mean(x)))
print(paste("median: ", median(x)))
print(paste("variance: ", var(x)))
