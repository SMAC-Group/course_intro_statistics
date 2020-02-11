---
type: slides
---

# Subsetting

---

Subsetting is very important when working with vector. This can be done in various ways. We can use positive indices:

```r
(x = c(1,2,4,5,1))
x[3]
```

```r
n = length(x)
x[c(1,3,n-1)]
x[(n+1)]
```

---

Note what happens to `x[(n+1)]`! This is one of the oddities of `R` and is likely to create some bugs, so be aware of this!

We can also use negative indices:

```r
x[c(-1,-3)]
```

---

It is possible to combine the positive and negative indices, for example:

```r
x = c(1,2,4,5,1)
x[-1][c(2,3)]
```

which is equivalent to

```r
(y = x[-1])
y[c(2,3)]
```

---

However, it is **really mixed** indices. For example, this code won't work:

```{r, eval=FALSE}
x[c(1,2,3,-4)]
```

Finally, it is also possible to use boolean value to extract the elements of a vector. For example:
```r
x[c(T, F, T, F, T)]
```
