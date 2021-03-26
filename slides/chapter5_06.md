---
  type: slides
---
# Visualizing time series
---

In the previous sections, we discuss graphs where we mainly plot one numerical variable against another. There are situations where one variable imposes a certain order on the other variable, for example when one variable is time. As time imposes an inherent order structure on the data, we need to arrange the points in order, for example, of increasing time. We often want to visualize this temporal order and this can be realized with line graphs.

Let's consider the `gapminder` dataset available in the `dslabs` package. You can find a detailed description of the dataset [here](https://rdrr.io/cran/dslabs/man/gapminder.html).


```R
library(dslabs)
data(gapminder)
head(gapminder)
``` 



```out
              country year infant_mortality life_expectancy fertility population          gdp continent          region
1             Albania 1960           115.40           62.87      6.19    1636054           NA    Europe Southern Europe
2             Algeria 1960           148.20           47.50      7.65   11124892  13828152297    Africa Northern Africa
3              Angola 1960           208.00           35.98      7.32    5270844           NA    Africa   Middle Africa
4 Antigua and Barbuda 1960               NA           62.97      4.43      54681           NA  Americas       Caribbean
5           Argentina 1960            59.87           65.39      3.11   20619075 108322326649  Americas   South America
6             Armenia 1960               NA           66.86      4.55    1867396           NA      Asia    Western Asia
``` 


---

Let's consider the life expectancy in Switzerland as an example.

```R
df_ch = gapminder %>% filter(country == "Switzerland")
df_ch$year = as.Date(as.character(df_ch$year), format = "%Y")
head(df_ch)
```


```out
 country       year infant_mortality life_expectancy fertility population gdp continent         region
1 Switzerland 1960-03-25             21.6           71.46      2.52    5296120  NA    Europe Western Europe
2 Switzerland 1961-03-25             21.2           71.79      2.55    5393411  NA    Europe Western Europe
3 Switzerland 1962-03-25             20.7           71.35      2.58    5503000  NA    Europe Western Europe
4 Switzerland 1963-03-25             20.1           71.34      2.58    5618160  NA    Europe Western Europe
5 Switzerland 1964-03-25             19.3           72.23      2.56    5729465  NA    Europe Western Europe
6 Switzerland 1965-03-25             18.4           72.36      2.53    5829958  NA    Europe Western Europe
```

---

As life expectancy depends on the year, we can plot the relation between life expectancy and year in a line graph to visualize this time series data.

```R
ggplot(df_ch, aes(year, life_expectancy)) +
  geom_line() 
```

---

<div style="text-align:center"><img src="line1.png" alt=" " width="35%"></div>

---

The line graph shows the temporal structure between the life expectancy and the year. Now we can further improve the graph, for example, by simplifying the theme, adding a title, specifying the labels of the axis, and adding more ticks on the x-axis, so that the graph is more understandable.

```R
ggplot(df_ch, aes(year, life_expectancy)) +
  geom_line() +
  theme_minimal() +
  labs(
    title = "Life expectancy in Switzerland",
    caption = "Data: Gapminder, Hans Rosling",
    x = "Year", 
    y = "Life expectancy  (Year)") + 
  scale_x_date(date_breaks = "5 year", date_labels = "%Y") +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0)),
        axis.title.x = element_text(margin = margin(t = 20, r = 0, b = 0, l = 0)))
  
```

---

<div style="text-align:center"><img src="line2.png" alt=" " width="40%"></div>


---

Let us now consider multiple time series data by comparing the life expectancy over the years in the following countries: Switzerland, Canada, China, India, Egypt, Germany, and Nepal.

We first define the following dataframe.

```R
df_sub = gapminder %>% filter(country %in% c("Switzerland", "Canada", "China", 
                                    "India", "Egypt", "Germany", "Nepal"))
df_life_exp =   df_sub %>% group_by(year, country) %>%
  summarise(life_expectancy = mean(life_expectancy)) 
head(df_life_exp)

```

```out
   year country life_expectancy
  <int> <fct>             <dbl>
1  1960 Canada             71  
2  1960 China              30.5
3  1960 Egypt              48.3
4  1960 Germany            69.3
5  1960 India              41.3
6  1960 Nepal              39.8
```

---


```R
ggplot(df_life_exp, aes(x = year, y = life_expectancy, color = country, group = country)) + 
  geom_line() +
  geom_text(data = filter(df_life_exp, year == max(df_life_exp$year)),
            aes(label = country),
            hjust = 0, nudge_x = 0.1) +
  coord_cartesian(clip = 'off') +
  theme_minimal() +
  theme(legend.position = 'none',
        plot.margin = margin(0.1, 2.6, 0.1, 0.1, "cm"))  +
  labs(
    title = "Evolution of Life expectancy per country",
    caption = "Data: Gapminder, Gapminder Foundation",
    x = "Year", 
    y = "Life expectancy",
    color = "Country"
  ) + 
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
        )

```
---

<div style="text-align:center"><img src="line3.png" alt=" " width="40%"></div>
