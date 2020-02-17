---
type: slides
---

# If/else statement

---

<div style="text-align:center"><img src="comic_if_ai.jpg" alt=" " width="55%">

---

An `if` statement tells R to do a certain task only when a certain condition is satisfied. For example, the following code tells R that we only add 1 to x if x is bigger than 0.

```r
x = 4
if (x>0){
  x=x+1
}
x
```

```out
[1] 5
```



```r
x = -4
if (x>0){
  x=x+1
}
x
```


```out
[1] -4

```

---


And below tells R to flip the sign of x if x is negative. In other words, the below code returns the absolute value.

```r
(x = rnorm(1))
```

```out
[1] -0.2904028
```

```r
if(x<0){
  x = -x
}
x
```

```out
[1] 0.2904028
```
Notes: The function `rnorm()` simulates observations from a Standard Normal law (i.e. \\(X_i \sim \mathcal{N}(0,1)\\)). 

---


If/else statement tells R to do either one. For example, the code below tells R to returns \\(-x^2\\) if x is negative, and returns \\(x^2\\) otherwise. In other words, this code returns the modifed squared value.

```r
(x = rnorm(1))
```

```out
[1] -1.147015
```

```r
if(x<0){
  x = -(x*x)
}else{
  x = x*x
}
x
```


```out
[1] -1.315643
```

---

In the below example, we use an if statement to assess if x is an even number and, if this is the case, we print a simple message. To evaluate whether x is an even number, we use `%%` (i.e. modulus, or remainder from division):

```r
5 %% 2  
```

```out
[1] 1
```
```r
5 %% 3
```

```out
[1] 2
```
```r
5 %% 5
```
```out
[1] 0
```

Notes: Note that if the `%%` operator returns the rest of a division, (i.e. modulus), the `%/%` operator (integer division) returns the integer part of a division.

For example:
```r
25%/%4
```
returns
```out
[1] 6
```

---

So if x is an even number, the evaluation of `x %% 2 == 0` should be `TRUE`. 

```r
x = 4
if (x %% 2 == 0){
  print(paste(x, "is an even number"))
}
```

```out
[1] "4 is an even number"
```

```r
x = 6
if (x %% 2 == 0){
  print(paste(x, "is an even number"))
}
```

```out
[1] "6 is an even number"
```

```{r}
x = 9
if (x %% 2 == 0){
  print(paste(x, "is an even number"))
}
```


---
