---
type: slides
---

# Pivot and joins

---

## Pivoting data 

Pivoting data consists in rotating data from a state of rows to a state of columns, possibly aggregating multiple source values. Some reasons to pivot data include, for example, formatting data for reporting purposes or calculating custom aggregations. In `R`, the easiest way to pivot data is to rely on the [`tidyr`](https://tidyr.tidyverse.org/index.html) package, which is also part of the [`tidyverse`](https://www.tidyverse.org/) collection of `R` packages.

We will consider the two potential situations. When you want to pivot data from long to wide format, you can use the `pivot_wider()` function. When you want to pivot data from wide to long format, you can use the `pivot_longer()` function. Thanks to Garrick Aden-Buie for all the animations on this chapter that all come from this [Github repo](https://github.com/gadenbuie/tidyexplain).


<div style="text-align:center"><img src="pivot.gif" alt=" " width="23%">



---

Consider the dataset `gapminder` in the `gapminder` package.

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
We would like to transform the data such that the resulting dataframe has one line for each country, with each column corresponding to a year, where the elements of the dataframe are the values of life expectancy. You can pivot the `gapminder` object to obtain the corresponding dataframe as follows:

```r
library(tidyr)
library(janitor)
gapminder %>% 
  clean_names() %>%
  pivot_wider(id_cols = c("country","continent"), 
            values_from = c("life_exp"), 
            names_from = "year") %>%
            
  head()
```


```out
  country     continent `1952` `1957` `1962` `1967` `1972` `1977` `1982` `1987` `1992` `1997` `2002` `2007`
  <fct>       <fct>      <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
1 Afghanistan Asia        28.8   30.3   32.0   34.0   36.1   38.4   39.9   40.8   41.7   41.8   42.1   43.8
2 Albania     Europe      55.2   59.3   64.8   66.2   67.7   68.9   70.4   72     71.6   73.0   75.7   76.4
3 Algeria     Africa      43.1   45.7   48.3   51.4   54.5   58.0   61.4   65.8   67.7   69.2   71.0   72.3
4 Angola      Africa      30.0   32.0   34     36.0   37.9   39.5   39.9   39.9   40.6   41.0   41.0   42.7
5 Argentina   Americas    62.5   64.4   65.1   65.6   67.1   68.5   69.9   70.8   71.9   73.3   74.3   75.3
6 Australia   Oceania     69.1   70.3   70.9   71.1   71.9   73.5   74.7   76.3   77.6   78.8   80.4   81.2
 ```
 
---

Similarly, suppose that we would like to obtain the dataset with the values of 
`life_exp`, `pop` and `gdp_percap` in one single column `value`. A second column `measure` would include the variable measured (`life_exp`, `pop` or `gdp_percap`).

```r
gapminder %>%
  clean_names() %>%
  pivot_longer(
    life_exp:gdp_percap,
    names_to = "measure",
    values_to = "value"
  ) %>%
  head()
```


```out
  country     continent  year measure        value
  <fct>       <fct>     <int> <chr>          <dbl>
1 Afghanistan Asia       1952 life_exp        28.8
2 Afghanistan Asia       1952 pop        8425333  
3 Afghanistan Asia       1952 gdp_percap     779. 
4 Afghanistan Asia       1957 life_exp        30.3
5 Afghanistan Asia       1957 pop        9240934  
6 Afghanistan Asia       1957 gdp_percap     821. 
```


---

## Joins 

When working with data, you will often have to combine information from different data sources. In this case, it is useful to know how to combine rows of different dataframes based on **matching** identifier for rows. 

`dplyr` implements 4 types of mutating joints: `full_join`, `left_join`, `right_join` and `inner_join`. Suppose that we want to join two dataframes, `x` and `y`.

- `left_join(x, y)` returns all rows from x, and all columns from x and y. Rows in x with no match in y will have `NA` values in the new columns. If there are multiple matches between x and y, all combinations of the matches are returned.
- `right_join(x, y)` returns all rows from y, and all columns from x and y. Rows in y with no match in x will have `NA` values in the new columns. If there are multiple matches between x and y, all combinations of the matches are returned.
- `inner_join(x, y)` returns all rows from x where there are matching values in y, and all columns from x and y. If there are multiple matches between x and y, all combination of the matches are returned.
- `full_join(x, y)` returns all rows and all columns from both x and y. When there are not matching values, `NA` will be returned for the missing ones.

---

<div style="text-align:center"><img src="joins.png" alt=" " width="50%">


---

In the following illustrating example, we will define two small dataframes to work with and explain each type of joint.

```r
df_a <- gapminder %>%
  pivot_wider(
    id_cols = c("country", "continent"),
    values_from = c("gdp_percap"),
    names_from = "year",
    names_prefix = ""
  ) %>%
  select(country, "2007") %>%
  rename(gdp_2007 = "2007") %>%
  slice(1, 10,  60)


df_b <- world %>%
  select(country, oecd) %>%
  filter(country %in% c("Afghanistan", "Belgium", "Switzerland"))


```

---

Printing these two datasets, we obtain:

```r
df_a
df_b

```

```out
> df_a
  country     gdp_2007
  <fct>          <dbl>
1 Afghanistan     975.
2 Belgium       33693.
3 Indonesia      3541.
> df_b
      country              oecd
1 Afghanistan        Not member
2     Belgium OECD Member state
3 Switzerland OECD Member state

```


---

## Left join

<div style="text-align:center"><img src="left-join.gif" alt=" " width="30%">

---

## Left join

<div style="text-align:center"><img src="left-join.gif" alt=" " width="15%">

```r
left_join(df_a, df_b)

```

```out
  country     gdp_2007 oecd             
  <fct>          <dbl> <fct>            
1 Afghanistan     975. Not member       
2 Belgium       33693. OECD Member state
3 Indonesia      3541. NA   
```

---

## Right join

<div style="text-align:center"><img src="right-join.gif" alt=" " width="30%">

---

## Right join

<div style="text-align:center"><img src="right-join.gif" alt=" " width="15%">

```r
right_join(df_a, df_b)

```

```out
  country     gdp_2007 oecd             
  <fct>          <dbl> <fct>            
1 Afghanistan     975. Not member       
2 Belgium       33693. OECD Member state
3 Switzerland      NA  OECD Member state
```


---

## Full join

<div style="text-align:center"><img src="full-join.gif" alt=" " width="30%">

---

## Full join

<div style="text-align:center"><img src="full-join.gif" alt=" " width="15%">

```r
full_join(df_a, df_b, by = "country")

```

```out
`  country     gdp_2007 oecd             
  <fct>          <dbl> <fct>            
1 Afghanistan     975. Not member       
2 Belgium       33693. OECD Member state
3 Indonesia      3541. NA               
4 Switzerland      NA  OECD Member state

```

---

## Inner join

<div style="text-align:center"><img src="inner-join.gif" alt=" " width="30%">

---

## Inner join

<div style="text-align:center"><img src="inner-join.gif" alt=" " width="15%">


```r
inner_join(df_a, df_b)

```

```out
  country     gdp_2007 oecd             
  <fct>          <dbl> <fct>            
1 Afghanistan     975. Not member       
2 Belgium       33693. OECD Member state

```

---

Now that we have covered all these operations on data using packages from the [`tidyverse`](https://www.tidyverse.org/) collection of `R` packages, let's try to solve and understand the exercises so that you can practice with these functions!


# <div style="text-align:center"><img src="cleaning_data.png" alt=" " width="40%">


