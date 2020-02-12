---
type: slides
---

# Simple functions for vectors

---

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

---


***Please make sure to read the section on dates!***



---