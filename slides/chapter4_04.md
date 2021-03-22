---
type: slides
---

# Summarise, group and arrange

---

## Summarise data

The `summarise()` function creates a new dataframe that summarises the data based on specified functions. Here is a simple example considering the `iris` dataset available in base `R`:

```r
library(dplyr)
iris %>% 
  clean_names() %>%
  summarise(mean_petal_lenght = mean(petal_length),
            mean_sepal_length = mean(sepal_length),
            sd_petal_lenght = sd(petal_length),
            sd_sepal_lenght = sd(sepal_length))
```

```out
  mean_petal_lenght mean_sepal_length sd_petal_lenght sd_sepal_lenght
1             3.758          5.843333        1.765298       0.8280661
 ```

This is particularly useful when grouping observations per variable. Before exploring such operations, let's present how to group data with `dplyr`.

---

## Grouping and summarising data

Suppose you want to compute operations on groups defined by variables. Consider the dataset `gapminder` in the `gapminder` package. The `group_by()` function takes an existing dataframe and converts it into a grouped dataframe where operations are performed "by group". `ungroup() ` removes grouping. Grouping does not change how the data looks but changes how it acts with the other `dplyr` operations.

```r
library(gapminder)
data(gapminder)
head(gapminder)
```

```out
  country     continent  year lifeExp      pop gdpPercap
  <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
1 Afghanistan Asia       1952    28.8  8425333      779.
2 Afghanistan Asia       1957    30.3  9240934      821.
3 Afghanistan Asia       1962    32.0 10267083      853.
4 Afghanistan Asia       1967    34.0 11537966      836.
5 Afghanistan Asia       1972    36.1 13079460      740.
6 Afghanistan Asia       1977    38.4 14880372      786.
 ```

---

Let us combine `group_by()` and `summarise()` to compute summary statistics for data grouped by variables.

```r
gapminder %>% 
  clean_names() %>%
  group_by(continent) %>% 
  summarise(
    mean_life_exp = mean(life_exp),
    var_life_exp = var(life_exp),
    mean_gdp = mean(gdp_percap),
    var_gdp = var(gdp_percap)
  )

```

```out
  continent mean_life_exp var_life_exp mean_gdp    var_gdp
* <fct>             <dbl>        <dbl>    <dbl>      <dbl>
1 Africa             48.9         83.7    2194.   7997187.
2 Americas           64.7         87.3    7136.  40918591.
3 Asia               60.1        141.     7902. 197272506.
4 Europe             71.9         29.5   14469.  87520020.
5 Oceania            74.3         14.4   18622.  40436669.
 ```

---

## Sort observations

Let us consider the dataset `world` from the `poliscidata` package. Imagine that you want to extract literacy rate (`literacy`) and life expectancy at birth (`lifeex_total`) for the 5 country with the highest public expenditure on education as a percentage of GDP (UN).





```r
world %>% 
  clean_names() %>% 
  select(country, spendeduc, literacy, lifeex_total) %>%
  arrange(-spendeduc) %>% 
  slice_head(n = 5)
```

```out
   country spendeduc literacy lifeex_total
1     Cuba      13.6     99.8        77.70
2  Lesotho      12.4     84.8        51.63
3 Djibouti       8.7     67.9        61.14
4  Moldova       8.2     99.1        71.37
5 Botswana       8.1     81.2        58.05
 ```
 


