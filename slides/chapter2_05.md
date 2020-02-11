---
type: slides
---

# Matrices

---

We can use the `matrix()` function to create a matrix from a vector:

```r
(mat <- matrix(1:12, ncol = 4,  nrow = 3, byrow = TRUE))
```

---


It is often the case that we already have equi-dimensional vectors available and we wish to bundle them together as a matrix. In these cases, two useful functions are `cbind()` to combine vectors as vertical columns side-by-side, and `rbind()` to combine vectors as horizontal rows. Here is an example with `cbind()`:

```r
players <- c("Andy Murray", "Rafael Nadal", "Stan Wawrinka", 
             "Novak Djokovic", "Roger Federer")
grand_slam_win <- c(9, 15, 5, 12, 18)
win_percentage <- c(78.07, 82.48, 63.96, 82.77, 81.80)
(mat <- cbind(grand_slam_win, win_percentage))
```

---

Once the matrix is defined, we can assign names to its rows and columns by using `rownames()` and `colnames()`, respectively.

```r
rownames(mat) <- players
colnames(mat) <- c("GS win", "Win rate")
mat
```
---


As with vectors, there are some useful functions that can be used for matrix operators. For example, `t()` returns a matrix transpose:

```r
(A_char = matrix(c("a","b","c","d"),2, 2))
(A <- matrix(1:8, 4, 2))
t(A)
```

---

We can also do matrix addition simply with `+`.
```r
(B = A+A)
```

---

When we do matrix multiplication, we need to be more careful. Check the difference of the following two multiplications:

```r
A*A                # elementwise multiplication
(D = t(A)%*%A)     # regular matrix multiplication
```

---

In addition, the function `solve()` allows to inverse a matrix.

```r
(D_inv = solve(D))
round(D%*%D_inv, 14)
D%*%D_inv
```

---

We can also easily create a diagonal matrix with the function `diag()`:

```r
diag(c(1,1))
```

---

## Example: Portfolio Optimization

```r
# Load quantmod
library(quantmod)

# Download data
today <- Sys.Date()
five_years_ago <- seq(today, length = 2, by = "-5 year")[2]
getSymbols("AAPL", from = five_years_ago, to = today)
getSymbols("NFLX", from = five_years_ago, to = today)

# Compute returns
Ra <- na.omit(ClCl(AAPL))
Rn <- na.omit(ClCl(NFLX)) 

# Estimation of mu and Sigma
Sigma <- cov(cbind(Ra, Rn))
mu <- c(mean(Ra), mean(Rn))

# Compute omega^*
omega_star <- (Sigma[2, 2] - Sigma[1, 2])/(Sigma[1, 1] + Sigma[2, 2] - 2*Sigma[1, 2])

# Compute investment expected value and variance
mu_investment <- omega_star*mu[1] + (1 - omega_star)*mu[2]
var_investment <- omega_star^2*Sigma[1,1] + (1 - omega_star)^2*Sigma[2,2] +
  2*omega_star*(1 - omega_star)*Sigma[1,2]
```

---