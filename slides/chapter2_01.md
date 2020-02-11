---
type: slides
---

# Introduction to vectors

---

Let's define some simple vectors: 

```r
(grand_slam_win = c(9, 15, 5, 12, 18))
```


```r
c(1, c(1, 3), c(3))
```

---

Guess the value of `d`:

```r
a = c(1,2,3)
b = c(4,5)
d = c(a,b,a)
```

---

We can also define vectors with characters:

```r
(players <- c("Andy Murray", "Rafael Nadal", "Stan Wawrinka", 
             "Novak Djokovic", "Roger Federer"))
```

---

What is stored in a vector? Check out the function `typeof`!

```r
typeof(players)
typeof(grand_slam_win)
```

---

Integer vs numeric (or double):
```r
typeof(c(1,2,3))
typeof(c(1L,2L,3L))
```

---

Here is an example of "coercion" (i.e. mixing different kinds of elements in a vector):

```r
(a = c("a", 2))
(b = c(FALSE, TRUE, 1, 2, "a"))
```

---