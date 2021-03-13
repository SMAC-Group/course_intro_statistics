---
type: slides
---

# Select, slice and filter

---

## Introducing to dplyr

Data wrangling in `R` is made easier thanks to the [`tidyverse`](https://www.tidyverse.org/) collection of `R` packages, and especially because of the package `dplyr`.[`dplyr`](https://dplyr.tidyverse.org/) is a grammar of data manipulation, providing a consistent set of verbs that help you solve the most common data manipulation challenges. Many of the operations on data and datasets that we will discuss in the following chapters will be computed using functions of the `dplyr` package.`dplyr` was created to enable efficient manipulation of data with the advantages of speed and simplicity of coding. You can access to the documentation of this package and its functions [here](https://dplyr.tidyverse.org/index.html).

When working with data, you sometimes want to work with only a subset of all variables. Also, you may also want to filter or consider only a subset of all observations. The `dplyr` provides easy to use and powerful methods for such operations in the functions of `select()`, `filter()` and `slice()`.  

<div style="text-align:center"><img src="dplyr_name.jpg" alt=" " width="20%">

---

For this example, we will consider the dataset `world` available on the package `poliscidata`. Find a detailed description of all variables [here](https://rdrr.io/cran/poliscidata/man/world.html).

Let's first load the data 

```r
library(poliscidata)
data(world)
dim(world)
```

```out
> dim(world)
[1] 167 103
 ```

We can observe that this dataset is composed of 167 observations of 103 variables.

---



# Select variables

The `select` function enables to select variables based on various selection features.

You can subset specific columns as such:

```r
world %>%
  select(country, debt, literacy, spendeduc, spendmil, eu) %>%
  head()
```

```out
      country debt literacy spendeduc spendmil         eu
1 Afghanistan   NA     28.1        NA      1.9 Not member
2     Albania 59.3       NA       2.9      2.0 Not member
3     Algeria 25.7     69.9       4.3      3.0 Not member
4      Angola 20.3     67.4       2.6      3.0 Not member
5   Argentina 50.3     97.2       4.9      0.8 Not member
6     Armenia   NA     99.4       3.0      3.3 Not member
 ```
 
---

Similarly, you can select a range of consecutive variables with:
```r
world %>%
  select(country:dem_score14) %>%
  head()
```

```out
      country gini10    dem_level4 dem_rank14 dem_score14
1 Afghanistan   29.4 Authoritarian        151        2.77
2     Albania   33.0        Hybrid         88        5.67
3     Algeria   35.3 Authoritarian        117        3.83
4      Angola   58.6 Authoritarian        133        3.35
5   Argentina   48.8    Part Democ         52        6.84
6     Armenia   30.2        Hybrid        113        4.13
 ```

---
You can also select variables by matching patterns in their names, for example selecting all variables thtat starts with `"dem"` (related to democratic institution) in that dataframe`.


```r
world %>%
  select(country, starts_with("dem")) %>%
  head()
```
```out
      country    dem_level4 dem_rank14 dem_score14 dem_other dem_other5 democ democ11 democ_regime democ_regime08 dem_economist democ.yes
1 Afghanistan Authoritarian        151        2.77      10.5        10%    No      NA           No             No             0         0
2     Albania        Hybrid         88        5.67      63.0 Approx 60%   Yes       9          Yes            Yes             0       100
3     Algeria Authoritarian        117        3.83      40.8 Approx 40%    No       3           No             No             0         0
4      Angola Authoritarian        133        3.35      40.8 Approx 40%    No       2           No             No             0         0
5   Argentina    Part Democ         52        6.84      87.5 Approx 90%   Yes       8          Yes            Yes             1       100
6     Armenia        Hybrid        113        4.13      63.0 Approx 60%   Yes       5          Yes            Yes             0       100
 ```
 
Consult the [documentation](https://dplyr.tidyverse.org/reference/select.html) on the `select` function for an overview of supported selection features.

---


# Slice observations

`slice()` lets you index rows by their (integer) locations.

```r
data(iris)
iris %>%
  slice(50,100,150)
  
```

```out
  Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
1          5.0         3.3          1.4         0.2     setosa
2          5.7         2.8          4.1         1.3 versicolor
3          5.9         3.0          5.1         1.8  virginica

```

---
One can also make use of `slice_head()` and `slice_tail()` to select the first or last rows.

```r
iris %>% slice_head(n = 3)
  
```

```out
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
```


```r
iris %>% slice_tail(n = 3)
  
```

```out
  Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
1          6.5         3.0          5.2         2.0 virginica
2          6.2         3.4          5.4         2.3 virginica
3          5.9         3.0          5.1         1.8 virginica
```


---

# Filter observations


You can subset observations based on logical statements. Let's consider that we want to extract all countries that are member of the EU from this dataset.


```r
world %>%
  filter(eu == "EU Member state") %>%
  select(country) %>%
  head()
```
```out
         country
1        Austria
2        Belgium
3         Cyprus
4 Czech Republic
5        Denmark
6        Estonia
```
---

Let say we want to extract the Life expectancy at birth among females for countries that are democracies, member of OECD and for which the public debt as a percentage of GDP is greater or equal to 50%.

```r
world %>%
  filter(democ == "Yes") %>%
  filter(oecd == "OECD Member state") %>%
  filter(debt >= .5)%>%
  select(country, lifeex_f) %>%
  head()

```

```out
         country lifeex_f
1      Australia    84.35
2        Austria    82.84
3        Belgium    82.81
4         Canada    84.10
5 Czech Republic    80.66
6        Denmark    81.14
```

