---
type: slides
---

# Visualizing ammounts

---


Let us consider the dataset `murders` in the `dslabs` package. Find the description of the dataset [here](https://www.rdocumentation.org/packages/dslabs/versions/0.7.3/topics/murders). 



Let's first load the data and `ggplot2` : 


```R
library(dslabs)
data(murders)
head(murders)
```

```out
       state abb region population total
1    Alabama  AL  South    4779736   135
2     Alaska  AK   West     710231    19
3    Arizona  AZ   West    6392017   232
4   Arkansas  AR  South    2915918    93
5 California  CA   West   37253956  1257
6   Colorado  CO   West    5029196    65
```

---


Using `dplyr`, we summarize the population and number of murders per region. We also compute the murder rate

```R
df_murders = murders %>%
          group_by(region) %>%
          summarise(total_pop = sum(population),
          total_murders = sum(total)
          ) %>%
          mutate(
            murder_rate = total_murders/total_pop
          )

head(df_murders)
``` 

```out
  region        total_pop total_murders murder_rate
* <fct>             <dbl>         <dbl>        <dbl>
1 Northeast      55317240          1469    0.0000266
2 South         115674434          4195    0.0000363
3 North Central  66927001          1828    0.0000273
4 West           71945553          1911    0.0000266

```

---

An adapted graphical representation to visualize counts are barplots.

```R
ggplot(df_murders) +
  aes(region, total_murders) +
  geom_bar(stat="identity") +
  theme_minimal()
```

<div style="text-align:center"><img src="bar1.png" alt=" " width="25%"></div>



---

Ordering the bars makes it easier to identify the structure of the data.

```R
ggplot(df_murders) +
  aes(reorder(region, total_murders), total_murders) +
  geom_bar(stat="identity") +
  theme_minimal()
```


<div style="text-align:center"><img src="bar3.png" alt=" " width="25%"></div>

---

We flip the coordinate system and remove horizontal grid lines. We also add the counts on each bar.

```R

ggplot(df_tab) +
  aes(x = reorder(region, total_murders), y= total_murders) +
  geom_bar(stat = "identity", width = .7) +
  coord_flip()+
  theme_minimal() +
  xlab("Region") +
  ylab("Total murders")+
  geom_text(stat='identity', aes(label=total_murders), hjust=1.4, col ="white", size = 5)+
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    axis.text = element_text(size = 13)
  )

```

---

<div style="text-align:center"><img src="bar4.png" alt=" " width="40%"></div>

---

We will now consider the dataset `world` available in the `poliscidata` package already discussed on the previous chapter. You can find a description of the dataset [here](https://rdrr.io/cran/poliscidata/man/world.html).

Let's represent the Public debt as a percentage of GDP (CIA) (`debt`) for all countries in Africa and USA/Canada. Remove observations for which debt is not specified.

Using functions of `dplyr` discussed in chapter 4 we subset the data.

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
  geom_point( color="black", size=3) +
  coord_flip() +
  theme_minimal() + 
  theme(axis.text.y = element_text(size = 10)) +
  xlab("Country") +
  ylab("Public debt as a percentage of GDP") +
    theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank()
    )

```

---

<div style="text-align:center"><img src="bar7.png" alt=" " width="40%"></div>
