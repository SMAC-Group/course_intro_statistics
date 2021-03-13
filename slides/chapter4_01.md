---
type: slides
---

# Getting started

---

<div style="text-align:center"><img src="bigg_data2.png" alt=" " width="30%">


---
In this first chapter, we will present best practices when starting a statistical analysis on new data.
When you have loaded data in your `R` environment, the first thing you want to do is inspect the structure and dimensions of the data. What are the dimensions of your dataframe, what are the variables, what is their type and how are they encoded. Also, you would like to inspect if there is missing data and if so, how is the missingness structured. To inspect a dataframe structure, make use of the `str` function. Consider the dataset `airquality` available in base `R`.



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

We can observe that this dataset is composed of 153 observations of 6 variables, some encoded as numeric and some as integer.


---
As we can observe from the output of the last slide, the dataset contains some missing variables, encoded as `NA`. Missing data should be carefully explored and handled in the initial stages of analysis. To do so, you can use the package `naniar`. This packages provides tools for exploring missing data structures. There exists multiple techniques for handling missing data, from structured case deletion methods to complex imputation methods and maximum-likelihood based methods. We are not going to cover these methods in detail here as this is not the main topic, but the practitioner should consider them. However we presents tool to identify and quantify missing data.

You can produces a matrix identifying missing data points with the `vis_miss` function.

```r
library(naniar)
vis_miss(airquality, show_perc = T)
```


<div style="text-align:center"><img src="miss_airquality.png" alt=" " width="28%">


---
To identify which variables have missing data and in which proportion, use the function `gg_miss_var`

```r
gg_miss_var(airquality, show_pct = T)
```

<div style="text-align:center"><img src="var_miss_airquality.png" alt=" " width="40%">



---
You can observe that the variables names of this dataset contains capitals letters and dots. When working with large datasets, it is preferable to work with data where variables and values do not contains neither capitals or punctuation in order to avoid errors and mistakes in common data wrangling operations. A suggested convention to follow is the [snake case](https://en.wikipedia.org/wiki/Snake_case) styling. To do so, you can rely on the `janitor` package.


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

The pipe (`%>%`) operator can be used to decrease development time and improve readability and maintainability of code. More precisely, the pipe (`%>%`) operator enables to pipe a value forward into an expression or function call; something along the lines of `x %>% f`, rather than`f(x).` Using this operator becomes very useful when you are performing multiple chained operations on data. To make use of the pipe (`%>%`) operator, you should first load the [`magrittr`](https://magrittr.tidyverse.org/index.html) with `library(magrittr)`.

Here is a simple example where we consider taking the mean of a randomly generated normal distributed random variable.

Consider the following code. We can observe that these chained operations lead to an error prone code syntax. Furthermore, debugging this code and printing the results of each chained operation is not easily done.

```r
set.seed(12345)
mean(rnorm(100))

```
```out
[1] 0.2451972
```
Using the pipe (`%>%`) operator, we can rewrite this code as such:

```r
library(magrittr)
set.seed(12345)
rnorm(100) %>% mean()

```
```out
[1] 0.2451972
```

---

Similarly, here we consider taking the mode of a randomly generated Poisson distributed random variable.

```r
set.seed(12345)
as.numeric(names(which.max(table(rpois(n= 1000, lambda = 10)))))
```
```out
[1] 9
```
Using the pipe (`%>%`) operator, we can rewrite this code as such:

```r
library(magrittr)
set.seed(12345)
rpois(n= 1000, lambda = 10) %>% table() %>% which.max() %>% names() %>% as.numeric()
```

```out
[1] 9
```








