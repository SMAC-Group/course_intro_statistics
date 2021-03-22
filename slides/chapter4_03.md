---
type: slides
---

# Rename, recode and mutate

---

# Rename variables

Sometimes you may want to rename some of the variables that are present in your dataframe. One approach is to do this manually by calling the function `colnames(df)`, and then modify the considered object. Alternatively, the function `rename()` in the `dplyr` package allows to handle this in a much easier manner.

Let us consider the `swiss` dataset availabe in base `R`. You can check the documentation on this dataset about Swiss fertility and socioeconomic indicators with `help(swiss)`. Now we want to rename the first two columns as follows:

```r
library(dplyr)
data("swiss")
colnames(swiss)
```

```out
[1] "Fertility"        "Agriculture"      "Examination"      "Education"        "Catholic"         "Infant.Mortality"
 ```


```r
swiss = swiss %>% rename(fert = Fertility, perc_male_agr = Agriculture)
colnames(swiss)
```

```out
[1] "fert"             "perc_male_agr"    "Examination"      "Education"        "Catholic"         "Infant.Mortality"
 ```

---

We can also provide string formatting functions to `rename_with`. As an example, we can specify lowercase or uppercase letters using:

```r
swiss = swiss %>% rename_with(tolower)
colnames(swiss)
```

```out
[1] "fert"             "perc_male_agr"    "examination"      "education"        "catholic"         "infant.mortality"
```

or 

```r
swiss = swiss %>% rename_with(toupper)
colnames(swiss)
```

```out
[1] "FERT"             "PERC_MALE_AGR"    "EXAMINATION"      "EDUCATION"        "CATHOLIC"         "INFANT.MORTALITY"
```
 
---



# Recode values

You can also recode numeric, character or factor values with the `recode()` function of the `dplyr` package. Here is an example on a vector:

```r
my_vec <- sample(c("a", "b", "c"), 15, replace = TRUE)
my_vec
my_vec = recode(my_vec, a = "var_1", b = "var_2")
my_vec
```

```out
> my_vec
 [1] "c" "b" "c" "a" "b" "c" "c" "c" "c" "a" "b" "a" "a" "a" "b"
> my_vec = recode(my_vec, a = "var_1", b = "var_2")
> my_vec
 [1] "c"     "var_2" "c"     "var_1" "var_2" "c"     "c"     "c"     "c"     "var_1" "var_2" "var_1" "var_1" "var_1" "var_2"
 
 ```

---

Here is an example to add a variable to the `iris` dataset.

```r
data(iris)
iris %>% head() 
iris$species_bin = recode(.x  = iris$Species, "setosa" = 1, "versicolor" = 2, "virginica" = 3)
iris %>% head() 

```

```out
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
> iris$species_bin = recode(.x  = iris$Species, "setosa" = 1, "versicolor" = 2, "virginica" = 3)
> iris %>% head() 
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species species_bin
1          5.1         3.5          1.4         0.2  setosa           1
2          4.9         3.0          1.4         0.2  setosa           1
3          4.7         3.2          1.3         0.2  setosa           1
4          4.6         3.1          1.5         0.2  setosa           1
5          5.0         3.6          1.4         0.2  setosa           1
6          5.4         3.9          1.7         0.4  setosa           1
 
 ```

---

# Create new variables using mutate

You can use the function `mutate` to create new variables as functions of existing variables. Here is an example using the `iris` dataset:

```r
head(iris)

```

```out
 Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```

---

```r
iris = iris %>% 
  mutate(ratio_petal_l_sepal_l = Petal.Length / Sepal.Length,
         ratio_petal_w_sepal_w = Petal.Width / Sepal.Width)
head(iris)
```

```out
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species ratio_petal_l_sepal_l ratio_petal_w_sepal_w
1          5.1         3.5          1.4         0.2  setosa             0.2745098            0.05714286
2          4.9         3.0          1.4         0.2  setosa             0.2857143            0.06666667
3          4.7         3.2          1.3         0.2  setosa             0.2765957            0.06250000
4          4.6         3.1          1.5         0.2  setosa             0.3260870            0.06451613
5          5.0         3.6          1.4         0.2  setosa             0.2800000            0.05555556
6          5.4         3.9          1.7         0.4  setosa             0.3148148            0.10256410 
 ```

---

This is particularly useful when used together with the `recode()` function. Here is a second example with the dataset `world` of the `poliscidata` package, where we call `recode()` inside of a `mutate()` function.


```r
world %>%
  select(country, debt, spendeduc, spendmil, eu) %>%
  head()
```

```out
      country debt spendeduc spendmil         eu
1 Afghanistan   NA        NA      1.9 Not member
2     Albania 59.3       2.9      2.0 Not member
3     Algeria 25.7       4.3      3.0 Not member
4      Angola 20.3       2.6      3.0 Not member
5   Argentina 50.3       4.9      0.8 Not member
6     Armenia   NA       3.0      3.3 Not member
 ```
 
---
 
 ```r
 world %>%
  select(country, debt, spendeduc, spendmil, eu) %>%
  mutate(eu_bin = recode_factor(eu, 
                       "EU Member state" = 1,
                       "Not member"=0),
         ratio_spend_educ_mil = spendeduc / spendmil) %>%
  head()
 
 ```
 
 
 
 ```out
      country debt spendeduc spendmil         eu eu_bin ratio_spend_educ_mil
1 Afghanistan   NA        NA      1.9 Not member      0                   NA
2     Albania 59.3       2.9      2.0 Not member      0            1.4500000
3     Algeria 25.7       4.3      3.0 Not member      0            1.4333333
4      Angola 20.3       2.6      3.0 Not member      0            0.8666667
5   Argentina 50.3       4.9      0.8 Not member      0            6.1250000
6     Armenia   NA       3.0      3.3 Not member      0            0.9090909
 ```
 
 
