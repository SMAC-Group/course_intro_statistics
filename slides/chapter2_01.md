---
type: slides
---

# Introduction to vectors

---

Let's define some simple vectors: 

```r
(grand_slam_win = c(9, 15, 5, 12, 18))
```

```out
[1]  9 15  5 12 18
```

```r
c(1, c(1, 3), c(3))
```

```out
[1] 1 1 3 3
```


---

We can also define vectors with characters:

```r
(players <- c("Andy Murray", "Rafael Nadal", "Stan Wawrinka", 
             "Novak Djokovic", "Roger Federer"))
```

```out
[1] "Andy Murray"    "Rafael Nadal"   "Stan Wawrinka"  "Novak Djokovic"
[5] "Roger Federer"
```

---

What is stored in a vector? Check out the function `typeof`!

```r
typeof(players)
```

```out
[1] "character"
```

```r
typeof(grand_slam_win)
```

```out
[1] "double"
```

---

Integer vs numeric (or double):
```r
typeof(c(1,2,3))
```

```out
[1] "double"
```

```
typeof(c(1L,2L,3L))
```
```out
[1] "integer"
```

---

Here is an example of "coercion" (i.e. mixing different kinds of elements in a vector):

```r
(a = c("a", 2))
```
```out
[1] "a" "2"
```

```
(b = c(FALSE, TRUE, 1, 2, "a"))
```
```out
[1] "FALSE" "TRUE"  "1"     "2"     "a"
```

---