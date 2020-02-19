fibonacci = function(x){
  # Base case
  if(x < 0){
    stop("Incorrect input")
  }else if(x == 0){
    return(0)
  }else if(x == 1){
    return(1)
  # Recursive call
  }else{
    return(fibonacci(x-1)+fibonacci(x-2))
  }
}

# Test output of the function
for(i in seq(10)){
  print(fibonacci(i))
}
