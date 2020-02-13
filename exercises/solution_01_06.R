set.seed(1)
data("mtcars")
data("AirPassengers")
data("airquality")
myvec = rnorm(1000)
mymat = matrix(data = sample(1:10000, size = 625), ncol = 25)
mylist = list(myvec,
              mtcars,
              mymat,
              airquality,
              AirPassengers)

print(paste("Mean of mtcars$mpg: ", mean(mylist[[2]]$mpg)))
print(paste("Element [12,15] of mymat: ", mylist[[3]][12,15]))
print(paste("First element of AirPassenger: ", mylist[[5]][1]))

