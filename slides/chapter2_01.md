---
type: slides
---

# Introduction to vectors

Notes: In this section, we will discuss the basic features of vectors. For more information have at this [link](https://smac-group.github.io/ds/data.html#vectors)

---

Let's define some simple vectors: 

```r
(grand_slam_win = c(9, 15, 5, 12, 18))
```


```r
c(1, c(1, 3), c(3))
```

Notes: When using `(x = 2)` it attirbutes to `x` the value 2 and prints it. Also, the function `c()` can be sued within itself...

---

We can also define vectors with characters:

```r
(players <- c("Andy Murray", "Rafael Nadal", "Stan Wawrinka", 
             "Novak Djokovic", "Roger Federer"))
```


We can also check the "kind"" of objects stored in a vector? Check out the function `typeof`!

```r
typeof(players)
typeof(grand_slam_win)
```

---

Integer vs numeric (or double):

```r
a = c(1,2,3)
b = c(1L,2L,3L)
typeof(a)
typeof(b)
```

Notes: In `R` `1L` and `1` are actually different. This is because `R` considers any number as a double by default, except when adding the suffix `L` after an integer 

---

Here is an example of "coercion" (i.e. mixing different kinds of elements in a vector):

```r
(a = c("a", 2))
(b = c(FALSE, TRUE, 1, 2, "a"))
```

---