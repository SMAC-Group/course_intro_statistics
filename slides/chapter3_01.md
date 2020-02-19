---
type: slides
---

# Functions

---

<div style="text-align:center"><img src="fct_love.jpg" alt=" " width="55%">

Notes: When you define a function you give a name to a set of actions you want the computer to perform. When you **call** a function you are telling the computer to run (or execute) that set of actions.
---

Let's define a function that return the result of the addition of two numbers.

```r
add = function(x, y){
  return(x+y)
}
add(2,3)
```

```out
[1] 5
```

However, the code below won't work:

```r
add()
```

Notes: Note that the code `add()` does not return any output because there are no default values and therefore no values to be added.

---

We can also provide default values to the inputs of the function, so that when we don't specify values of the inputs, the default values will be used.

```r
add = function(x=2, y=3){
  return(x+y)
}

add()
```

```out
[1] 5
```

```r
add(x=4)
```
```out
[1] 7
```

Notes: Note that the code `add(x=4)` returns 7 because the default value for `y` is `3`. Therefore, `3 + 4 = 7`.
---

Notice that everything in R is a function. For example,

```r
# The followings do the same:
1+2
```

```out
[1] 3
```
```r
`+`(1,2)
```

```out
[1] 3
```

---

So we can define our own mathematical operator.

```r
`:)` = function(x, y){
  abs(x*y)
}

`:)` (3,4)
```

```out
[1] 12
```

Notes: We can now call the `:)` operator as a function.
---


```r
`%^%` = function(x, y){
  abs(x*y)
}

3 %^% 4
```

```out
[1] 12
```

--

```r
abs_sqrt = function(x = 1){
  sign(x) * sqrt(abs(x))
}

abs_sqrt(9)
```

```out
[1] 3
```

```r
abs_sqrt(-9)
```


```out
[1] -3
```

---

Similarly,

```r
abs_sqrt2 = function(x = 1){
  if(x >= 0){
    return(sqrt(x))
  }else{
    return(-sqrt(-x))
  }
}

abs_sqrt2(9)
```

```r
abs_sqrt2(-9)
```

```out
[1] 3
```


```out
[1] -3
```

---

# Example: Matrix and scalar product

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

Notes: Note that the function `gen_prod()` can perform simple scalar multiplication, matrix by scalar multiplication  as well as matrix multiplication depending on the dimensions of the inputs.

For example, 

```r
gen_prod(3,5)
```
will returns

```out
     [,1]
[1,]   15
```

while

```r
gen_prod(matrix(seq(9), ncol=3),5)
```
will returns

```out
     [,1] [,2] [,3]
[1,]    5   20   35
[2,]   10   25   40
[3,]   15   30   45
```

---

# Example: Least-squares function

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
  result = list(beta = beta_hat, sigma2 = sigma2_hat,
                var_beta = var_beta_hat, ci = ci_beta)
  return(result)
}
```

---

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
```

Notes: Let's call our implementation of the least squares and compare it with the `lm` function in `R`. Note that
```r
help(lm)
```
will returns
```
lm {stats}	R Documentation
Fitting Linear Models
Description
lm is used to fit linear models. It can be used to carry out regression, single stratum analysis of variance and analysis of covariance (although aov may provide a more convenient interface for these).

```



---

```r
results
```

```out
##       manual_results base_results
## Beta        76.58117     76.58117
## Sigma    67046.33165  67046.33165
```

---

 <div align="center">
 <big> <b> Recursive function </b> </big>
 </div> 

A recursive function is a function that calls itself during its execution. This enables the function to repeat itself several times, outputting the result and the end of each iteration. 

A big difference between recursion and iteration is the way that they end. While a loop executes the block of code, checking each time to see if it is at the end of the sequence, there is no such sequential end for recursive code.

A recursive function consists of two parts: the recursive call and the base case. 

---

A simple example to present recursion is a function that returns the factorial of a positive integer. Denoted by \\(n!\\), the factrial of a positive integer is the product of all positive integer elss than or equal to \\(n\\).

$$\begin{equation}
n !=n \times(n-1) \times(n-2) \times(n-3) \times \cdots \times 3 \times 2 \times 1
\end{equation}$$

Below is an example of a recursive implementation of the factorial of a positive integer.

```r
my_factorial = function(x){
  # Base case
  if(x == 0){
    return(1)
  }else if(x == 1){
    return(1)
  # Recursive call
  }else{
    return(x*my_factorial(x-1))
  }
}
```

Notes: One could then execute the function `my_factorial` and obtain the following results:

```r
for(i in seq(6)){
    print(my_factorial(i))
}
```

```out
[1] 1
[1] 2
[1] 6
[1] 24
[1] 120
[1] 720
```
---



