fibonacci = function(x){
  if(x < 0){
    stop("Incorrect input")
  }else if(x == 0){
    return(0)
  }else if(x == 1){
    return(1)
  }else{
    return(fibonacci(x-1)+fibonacci(x-2))
  }
}

for(i in seq(10)){
  print(fibonacci(i))
}
