---
  type: slides
---

# ggplot2 extensions

---

There exists multiple [`ggplot2` extensions](https://exts.ggplot2.tidyverse.org/) available on [CRAN](https://cran.r-project.org/). We have already used some of them on the earlier part of this chapter, but we will explore more of capabilities in this chapter.

---

# gganimate

Despite the ability to represent multiple variables in one graph by defining various geometric elements and aesthetics mappings, you may consider representing data with an animated graph. Such a representation enables to represent another dimension, for example time and are easy to embed in web-based report. You can package `gganimate` becomes useful.

<div style="text-align:center"><img src="hexgganimate.png" alt=" " width="50%"></div>

---

Let us consider the price of TSLA, AAPL BABA and GOOGL for this example. We will load the time series using `quantmod` and convert the `xts` object to a `data.frame` using `ggfortify`. 


```R
rm(list=ls())
library(quantmod)
library(ggfortify)
library(janitor)
getSymbols(c("AAPL", "TSLA", "GOOGL", "BABA"), from = "2019-01-01")
tsl_price_df = fortify(TSLA) %>% clean_names()
head(tsl_price_df)
```


```out
       index tsla_open tsla_high tsla_low tsla_close tsla_volume tsla_adjusted
1 2019-01-02    61.220    63.026   59.760     62.024    58293000        62.024
2 2019-01-03    61.400    61.880   59.476     60.072    34826000        60.072
3 2019-01-04    61.200    63.600   60.546     63.538    36970500        63.538
4 2019-01-07    64.344    67.348   63.550     66.992    37756000        66.992
5 2019-01-08    68.392    68.802   65.404     67.070    35042500        67.070
6 2019-01-09    67.100    68.700   66.294     67.706    27164500        67.706


```

---



```R
library(ggplot2)
tsla_plot = ggplot(tsl_price_df, aes(index, tsla_close)) +
  geom_line() +
  theme_minimal() +
  labs(
    title = "TSLA",
    x = "Date", 
    y = "Price ($)") + 
  scale_x_date(date_breaks = "2 month", date_labels = "%m/%y") +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0)),
        axis.title.x = element_text(margin = margin(t = 20, r = 0, b = 0, l = 0))) 
  tsla_plot
```
        
---
     
<div style="text-align:center"><img src="tsla1.png" alt=" " width="40%"></div>

---

A gif is just a rendered collection of images. Therefore, you can easily create an animated gif of this plot by specifying the variable that could change with each images. Note that `gganimate` relies on some dependencies that may need to be installed outside of an R environment depending on the OS.

```R
library(gifski)
library(gganimate)
(tsla_price_anim = tsla_plot + geom_point() + transition_reveal(index))
```

Display with and 

```R
animate(tsla_plot, duration = 5, fps = 20, width = 200, height = 200, 
        renderer = gifski_renderer())

```

and save with
```R
anim_save("tsla.gif", animation = tsla_price_anim)
```

---

<div style="text-align:center"><img src="tsla.gif" alt=" " width="35%"></div>


---

Let's now try to represent all three stocks price in a single plot an animate the resulting graph.


```R
library(dplyr)
library(tidyr)
aapl_price_df = fortify(AAPL) %>% clean_names()
googl_price_df = fortify(GOOGL) %>% clean_names()
baba_price_df = fortify(BABA) %>% clean_names()
df_1 = dplyr::left_join(tsl_price_df, aapl_price_df, by = "index")
df_2 = dplyr::left_join(googl_price_df, df_1, by = "index")
df_stocks = dplyr::left_join(df_2, baba_price_df, by = "index")
df_stocks = df_stocks %>% select(index, aapl_close, googl_close, baba_close, tsla_close)
colnames(df_stocks) = c("index", "AAPL", "GOOGL", "BABA", "TSLA")
head(df_stocks)
```

```out
       index    AAPL   GOOGL   BABA   TSLA
1 2019-01-02 39.4800 1054.68 136.70 62.024
2 2019-01-03 35.5475 1025.47 130.60 60.072
3 2019-01-04 37.0650 1078.07 139.75 63.538
4 2019-01-07 36.9825 1075.92 143.10 66.992
5 2019-01-08 37.6875 1085.37 146.79 67.070
6 2019-01-09 38.3275 1081.65 151.92 67.706
```

---

```R
df_stocks_long = tidyr::pivot_longer(df_stocks, col = !index)
head(df_stocks_long)
```

```out
  index      name   value
  <date>     <chr>  <dbl>
1 2019-01-02 AAPL    39.5
2 2019-01-02 GOOGL 1055. 
3 2019-01-02 BABA   137. 
4 2019-01-02 TSLA    62.0
5 2019-01-03 AAPL    35.5
6 2019-01-03 GOOGL 1025. 
```

---

Let's plot the stock's prices

```R
library(ggplot2)
stocks_plot = ggplot(df_stocks_long, aes(x = index, y = value, color = name, group = name)) + 
  geom_line() +
  theme_minimal() +
  geom_text(data = filter(df_stocks_long, index == max(df_stocks_long$index)),
            aes(label = name),
            hjust = 0, nudge_x = 0.1) +
  coord_cartesian(clip = 'off') +
  scale_x_date(date_breaks = "4 month", date_labels = "%m/%y") +
  theme(legend.position = 'none',
        plot.margin = margin(0.1, 2.6, 0.1, 0.1, "cm"))  +
  labs(
    title = "Stock prices",
    x = "Date", 
    y = "Price ($)") + 
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
  )
stocks_plot
``` 

---


<div style="text-align:center"><img src="stock1.png" alt=" " width="40%"></div>



---

To animate the previous plot, we must slighlty change the code of the figure

```R
library(ggplot2)
stocks_plot_2 = ggplot(df_stocks_long, aes(x = index, y = value, color = name, group = name)) + 
  geom_line() +
  theme_minimal() +
  geom_text(data = df_stocks_long,
            aes(label = name),
            hjust = 0, nudge_x = 0.1) +
  coord_cartesian(clip = 'off') +
  scale_x_date(date_breaks = "4 month", date_labels = "%m/%y") +
  theme(legend.position = 'none',
        plot.margin = margin(0.1, 2.6, 0.1, 0.1, "cm"))  +
  labs(
    title = "Stock prices",
    x = "Date", 
    y = "Price ($)") + 
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
  )

```

---

We can then create, display and save the animation similarly as before with:

```R
(stocks_plot_anim = stocks_plot_2 + geom_point() + transition_reveal(index))
animate(stocks_plot, duration = 5, fps = 20, width = 200, height = 200, 
        renderer = gifski_renderer())
anim_save("stocks.gif", animation = stocks_plot_anim)
```

---


<div style="text-align:center"><img src="stocks.gif" alt=" " width="35%"></div>


---

We now resale the four time series by their first value, so we can compare their percent change since the first January 2019.

```R
df_stocks$AAPL = df_stocks$AAPL / df_stocks[1, "AAPL"]
df_stocks$GOOGL = df_stocks$GOOGL / df_stocks[1, "GOOGL"]
df_stocks$BABA = df_stocks$BABA / df_stocks[1, "BABA"]
df_stocks$TSLA = df_stocks$TSLA / df_stocks[1, "TSLA"]
df_stocks_long2 = tidyr::pivot_longer(df_stocks, col = !index)
head(df_stocks_long2)
```

```out
  index      name  value
  <date>     <chr> <dbl>
1 2019-01-02 AAPL  1    
2 2019-01-02 GOOGL 1    
3 2019-01-02 BABA  1    
4 2019-01-02 TSLA  1    
5 2019-01-03 AAPL  0.900
6 2019-01-03 GOOGL 0.972

```

---

```R
library(ggplot2)
stocks_plot_3 = ggplot(df_stocks_long2, aes(x = index, y = value, color = name, group = name)) + 
  geom_line() +
  theme_minimal() +
  geom_text(data = filter(df_stocks_long2, index == max(df_stocks_long2$index)),
            aes(label = name),
            hjust = 0, nudge_x = 0.1) +
  coord_cartesian(clip = 'off') +
  scale_x_date(date_breaks = "4 month", date_labels = "%m/%y") +
  theme(legend.position = 'none',
        plot.margin = margin(0.1, 2.6, 0.1, 0.1, "cm"))  +
  labs(
    title = "Stock prices",
    x = "Date", 
    y = "Percent change in price since 01/01/2019 (%)") + 
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
  )

stocks_plot_3
```

---


<div style="text-align:center"><img src="stocks2.png" alt=" " width="40%"></div>


---

We similarly slightly change the code for the animation

```R

stocks_plot_4 = ggplot(df_stocks_long2, aes(x = index, y = value, color = name, group = name)) + 
  geom_line() +
  theme_minimal() +
  geom_text(data = df_stocks_long2,
            aes(label = name),
            hjust = 0, nudge_x = 0.1) +
  coord_cartesian(clip = 'off') +
  scale_x_date(date_breaks = "4 month", date_labels = "%m/%y") +
  theme(legend.position = 'none',
        plot.margin = margin(0.1, 2.6, 0.1, 0.1, "cm"))  +
  labs(
    title = "Stock prices",
    x = "Date", 
    y = "Percent change in price since 01/01/2019 (%)") + 
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
  )
```

---

You can then create and save the animation with

```R
(stocks_plot_anim2 = stocks_plot_4 + geom_point() + transition_reveal(index))
anim_save("stocks3.gif", animation = stocks_plot_anim2)

```

---

<div style="text-align:center"><img src="stocks3.gif" alt=" " width="35%"></div>



---


Let us consider the `gapminder` dataset available in the package `dslabs` and already discussed in chapter 4. You can find a detailed description of the dataset [here](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html).


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

