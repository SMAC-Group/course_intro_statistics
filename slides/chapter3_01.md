---
type: slides
---

Functions

---


## Functions
```r
add = function(x, y){
  return(x+y)
}
add(2,3)
```

However, the code below won't work:

```r
add()
```

We can also provide default values to the inputs of the function, so that when we don't specify values of the inputs, the default values will be used.

```r
add = function(x=2, y=3){
  return(x+y)
}

add()
add(x=4)
```

Notice that everything in R is a function. For example,

```r
# The followings do the same:
1+2
`+`(1,2)
```

So we can define our own mathematical operator.

```r
`:)` = function(x, y){
  abs(x*y)
}

`:)` (3,4)
```


```r
`%^%` = function(x, y){
  abs(x*y)
}

3 %^% 4
```

```r
abs_sqrt = function(x = 1){
  sign(x) * sqrt(abs(x))
}

abs_sqrt(9)
abs_sqrt(-9)
```

```{r}
abs_sqrt2 = function(x = 1){
  if(x >= 0){
    return(sqrt(x))
  }else{
    return(-sqrt(-x))
  }
}

abs_sqrt2(9)
abs_sqrt2(-9)
```


# Class: 15/04/19

```r
gen_prod = function(first_arg=matrix(rnorm(9),3,3), 
                    second_arg=5){
  # convert input as matrices 
  first_arg = as.matrix(first_arg)
  second_arg = as.matrix(second_arg)
  
  # matrix by scalar multiplication 
  if(dim(second_arg)[1] == 1 & dim(second_arg)[2] == 1){
    prod = first_arg * second_arg[1,1]
  }else{
    if(dim(first_arg)[2] == dim(second_arg)[1]){
      prod = first_arg %*% second_arg
    }else{
      if(dim(first_arg)[2] == dim(second_arg)[2]){
        warning("Second object has been transposed.")
        prod = first_arg %*% t(second_arg)
      }else{
        stop("Object dimensions are not compatible!")
      }
    } 
  }
  
  return(prod)
}

```

## Example: Least-squares function
```r
my_lm = function(X, y, alpha=0.05){
  X = as.matrix(X)
  y = as.vector(y)
  
  n = length(y)
  p = dim(X)[2]
  df = n-p
  
  # beta estimate
  beta_hat = solve(t(X)%*%X) %*% t(X) %*% y
  
  # sigma2 estimate
  resid = y - X %*% as.matrix(beta_hat)
  sigma2_hat = (1/df) * t(resid) %*% resid
  
  # var(beta) estimate
  var_beta_hat = sigma2_hat * solve(t(X)%*%X)
  
  # CI for beta
  up = beta_hat + qnorm(p=1-alpha/2) * sqrt(var_beta_hat)
  low = beta_hat - qnorm(p=1-alpha/2) * sqrt(var_beta_hat)
  ci_beta = c(low, up)
  
  result = list(beta = beta_hat,
                sigma2 = sigma2_hat,
                var_beta = var_beta_hat,
                ci = ci_beta)
  return(result)
}
```

```r
library(gamair)
data(hubble)

# Linear regression with lm() function
fit_lm = lm(hubble$y ~ hubble$x-1)

# Linear regression with my_lm() function
fit_my_lm = my_lm(X = hubble$x, y = hubble$y)

# Compare outputs
manual_results = c(fit_my_lm$beta, fit_my_lm$sigma2)
base_results = c(fit_lm$coefficients, 
                 (1/fit_lm$df.residual)*t(fit_lm$residuals)%*%fit_lm$residuals)
results = cbind(manual_results, base_results)
row.names(results) = c("Beta", "Sigma")
results
```











