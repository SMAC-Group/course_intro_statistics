---
type: slides
---

# Iterative Control Statements

---

<div style="text-align:center"><img src="drinking_fountains.png" alt=" " width="45%">

---

 <div align="center">
 <big> <b> <code>for</code> loops </b> </big>
 </div> 

`for`-loops in `R` allows us to repeat the same part of code, or say a sequence of same instructions, under certain conditions without explicitly writing out the code everytime.

Imagine you would like to sum the natural numbers from 1 to \\(n\\).
Defining \\(n\\) as 10, one possible solution could be the following:

```r
my_res = 0
my_res = my_res + 1
my_res = my_res + 2
my_res = my_res + 3
my_res = my_res + 4
my_res = my_res + 5
my_res = my_res + 6
my_res = my_res + 7
my_res = my_res + 8
my_res = my_res + 9
my_res = my_res + 10
print(my_res)
```

```out
[1] 55
```

Notes: A <code>for</code>-loop is a control flow statement for specifying iteration, which allows code to be executed repeatedly.
---

However, the code written in the previous page is long to write and becomes impractical for large value of \\(n\\). A solution for this problem using a `for`-loop could be:

```r
my_res = 0
n = 10
for(i in seq(n)){
  my_res = my_res + i
}
print(my_res)

```

```out
[1] 55
```

Notes: Use a <code>for</code>-loop when you want to perform a serie of operations repeatedly a known number of times.


---

 <div align="center">
 <big> <b> <code>while</code>-loop </b> </big>
 </div>

A `while`-loop is a control flow statement that allows code to be executed repeatedly based on a given Boolean condition. The while loop can be thought of as a repeating if statement. The while construct consists of a block of code and a condition/expression. The condition/expression is evaluated, and if the condition/expression is true, the code within all of their following in the block is executed. This repeats until the condition/expression becomes `FALSE`.

We could rewrite the code used in the previous slide using a `while`-loop as such:

```r
my_res = 0
n = 10
number = 0
while(number <= n){
  my_res = my_res + number
  number = number + 1
}

```

```out
[1] 55
```

Notes: Use a <code>while</code>-loop when you want to perform a serie of operations repeatedly an unknown number of times until a known condition is met.

