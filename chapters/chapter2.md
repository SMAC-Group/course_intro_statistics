---
title: 'Chapter 2: Control Structures'
description:
  'Understand how control structures dictate the flow of control.'
prev: /chapter1
next: /chapter3
type: chapter
id: 2
---


<exercise id="1" title="General Information">

In this chapter we will consider an introduction to Control Structure with `R`

</exercise>

<exercise id="2" title="A simple example of control structures">

Suppose that we are interested in creating a simple code to check if it can possibly get very cold and, if this is the case, lead us to decide whether we should take a jacket today. To write such a code, first we need to find out how cold it can possibly get today at our location, i.e. the minimum temperature.

```r
library(ROpenWeatherMap)
mykey = "607bc69cf2c29223a06b22580582a124"
data = get_current_weather(mykey, city="geneva")
min_temp = data$main$temp_min - 273.15
min_temp
```

```out
[1] -1.11
```

Then we can evaluate whether a jacket is needed or not.

```{r}
if (min_temp < 10){
  cat("You need a jacket!")
}else{
  cat("You don't need a jacket!")
}

```
```out
You need a jacket!
```
</exercise>

<exercise id="3" title="Logical operators">

Logical operators are very commonly used in programming to create (or return) logical (boolean) variables. Please refer to the textbook for a summarized list of commonly used logical operators. Here we give more detailed illustrations.

Be careful with the difference of `=` and `==`. `=` assigns value to a variable while `==` evaluates whether the variable equals to the given value.

```{r}
x = 5
x == 4
x > 5
x >= 5
```

We can also evaluate element-wise or vector-wise.

```{r}
x = c(5,6,1,5)
x >= 5              # element-wise
x >= c(5,10,3,6)    # vector-wise
```

Notice that when applying `+` (i.e. numerical operation), we will force `TRUE` to be `1` and `FALSE` to be 0.

```{r}
x = 5
y = 6
x == 5
y > 4
(x == 5) + (y > 4)
```

`&&` means `and`, i.e. the result is `TRUE` only when ALL statements are `TRUE`. 

```{r}
(x == 5) && (y > 4)
(x == 2) && (y > 4)
```

Note that when using `&&`, the 2nd statement will be evaluated only if the 1st statement is `TRUE`. In other words, if the 1st statement is `FALSE`, then the 2nd statement won't be evaluated. 

```{r}
x = 5
y = NA
(x == 5) && (y > 0)
(x == 2) && (y > 0) 
```
This is similar when we use `or` operator, i.e. `||`.

```{r}
x = 5
y = 6
(x == 2) || (y > 0)
(x == 2) || (y > 10) 
!(x == 5) || (y > 10)
```

Be careful about the difference between `&` and `&&`. `&` is a vectorized operator while `&&` is an elementwise (not vectorized) operator. So for `&&` only the first elements of each vector will be considered. Similar for `|` and `||`.

```{r}
x = c(5,7)
y = c(6,4)
x > 6
y > 5
x > 6 & y > 5
```
```{r}
x > 4
y > 5
x > 4 & y > 5  
x > 4 && y > 5
x > 4 | y > 5  
x > 4 || y > 5
```

When applied to a number (i.e. a vector of length 1), `&` and `&&` are equivalent. Similar for `|` and `||`.

```{r}
x = 5
y = 7
x > 4
y > 5
x > 4 & y > 5  
x > 4 && y > 5
```

The function `xor` is used to test if ONLY ONE of the statements is `TRUE`. 
```{r}
x = 5
y = 7
xor(x==5, y==7) # both TRUE, so returns FALSE
xor(x==5, y==6) # only one is TRUE, so returns TRUE
xor(x==3, y==6) # none TRUE, so returns FALSE
```

To test non-equality, we use `!=`.

```{r}
x = 5
y = 7
x != 5
!(x==5) # equivalent way to test non-equality
```

```{r}
x = 6
y = 7
!(xor(x >= 6 || y < 10, x ==y))
!(!(xor(x >= 6 || y < 10, x ==y)) & x!=x)
```

To check whether all `TRUE` for a vector:

```{r}
x = c(1,2,3,4)
x > 0

# approach 1
n = length(x)
sum(x > 0)
sum(x > 0) == n
sum(x > 1) == n

# approach 2
all(x > 0)
all(x > 1)
```

To perform subsetting and retrieve only the elements that satisfy the given condition:

```{r}
(x = rnorm(10))
x[x>1] # to get observations of x that's greater than 1
```

```{r}
x = rnorm(1000)
a = x[x>1]
hist(a)
```

We can also calculate the proportion of `TRUE` of a vector using the fact that `TRUE` is also evaluated as `1`: 

```{r}
n = 10000
x = rnorm(n)
sum(x>1) / n  # this proportion should be close to 1/6
1/6
```
</exercise>

<exercise id = "4" title ="if/else statement">

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

</exercise>