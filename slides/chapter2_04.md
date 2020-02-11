---
type: slides
---

# Making sequences

---

In `R` we often need to construct sequences. Here are some examples:

```r
1:10
10:1
(10:100)/10
seq(from = 1, to = 10, length.out = 15)
```

---

A sequence can for example be used to plot a function. For example, here is a code to plot the function $f(x) = \sin(x)$ in the range $x \in [-4\pi, \; 4\pi]$.

```r
x = seq(from = -4*pi, to = 4*pi, length.out = 10^4)
y = sin(x)
plot(x, y, type = "l")
```

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
(three_months_ago <- seq(today, length = 2, by = "-3 months")[2])
library(quantmod)
getSymbols("AAPL", from = three_months_ago, to = today)
candleChart(AAPL, theme = 'white', type = 'candles')
```

---

```r
# Compute returns
AAPL_returns <- na.omit(ClCl(AAPL))
mean(AAPL_returns)
median(AAPL_returns)
mu <- mean(AAPL_returns)
(k <- mean((AAPL_returns - mu)^4)/(mean((AAPL_returns - mu)^2))^2 - 3)
```

---


Let's continue with the AAPL stock price example and make a histogram based on the data. 
```r
x = seq(from = -0.1, to = 0.1, length.out = 10^4)
y = dnorm(x, mean(AAPL_returns), sd(AAPL_returns))
hist(AAPL_returns, probability = TRUE, col = "lightgrey")
lines(x, y, col = 2, lwd = 2)
```

---