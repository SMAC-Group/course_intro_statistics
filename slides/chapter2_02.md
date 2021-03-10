---
type: slides
---

# Logical operators

---

Logical operators are very commonly used in programming to create (or return) logical (boolean) variables. Please refer to the textbook for a summarized list of commonly used logical operators. Here we give more detailed illustrations. You can find further information on logical operator in `R` [here](https://smac-group.github.io/ds/control.html#logoperators).

<div style="text-align:center"><img src="comic_logical.jpg" alt=" " width="30%" height="40%">

---

⚠️ Be careful with the difference of `=` and `==`:

- `=` assigns value to a variable;
- `==` evaluates whether the variable equals to the given value.

Here is an example:

```r
x = 5
x == 4
```

```out
## [1] FALSE
```

```r
x > 5
```

```out
## [1] FALSE
```

```r
x >= 5
```

```out
[1] TRUE
```

---

We can also evaluate element-wise or vector-wise.

```r
x = c(5,6,1,5)
x >= 5              # element-wise
```

```out
## [1]  TRUE  TRUE FALSE  TRUE
```

```r
x >= c(5,10,3,6)    # vector-wise
```
```out
## [1]  TRUE FALSE FALSE FALSE
```

---

Notice that when applying `+` (i.e. numerical operation), we will force `TRUE` to be `1` and `FALSE` to be 0.

```r
x = 5
y = 6
x == 5
```

```out
## [1] TRUE
```

```r
y > 4
```

```out
## [1] TRUE
```
```r
(x == 5) + (y > 4)
```

```out
## [1] 2
```

---

`&&` means `and`, i.e. the result is `TRUE` only when ALL statements are `TRUE`. 

```r
(x == 5) && (y > 4)
```

```out
## [1] TRUE
```

```r
(x == 2) && (y > 4)
```

```out
## [1] FALSE
```

Note that when using `&&`, the 2nd statement will be evaluated only if the 1st statement is `TRUE`. In other words, if the 1st statement is `FALSE`, then the 2nd statement won't be evaluated. 

---

Note that any logical comparison with an object assigned to the value `NA` will return `NA`. This is because of the notion of Short-circuit evaluation where  the second argument is executed or evaluated only if the first argument does not suffice to determine the value of the expression.

```r
x = 5
y = NA
(x == 5) && (y > 0)
```

```out
[1] NA
```
```r
(x == 2) && (y > 0) 
```

```out
1] FALSE
```

---

This is similar when we use `or` operator, i.e. `||`.

```r
x = 5
y = 6
(x == 2) || (y > 0)
```

```out
## [1] TRUE
```

```r
(x == 2) || (y > 10) 
```

```out
[1] FALSE
```

```r
!(x == 5) || (y > 10)
```

```out
[1] FALSE
```

---

Be careful about the difference between `&` and `&&`. `&` is a vectorized operator while `&&` is an element-wise (not vectorized) operator. So for `&&` only the first elements of each vector will be considered. Similar for `|` and `||`.

```r
x = c(5,7)
y = c(6,4)
x > 6
```

```out
[1] FALSE  TRUE
```

```r
y > 5
```

```out
[1]  TRUE FALSE
```

```r
x > 6 & y > 5
```

```out
[1]  FALSE FALSE
```

---


```r
x > 4
```

```out
[1] TRUE TRUE
```

```r
y > 5
```

```out
[1]  TRUE FALSE
```

```r
x > 4 & y > 5  
```

```out
[1]  TRUE FALSE
```

```r
x > 4 && y > 5
```

```out
[1] TRUE
```

---

```r
x > 4 | y > 5 
```

```out
[1] TRUE TRUE
```

```r
x > 4 || y > 5
```

```out
[1] TRUE
```

---

When applied to a number (i.e. a vector of length 1), `&` and `&&` are equivalent. Similar for `|` and `||`.

```r
x = 5
y = 7
x > 4
```

```out
[1] TRUE
```

```r
y > 5
```

```out
[1] TRUE
```

```r
x > 4 & y > 5  
```

```out
[1] TRUE
```

```r
x > 4 && y > 5
```

```out
[1] TRUE
```

---

The function `xor` is used to test if ONLY ONE of the statements is `TRUE`. 

```r
x = 5
y = 7
xor(x==5, y==7) # both TRUE, so returns FALSE
```

```out
[1] FALSE
```

```r
xor(x==5, y==6) # only one is TRUE, so returns TRUE
```

```out
[1] TRUE
```

```r
xor(x==3, y==6) # none TRUE, so returns FALSE
```

```out
[1] FALSE
```

---

To test non-equality, we use `!=`.

```r
x = 5
y = 7
x != 5
```


```out
[1] FALSE
```

```r
!(x==5) # equivalent way to test non-equality
```

```out
[1] FALSE
```
```r
TRUE!=FALSE
```
```out
[1] TRUE
```
```r
TRUE!=TRUE
```
```out
[1] FALSE
```

---


```r
x = 6
y = 7
!(xor(x >= 6 || y < 10, x ==y))
```

```out
[1] FALSE
```

```r
!(!(xor(x >= 6 || y < 10, x ==y)) & x!=x)
```

```out
[1] TRUE
```

---


To check whether all `TRUE` for a vector:

```r
x = c(1,2,3,4)
x > 0
```


```out
[1] TRUE TRUE TRUE TRUE
```

```r
# approach 1
n = length(x)
sum(x > 0)
```

```r
[1] 4
```
```r
sum(x > 0) == n
```
```out
[1] TRUE
```



```r
sum(x > 1) == n
```
```out
[1] FALSE
```

---

```r
# approach 2
all(x > 0)
```

```out
[1] TRUE
```

```r
all(x > 1)
```

```out
[1] FALSE
```

Notes: One can obtain the documentation for the function `all()` as such:

```r
help(all)
```
which returns:
```
all {base}	R Documentation
Are All Values True?
Description
Given a set of logical vectors, are all of the values true?
```
---

To perform subsetting and to retrieve only the elements that satisfy the given condition:

```{r}
set.seed(123)
(x = rnorm(10))
```

```out
 [1] -0.56047565 -0.23017749  1.55870831  0.07050839  0.12928774
 [6]  1.71506499  0.46091621 -1.26506123 -0.68685285 -0.44566197
```

```r
x[x>0] # to get observations of x that's greater than 1
```

```out
1.55870831 0.07050839 0.12928774 1.71506499 0.46091621
```

---

```r
set.seed(123)
x = rnorm(1000)
a = x[x>1]
hist(a)
```

<div style="text-align:center"><img src="fig5.png" alt=" " width="55%">

---

We can also calculate the proportion of `TRUE` of a vector using the fact that `TRUE` is also evaluated as `1`: 

```r
n = 10000
x = rnorm(n)
sum(x>1) / n  
```

```out
[1] 0.1593
```

The exact probability \\(P(X_i>1)\\) if \\( X_i \sim \mathcal{N}(0,1) \\)= \\(1 - \Phi(1) = 0.1586553 \\) can be computed as such:

```r
1-pnorm(1)
```

```out
[1] 0.1586553
```


---