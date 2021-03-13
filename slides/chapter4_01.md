---
type: slides
---

# Getting started

---

<div style="text-align:center"><img src="bigg_data2.png" alt=" " width="30%">


---
In this first section, we will present how you can start a statistical analysis on new "raw" data. After you load the raw data into `R`, it is important to first inspect the structure of the data. For example, it is useful to answer the following questions: What are the dimensions of the data? What are the variables? What are the types of these variables and how are they encoded? Moreover, is there any missing data? If so, how is the missingness structured? Below we consider an example dataset `airquality` that is available in base `R`, and we will show how to use the `str` function to inspect the structure of a dataframe.



```r
data(airquality)
dim(airquality)
str(airquality)
```

```out
> dim(airquality)
[1] 153   6
> str(airquality)
'data.frame':	153 obs. of  6 variables:
 $ Ozone  : int  41 36 12 18 NA 28 23 19 8 NA ...
 $ Solar.R: int  190 118 149 313 NA NA 299 99 19 194 ...
 $ Wind   : num  7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
 $ Temp   : int  67 72 74 62 56 66 65 59 61 69 ...
 $ Month  : int  5 5 5 5 5 5 5 5 5 5 ...
 $ Day    : int  1 2 3 4 5 6 7 8 9 10 ...
 ```

We can see that this dataset is composed of 153 observations of 6 variables, some encoded as numeric and some as integer.


---
We can also notice from the output that the dataset contains some missing variables, encoded as `NA`. Missing data should be carefully explored and handled in the initial stages of analysis. To do so, you can use the R package `naniar` that is helpful to handle missing data. In this package, there are tools varying from structured case deletion methods to complex imputation methods and maximum-likelihood based methods. We are not going to explain these methods in details here but you shall consider them in practice. Here we will present tools to identify and quantify missing data. For example, using the `vis_miss` function, we can produce a matrix identifying missing data.

```r
library(naniar)
vis_miss(airquality, show_perc = T)
```


<div style="text-align:center"><img src="miss_airquality.png" alt=" " width="35%">


---
To identify which variables have missing data and their proportions, we can use the function `gg_miss_var`.

```r
gg_miss_var(airquality, show_pct = T)
```

<div style="text-align:center"><img src="var_miss_airquality.png" alt=" " width="40%">



---
We can also observe that the variables names of this dataset contain capitals letters and dots. When working with large datasets, it is preferred to avoid using capitals or punctuations in order to avoid potential errors in the future analysis. We suggest to follow the conventional [snake case](https://en.wikipedia.org/wiki/Snake_case) styling, which can be achieved using the `janitor` package.

The scripts below clean the variables names of the dataset `airquality` following the snake case convention.
```r
library(janitor)
colnames(airquality)
airquality = clean_names(airquality)
colnames(airquality)
```


```out
> colnames(airquality)
[1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"    
> airquality = clean_names(airquality)
> colnames(airquality)
[1] "ozone"   "solar_r" "wind"    "temp"    "month"   "day"    
``` 

---

## Introducing the pipe (`%>%`) operator

<div style="text-align:center"><img src="pipe_op.jpg" alt=" " width="25%">


---

The pipe (`%>%`) operator can be used to decrease operation time and improve readability and maintainability of code. More precisely, the pipe (`%>%`) operator enables to pipe a value forward into an expression or function call. For example, we can use `x %>% f` instead of `f(x)` when evaluating a function. Using the pipe operator is particularly useful when you are performing multiple chained operations on data. To make use of the pipe operator, you shall first install and load the [`magrittr`](https://magrittr.tidyverse.org/index.html) R package.

We start with a simple example below. Consider a sequence of randomly generated normally distributed random variables. We can use the following chained operations.

```r
set.seed(12345)
mean(rnorm(100))

```
```out
[1] 0.2451972
```
We can also rewrite these chained operations using the pipe (`%>%`) operator as below:

```r
library(magrittr)
set.seed(12345)
rnorm(100) %>% mean()

```
```out
[1] 0.2451972
```

---

Now consider a more complicated example where we want to compute the mode of a table of Poisson variables.

```r
set.seed(12345)
as.numeric(names(which.max(table(rpois(n= 1000, lambda = 10)))))
```
```out
[1] 9
```

As we can see, these chained operations become very complicated when there are multiple operations. It can easily lead to an error, for example, if some parentheses are missing. Furthermore, it is not easy to debug as we cannot print out the corresponding result of each operation. Therefore, we can use the pipe (`%>%`) operator instead as below:

```r
library(magrittr)
set.seed(12345)
rpois(n= 1000, lambda = 10) %>% table() %>% which.max() %>% names() %>% as.numeric()
```

```out
[1] 9
```








