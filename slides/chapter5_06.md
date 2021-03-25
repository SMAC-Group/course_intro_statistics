---
  type: slides
---
# Visualizing time series
---

Let us consider the `gapminder` dataset available in the package `dslabs` and already discussed in chapter 4. You can find a detailed description of the dataset [here](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html).


```R
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

Let us consider the life expectancy in Switzerland for a first example.

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


```R
ggplot(df_ch, aes(year, life_expectancy)) +
  geom_line() 
```

---

<div style="text-align:center"><img src="line1.png" alt=" " width="40%"></div>

---

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

Let us now represent the Life expectancy over the years, comparing Canada, China, Egypt, Germany and Switzerland.


```R
gapminder %>%
  filter(country %in% c("Switzerland", "Canada", "China", 
                        "India", "Egypt", "Germany", "Nepal")) %>%
  group_by(year, country) %>%
  summarise(life_expectancy = mean(life_expectancy)) %>%
  ggplot(aes(x=year, y=life_expectancy, color=country)) +
  geom_line(size=1)+ 
  theme_minimal() +
  labs(
    title = "Evolution of Life expectancy per country",
    caption = "Data: Gapminder, Gapminder Foundation",
    x = "Year", 
    y = "Life expectancy",
    color = "Country"
  )
```

---

<div style="text-align:center"><img src="line3.png" alt=" " width="40%"></div>
