---
type: slides
---

# Functions

---

<div style="text-align:center"><img src="fct_love.jpg" alt=" " width="55%">

Notes: When you define a function you give a name to a set of actions you want the computer to perform. When you **call** a function you are telling the computer to run (or execute) that set of actions.
---

Let's define a function that returns the result of the addition of two numbers.

```r
add = function(x, y){
  x+y
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
# The following commands perform the same operation:
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

Notes: The symbol "+" has been assigned an action through a function in R. For example:

```r
`+`
```
will return

```out
function (e1, e2)  .Primitive("+")
```
where `.Primitive("+")` is an "internally implemented" function in the base R implementation.
---

Therefore we can define our own mathematical operator.

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

We can also define a function as an operator that works similarly to the `+` function as follows:

```r
`%^%` = function(x, y){
  abs(x*y)
}

3 %^% 4
```

```out
[1] 12
```

Notes: For example, we could define the function `:)` (created in the previous slide) as an operator of this form as follows

```r
`%:)%` = function(x, y){
    abs(x*y)
}
```

```r
-2 %:)% 4
```

```out
[1] 8
```

---

There is no unique way to create a function that delivers a specific output. For example, suppose we wanted to create a function that delivers the square root of a number and allows this number to be negative (therefore also returning the negative sign when the square root is computed).


```r
abs_sqrt = function(x = 1){
  if(x >= 0){
    return(sqrt(x))
  }else{
    return(-sqrt(-x))
  }
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

Notes: This function explicitly uses control structures (from the previous chapter) to obtain the desired result.

---

R has many base (or package) functions that can be used to achieve the same goal.

```r
abs_sqrt2 = function(x = 1){
  sign(x) * sqrt(abs(x))
}

abs_sqrt2(9)
```

```out
[1] 3
```

```r
abs_sqrt2(-9)
```


```out
[1] -3
```

Notes: Sometimes, depending on the complexity of the computations, it may be appropriate to make maximum use of already implemented functions in R that probably are computationally efficient.

---

# Example: Matrix and scalar product

```r
gen_prod = function(first_arg=matrix(rnorm(9),3,3), second_arg=5){
  # convert input as matrices 
  first_arg = as.matrix(first_arg)
  second_arg = as.matrix(second_arg)
  
  # matrix by scalar multiplication 
  if(dim(second_arg)[1] == 1 & dim(second_arg)[2] == 1){
    first_arg * second_arg[1,1]
  }else{
    if(dim(first_arg)[2] == dim(second_arg)[1]){
      first_arg %*% second_arg
    }else{
      if(dim(first_arg)[2] == dim(second_arg)[2]){
        warning("Second object has been transposed.")
        first_arg %*% t(second_arg)
      }else{
        stop("Object dimensions are not compatible!")
      }
    } 
  }
}

```

Notes: Note that the function `gen_prod()` can perform simple scalar multiplication, matrix by scalar multiplication as well as matrix multiplication depending on the dimensions of the inputs.

For example, 

```r
gen_prod(3,5)
```
will return

```out
     [,1]
[1,]   15
```

while

```r
gen_prod(matrix(seq(9), ncol=3),5)
```
will return

```out
     [,1] [,2] [,3]
[1,]    5   20   35
[2,]   10   25   40
[3,]   15   30   45
```

---

# Example: Matrix and scalar product

```r
gen_prod = function(first_arg=matrix(rnorm(9),3,3), second_arg=5){
  # convert input as matrices 
  first_arg = as.matrix(first_arg)
  second_arg = as.matrix(second_arg)
  
  # matrix by scalar multiplication 
  if(dim(second_arg)[1] == 1 & dim(second_arg)[2] == 1){
    first_arg * second_arg[1,1]
  }else{
    if(dim(first_arg)[2] == dim(second_arg)[1]){
      first_arg %*% second_arg
    }else{
      if(dim(first_arg)[2] == dim(second_arg)[2]){
        warning("Second object has been transposed.")
        first_arg %*% t(second_arg)
      }else{
        stop("Object dimensions are not compatible!")
      }
    } 
  }
}

```

Notes: Also notice that the `gen_prod()` function makes use of the base functions `warning()` and `stop()` which are examples of a set of functions in R that are used to inform the user of eventual issues or problems when executing the function.

For example, 

```r
gen_prod(matrix(seq(9), ncol=3), matrix(seq(25), ncol=5))
```
will return

```out
Error in gen_prod(matrix(seq(9), ncol = 3), matrix(seq(25), ncol = 5)) : 
  Object dimensions are not compatible!
```

while

```r
gen_prod(matrix(seq(9), ncol=3), matrix(seq(12), ncol=3))
```
will return

```out
     [,1] [,2] [,3] [,4]
[1,]   84   96  108  120
[2,]   99  114  129  144
[3,]  114  132  150  168
Warning message:
In gen_prod(matrix(seq(9), ncol = 3), matrix(seq(12), ncol = 3)) :
  Second object has been transposed.
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

Notes: The `my_lm()` function creates a series of objects that are relevant to least squares regression and places them in a `list` structure. This list then gets included in the `return()` function at the end of the function. The output of the function would have been the same simply by inserting the object `result` at the end of the function. However, when functions become more complex, it is helpful to use the `return()` function to make sure that one obtains the outputs of interest.

---

Let us plot some data on which we will first use the R implementation of least squares and successively test ours.


```r
# load some data
library(gamair)
data(hubble)

# plot data and result from a simple linear regression
par(mar=c(5.1, 4.5, 4.1, 2.1)) # for margin
plot(hubble$x, hubble$y, 
     xlab = "Distance (Mpc)", 
     ylab = bquote("Velocity (km" ~ s^-1 ~ ")")
     ) # plot
text(x = hubble$x, y = hubble$y-35, labels = hubble$Galaxy, cex = .7)

# add line of a linear regression
abline(lm(y~x, data = hubble), col = "blue4")
```

Notes: Note that
```r
help(hubble)
```
will return
```
Description
Data on distances and velocities of 24 galaxies containing Cepheid stars, from the Hubble space telescope key project to measure the Hubble constant.

Format
A data frame with 3 columns and 24 rows. The columns are:

Galaxy
A (factor) label identifying the galaxy.

y
The galaxy's relative velocity in kilometres per second.

x
The galaxy's distance in Mega parsecs. 1 parsec is 3.09e13 km.

```

---

The code on the previous slide will return: 

<div style="text-align:center"><img src="galaxies.png" alt=" " width="50%" height="40%">


---

We then compare the previous results with our implementation of least squares.

```r
# Linear regression with lm() function
fit_lm = lm(hubble$y ~ hubble$x-1)

# Linear regression with my_lm() function
fit_my_lm = my_lm(X = hubble$x, y = hubble$y)

# Compare outputs
my_lm_results = c(fit_my_lm$beta, fit_my_lm$sigma2)
base_results = c(fit_lm$coefficients, 
                 (1/fit_lm$df.residual)*t(fit_lm$residuals)%*%fit_lm$residuals)
results = cbind(my_lm_results, base_results)
row.names(results) = c("Beta", "Sigma")

results
```

```out
##        my_lm_results base_results
## Beta        76.58117     76.58117
## Sigma    67046.33165  67046.33165
```

Notes: Note that
```r
help(lm)
```
will return
```
lm {stats}	R Documentation
Fitting Linear Models
Description
lm is used to fit linear models. It can be used to carry out regression, single stratum analysis of variance and analysis of covariance (although aov may provide a more convenient interface for these).

```

---

 <div align="center">
 <big> <b> Recursive Functions </b> </big>
 </div> 

A recursive function is a function that calls itself during its execution. This enables the function to repeat itself several times, outputting the result at the end of each iteration. 

The main difference between a recursion and an iteration consists in their "stopping rule". Indeed, a loop executes a block of code up to a maximum amount of times (iterations) after which it stops the execution. On the other hand, a recursion will depend on the conditions that the function needs to respect (achieve) in order to stop execution (i.e. the stopping rule is embedded within the function itself). 

A recursive function consists of two parts: the recursive call and the base case. 

---

A simple example to present a recursion is a function that returns the factorial of a positive integer. Denoted by \\(n!\\), the factorial of a positive integer is the product of all positive integer smaller than or equal to \\(n\\).

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

A simple example to present a recursion is a function that returns the factorial of a positive integer. Denoted by \\(n!\\), the factorial of a positive integer is the product of all positive integer smaller than or equal to \\(n\\).

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

Notes: What would happen if we provided the argument `-1` to `my_factorial()`?

```r
my_factorial(-1)
```

```out
Error: C stack usage  7971492 is too close to the limit
```

The number provided in the output error will change depending on different factors. What does the error mean? How can you avoid the problem or notify the user of the issue? See previous examples.

