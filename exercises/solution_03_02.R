# Define function
find_gcd = function(a = NULL, b = NULL){
  #Compute the GCD of two positive defined integers
  if(!is.numeric(a) | !is.numeric(b)) stop("Please define two positive defined integers")
  if(a < 0 | b < 0) stop("Please define two positive defined integers")
  while(b > 0){
    if(b == 0) res = a
    remaining = a %% b
    a = b
    b = remaining
  }
  return(a)
}

# Test function
find_gcd(9045, 44840334375)
