---
type: slides
---

# If/else and switch statements

---

<div style="text-align:center"><img src="comic_if_ai.jpg" alt=" " width="55%">

---
 
An `if` statement tells R to do a certain task only when a certain condition is satisfied. For example, the following code tells R that we add 1 to x only if x is bigger than 0.

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


And the code below tells R to flip the sign of x if x is negative. In other words, the below code returns the absolute value.

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

In the below example, we use an if statement to assess if x is an even number and, if this is the case, we print a simple message. To evaluate whether x is an even number, we use `%%` (i.e. modulus, or remainder from division).

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
 
A switch statement is a selection control mechanism that allows the value of an expression to change the control flow of program execution via map and search.

The switch statement is used in place of long statements which compare a variable with several integral values. It is a multi-way branch statement which provides an easy way to dispatch execution for different parts of code. This code is based on the value of the expression.

A switch statement can be used when you want to run different sequences of instructions depending on a variable that can take more than 2 values. 

---

Let us consider the example where we would like to compute an arithmetic operation on two numbers.

A solution for this exercise using a `switch` statement could be:

```r
number1 <- 20
number2 <- 5
operator = readline(prompt="Please enter any ARITHMETIC OPERATOR: ")

switch(operator,
       "+" = print(paste("Addition of two numbers is: ", number1 + number2)),
       "-" = print(paste("Subtraction of two numbers is: ", number1 - number2)),
       "*" = print(paste("Multiplication of two numbers is: ", number1 * number2)),
       "/" = print(paste("Division of two numbers is: ", number1 / number2))
)
```

---


if we indicate `/` as the arithmetic operator, it will return:
```out
 number1 <- 20
 number2 <- 5
 operator = readline(prompt="Please enter any ARITHMETIC OPERATOR: ")
Please enter any ARITHMETIC OPERATOR: /
 switch(operator,
        "+" = print(paste("Addition of two numbers is: ", number1 + number2)),
        "-" = print(paste("Subtraction of two numbers is: ", number1 - number2)),
        "*" = print(paste("Multiplication of two numbers is: ", number1 * number2)),
        "/" = print(paste("Division of two numbers is: ", number1 / number2))
 )
[1] "Division of two numbers is:  4"
```
