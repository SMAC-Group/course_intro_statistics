---
type: slides
---

# Visualizing counts

---

Let us consider the dataset `diamonds` available in base `R`. You can find a detailed description of the dataset [here](https://ggplot2.tidyverse.org/reference/diamonds.html). 

Let's first load the data and `ggplot2` : 

```R
library(ggplot2)
data(diamonds)
```

---


Let's consider the dataset `diamonds` and say that we want to count the number of diamonds per color and per cut.

Using `dplyr`, we can summarize this dataset and compute the quantities of interest as such

```R
df_tab = diamonds %>% group_by(cut, color) %>% tally()
head(df_tab)
``` 

```out
# A tibble: 6 x 3
# Groups:   cut [1]
  cut   color     n
  <ord> <ord> <int>
1 Fair  D       163
2 Fair  E       224
3 Fair  F       312
4 Fair  G       314
5 Fair  H       303
6 Fair  I       175

```

---

An adapted graphical representation to visualize counts are barplots.

```R
ggplot(df_tab) +
  aes(x = cut, weight = n) +
  geom_bar() +
  theme_minimal()
```

<div style="text-align:center"><img src="count1.png" alt=" " width="30%"></div>


---

Similarly, let's consider a representation of the count of diamond per color.

```R
ggplot(df_tab) +
  aes(x = color, weight = n) +
  geom_bar() +
  theme_minimal()
```


<div style="text-align:center"><img src="bar2.png" alt=" " width="30%"></div>


---
When representing counts, It is a good practice to order the values such that you easily identify the ordering of the data based on the variable you represent.

```R
ggplot(df_tab) +
  aes(x = reorder(color, n), weight = n) +
  geom_bar() +
  xlab("Color")
  theme_minimal()
```


<div style="text-align:center"><img src="bar3.png" alt=" " width="30%"></div>

---

You could also consider using `facet` to represent the count of a variable conditionned on two variables.

```R
ggplot(df_tab) +
 aes(x = cut, weight = n) +
 geom_bar() +
 theme_minimal() +
 facet_wrap(vars(color))
```

<div style="text-align:center"><img src="bar4.png" alt=" " width="30%"></div>

---

We will now consider the dataset `world` available in the `poliscidata` package already discussed on the previous chapter. You can find a description of the dataset [here](https://rdrr.io/cran/poliscidata/man/world.html).

Let's represent the Public debt as a percentage of GDP (CIA) (`debt`) for all countries in Africa and USA/Canada. Remove observations for which debt is not specified.


```R
df_sub = world %>% 
  filter(regionun %in% c("Africa", "USA/Canada")) %>% 
  select(country, debt) %>%
  na.omit()
```

```R
ggplot(df_sub) +
  aes(x = country, weight = debt) +
  geom_bar() +
  coord_flip() +
  theme_minimal() + 
  theme(axis.text.y = element_text(size = 10)) 
```

---

<div style="text-align:center"><img src="bar5.png" alt=" " width="40%"></div>

---

As discussed earlier, we suggest to order observations by their counts.

```R
ggplot(df_sub) +
  aes(x = reorder(country, debt), weight = debt) +
  geom_bar() +
  coord_flip() +
  theme_minimal() + 
  theme(axis.text.y = element_text(size = 10)) +
  xlab("Country") +
  ylab("Public debt as a percentage of GDP")
```
---


<div style="text-align:center"><img src="bar6.png" alt=" " width="40%"></div>


---
Consider a lolipop chart to reduce the graphic clutter

```R
ggplot(df_sub) +
  aes(x = reorder(country, debt), y = debt) +
  geom_segment( aes(x=reorder(country, debt), xend=country, y=0, yend=debt)) +
  geom_point( color="black", size=2, alpha=0.6) +
  coord_flip() +
  theme_minimal() + 
  theme(axis.text.y = element_text(size = 10)) +
  xlab("Country") +
  ylab("Public debt as a percentage of GDP")

```

---

<div style="text-align:center"><img src="bar7.png" alt=" " width="40%"></div>
