# Generate a vector of Natural number
setseed(12345)
sample_size = 5
myvec = sample(0:50, size = sample_size)
myvec

# Bubble sort
for(iter_num in seq(length(myvec)-1, 1, -1)){
  print("############")
  print(paste("Iteration", length(myvec)-iter_num))
  print("############")
  for(idx in seq(iter_num)){
    print(paste("-->Comparing obs", idx, "and obs.", idx+1))
    # if the element at position idx is greater than the element at position idx+1
    if(___){
      # store idx in temp
      temp = myvec[idx]
      # assign idx+1 to idx
      myvec[___] = myvec[___]
      # assign idx to idx+1
      myvec[idx+1] = temp
      print(paste("Element ", idx, "is greater than element", idx+1, ".","Switching elements",  idx, "and", idx+1))
      print(paste("The vector is now"))
      print(myvec)
      # else if the element at position idx is smaller or equal to the element at position idx+1
    }else if(___){
      print(paste("Element ", idx, "is smaller or equal to element", idx+1, ". No changes" ))
      print(paste("The vector is"))
      print(myvec)
    }
  }
}
