---
type: slides
---

# Attributes

---

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

You retrive an attribute as follows:

```r
attr(grand_slam_win, "date")
```

```out
[1] "07-15-2017"
```

---

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

---

All the names can be retrieved as follows:

```r
names(grand_slam_win)
```

```out
 [1] "Andy Murray"    "Rafael Nadal"   "Stan Wawrinka"  "Novak Djokovic"
 [5] "Roger Federer"

```


---