---
type: slides
---

# Attributes, simple functions applied to vectors and sequences

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

```r
sd(grand_slam_win)
```

```out
[1] 5.069517
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

***Please make sure to read the section on dates!***

---

 <div align="center">
 <big> <b> Making sequences </b> </big>
 </div> 

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

Guess what the code below is doing:

```{r, eval = FALSE}
x = c(1,2,4,7,15)
n = length(x)
x[1:n]
x[n:1]
```

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


---