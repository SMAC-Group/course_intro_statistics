---
type: slides
---

# If/else statement

---

<div style="text-align:center"><img src="comic_if_ai.jpg" alt=" " width="55%">

---

An `if` statement tells R to do a certain task only when a certain condition is satisfied. For example, the following code tells R that we only add 1 to x if x is bigger than 0.

```{r}
x = 4
if (x>0){
  x=x+1
}
x
```

```{r}
x = -4
if (x>0){
  x=x+1
}
x
```

And below tells R to flip the sign of x if x is negative. In other words, the below code returns the absolute value.

```{r}
(x = rnorm(1))
if(x<0){
  x = -x
}
x
```

If/else statement tells R to do either one. For example, the code below tells R to returns $-x^2$ if x is negative, and returns $x^2$ otherwise. In other words, this code returns the modifed squared value.

```{r}
(x = rnorm(1))
if(x<0){
  x = -(x*x)
}else{
  x = x*x
}
x
```

In the below example, we use an if statement to assess if x is an even number and, if this is the case, we print a simple message. To evaluate whether x is an even number, we use `%%` (i.e. modulus, or remainder from division):

```{r}
5 %% 2  
5 %% 3
5 %% 5
```

So if x is an even number, the evaluation of `x %% 2 == 0` should be `TRUE`. 

```{r}
x = 4
if (x %% 2 == 0){
  print(paste(x, "is an even number"))
}
```

```{r}
x = 6
if (x %% 2 == 0){
  print(paste(x, "is an even number"))
}
```

```{r}
x = 9
if (x %% 2 == 0){
  print(paste(x, "is an even number"))
}
```
