---
type: slides
---

# Attributes, simple functions applied to vectors, dates and sequences

Notes: In this section, we will discuss different elements. You can find further informations regarding: 
- Attributes for vectors [here](https://smac-group.github.io/ds/data.html#vectattr)
- Simple functions applied to vectors [here](https://smac-group.github.io/ds/data.html#useful-functions-with-vectors)
and
- Working with dates in `R` [here](https://smac-group.github.io/ds/data.html#working-with-dates)
- Making Sequences [here](https://smac-group.github.io/ds/data.html#creating-sequences)

---

 <div align="center">
 <big> <b> Attributes </b> </big>
 </div> 
 

It is often a good idea to add attributes to a vector. Here is an example:

```r
(grand_slam_win = c(9, 15, 5, 12, 18))
```

```out
[1]  9 15  5 12 18
```

```r
attr(grand_slam_win, "date") <- "07-15-2017"
attr(grand_slam_win, "type") <- "Men, Singles"
grand_slam_win
```

```out
[1]  9 15  5 12 18
attr(,"date")
[1] "07-15-2017"
attr(,"type")
[1] "Men, Singles"
```

Notes: In this section, we will discuss attributes for vectors. You can find further informations on this topic [here](https://smac-group.github.io/ds/data.html#vectattr)

---

You retrieve an attribute as follows:

```r
attr(grand_slam_win, "date")
```

```out
[1] "07-15-2017"
```

It is also possible to **name** the elements of a vector. For example:
```r
(grand_slam_win <- c("Andy Murray" = 9, "Rafael Nadal" = 15, 
                   "Stan Wawrinka" = 5, "Novak Djokovic" = 12,
                   "Roger Federer" = 18))
```

```out
    Andy Murray   Rafael Nadal  Stan Wawrinka Novak Djokovic  Roger Federer 
              9             15              5             12             18
```

Notes: Note that you can retreive the attributes of a vector returned as a vector with the function <code>names()</code>. You can then subset element of the returned vector. For example,

```r
names(grand_slam_win)[1:2]
```
will here return
```out
[1] "Andy Murray"  "Rafael Nadal"
```

---

Then subsetting can also be made using the names of the elements:

```r
grand_slam_win[2]
```

```out
 Rafael Nadal 
           15
```

```r
grand_slam_win[c("Rafael Nadal", "Roger Federer")]
```

```out
  Rafael Nadal Roger Federer 
            15            18
```

All the names can be retrieved as follows:

```r
names(grand_slam_win)
```

```out
 [1] "Andy Murray"    "Rafael Nadal"   "Stan Wawrinka"  "Novak Djokovic"
 [5] "Roger Federer"

```

Notes: Note that you can also subset a a named vector with negative indices. For example

```r
grand_slam_win[-c(1:3)]
```

will returns

```out
Novak Djokovic  Roger Federer 
            12             18 
```
---

 <div align="center">
 <big> <b> Simple functions for vectors </b> </big>
 </div> 

Here are some examples:

```r
mean(grand_slam_win)
```

```out
[1] 11.8
```

```r
median(grand_slam_win)
```

```out
[1] 12
```

Notes: In this section, we will discuss simple functions applied to vectors. You can find further informations on this topic [here](https://smac-group.github.io/ds/data.html#useful-functions-with-vectors)

---

```r
sd(grand_slam_win)
```

```out
[1] 5.069517
```

Notes: Note that one can also retrieve Tukey Five Number summary of a vector using the function <code>summary()</code>. For example:

```r
summary(grand_slam_win)
```

```out
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
5.0     9.0    12.0    11.8    15.0    18.0 
```


---

```r
sum(grand_slam_win)
```

```out
[1] 59
```

```r
length(grand_slam_win)
```

```out
[1] 5
```

---

The functions `order` and `sort` are particularly useful!

```r
x = c(1,3,5,8,1)
sort(x)
```

```out
[1] 1 1 3 5 8
```

```r
sort(x, decreasing = FALSE)
```

```out
[1] 1 1 3 5 8
```
```r
sort(x, decreasing = TRUE)
```
```out
[1] 8 5 3 1 1

```

Notes: One can always read the documentation of a function by calling `help(name_of_the_function)` or `?name_of_the_function`. For example, on the difference between `sort` and `order`, one can execute:

```r
help(sort)
```

```
sort {base}	R Documentation
Sorting or Ordering Vectors
Description
Sort (or order) a vector or factor (partially) into ascending or descending order. For ordering along more than one variable, e.g., for sorting data frames, see order.
```

and 

```r
?order
```

```
order {base}	R Documentation
Ordering Permutation
Description
order returns a permutation which rearranges its first argument into ascending or descending order, breaking ties by further arguments. sort.list is the same, using only one argument.
See the examples for how to use these functions to sort data frames, etc.
```

---

```r
order(x)
```
```out
[1] 1 5 2 3 4
```
```r
x[order(x)]
```
```out
[1] 1 1 3 5 8
```

Notes: Note that `sort(x, decreasing = FALSE)` and `x[order(x)]` return the same result.

---

<div align="center">
<big> <b> Dates </b> </big>
</div> 
 
Dates can take various format and can easily be confusing when programming. `R` provides various tools and packages to work with dates.

<div style="text-align:center"><img src="joke_date.png" alt=" " width="45%">

Notes: In this section, we will discuss dates. You can find further informations on this topic [here](https://smac-group.github.io/ds/data.html#working-with-dates)

---

One can transform dates in the ISO 8601 international standard format %Y-%m-%d using the function `as.Date()`. For furter details regarding dates format, one can read the `R` documentation on dates [here](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/as.Date) and the following R bloggers [blogpost](https://www.r-bloggers.com/date-formats-in-r/).

Here is an example:

```r
mydates = c("05/27/19", "01/15/20")
mydates2 <- as.Date(mydates, format = "%m/%d/%y")
mydates2
```

```out
[1] "2019-05-27" "2020-01-15"
```

---

Furthermore, one can execute basic arithmetic operations on dates:

```r
mydates3 <- as.Date(c("2020-02-12", "2020-01-10",
                      "2019-05-17", "2019-10-22",
                      "2019-03-10","2019-09-16"))
mydates3[1] - mydates3[2]
```

```out
Time difference of 33 days
```

```r
max(mydates3)
```
```out
[1] "2020-02-12"
```
```r
min(mydates3)
```
```out
[1] "2019-03-10"
```

---

```r
mean(mydates3)
```
```out
[1] "2019-09-14"
```

```r
mydates3[1] + 22
```
```out
[1] "2020-03-05"
```

Finally, the package `lubridate` from the `tidyverse` proposes various functions that makes it easier to work with dates. You can find further details about `lubridate` [here](https://lubridate.tidyverse.org/)

---

 <div align="center">
 <big> <b> Making sequences </b> </big>
 </div> 
 
In this section, we will discuss sequences. You can find further informations on this topic [here](https://smac-group.github.io/ds/data.html#creating-sequences)

In `R` we often need to construct sequences. Here are some examples:

```r
1:10
```

```out
[1]  1  2  3  4  5  6  7  8  9 10
```
```r
10:1
```
```out
[1] 10  9  8  7  6  5  4  3  2  1
```
```r
(10:100)/10
```
```out
  [1]  1.0  1.1  1.2  1.3  1.4  1.5  1.6  1.7  1.8  1.9  2.0  2.1  2.2  2.3
 [15]  2.4  2.5  2.6  2.7  2.8  2.9  3.0  3.1  3.2  3.3  3.4  3.5  3.6  3.7
 [29]  3.8  3.9  4.0  4.1  4.2  4.3  4.4  4.5  4.6  4.7  4.8  4.9  5.0  5.1
 [43]  5.2  5.3  5.4  5.5  5.6  5.7  5.8  5.9  6.0  6.1  6.2  6.3  6.4  6.5
 [57]  6.6  6.7  6.8  6.9  7.0  7.1  7.2  7.3  7.4  7.5  7.6  7.7  7.8  7.9
 [71]  8.0  8.1  8.2  8.3  8.4  8.5  8.6  8.7  8.8  8.9  9.0  9.1  9.2  9.3
 [85]  9.4  9.5  9.6  9.7  9.8  9.9 10.0
```

Notes: Sequences are often used when programming iterative procedures. For exmaple, when using `for` loop (see next chapter). For example,
```r
for(i in 1:5){
     print("I realy like this class")
}
```
will return:
```out
[1] "I realy like this class"
[1] "I realy like this class"
[1] "I realy like this class"
[1] "I realy like this class"
[1] "I realy like this class"
```

---

```r
seq(from = 1, to = 10, length.out = 15)
```
```out
  [1]  1.000000  1.642857  2.285714  2.928571  3.571429  4.214286  4.857143
  [8]  5.500000  6.142857  6.785714  7.428571  8.071429  8.714286  9.357143
 [15] 10.000000```


---

A sequence can for example be used to plot a function. For example, here is a code to plot the function \\(f(x) = \sin(x)\\) in the range \\(x \in [-4\pi, \; 4\pi]\\).

```r
x = seq(from = -4*pi, to = 4*pi, length.out = 10^4)
y = sin(x)
plot(x, y, type = "l")
```

<div style="text-align:center"><img src="fig1.png" alt=" " width="75%">

---


## Example: AAPL stock price

```r
(today <- Sys.Date())
```
```out
[1] "2020-02-12"
```


```r
(three_months_ago <- seq(today, length = 2, by = "-3 months")[2])
```
```out
[1] "2019-11-12"
```

---

```r
library(quantmod)
getSymbols("AAPL", from = three_months_ago, to = today)
candleChart(AAPL, theme = 'white', type = 'candles')
```
<div style="text-align:center"><img src="fig2.png" alt=" " width="85%">

---

```r
# Compute returns
AAPL_returns <- na.omit(ClCl(AAPL))
mean(AAPL_returns)
```

```out
[1] 0.003357649
```

```r
median(AAPL_returns)
```

```out
[1] 0.003569526
```

```r
mu <- mean(AAPL_returns)
(k <- mean((AAPL_returns - mu)^4)/(mean((AAPL_returns - mu)^2))^2 - 3)
```

```out
[1] 1.414397
```

---


Let's continue with the AAPL stock price example and make a histogram based on the data. 
```r
x = seq(from = -0.1, to = 0.1, length.out = 10^4)
y = dnorm(x, mean(AAPL_returns), sd(AAPL_returns))
hist(AAPL_returns, probability = TRUE, col = "lightgrey")
lines(x, y, col = 2, lwd = 2)
```

<div style="text-align:center"><img src="fig3.png" alt=" " width="70%">

Notes: Here, we first generate a vector from \\(-0.1\\) to \\(0.1\\) to then calculate the probability density function of a Normal Law \\(\phi(x)\\) given \\(\hat{\mu}\\) and  \\(\hat{\sigma}^2\\) in order to plot the correponding probability density on top of the histogram of the returns.


---