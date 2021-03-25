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
getSymbols(c("AAPL", "TSLA", "GOOGL"), from = "2019-01-01")
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

<div style="text-align:center"><img src="tsla.gif" alt=" " width="40%"></div>


---

Let's now try to represent all three stocks price in a single plot an animate the resulting graph.


```R
# add other stock
library(dplyr)
library(tidyr)
aapl_price_df = fortify(AAPL) %>% clean_names()
googl_price_df = fortify(GOOGL) %>% clean_names()
baba_price_df = fortify(BABA) %>% clean_names()
df_1 = dplyr::left_join(tsl_price_df, aapl_price_df, by = "index")
df_2 = dplyr::left_join(googl_price_df, df_1, by = "index")
df_stocks = dplyr::left_join(df_2, baba_price_df, by = "index")
df_stocks = df_stocks %>% select(index, aapl_close, googl_close, baba_close, tsla_close)
head(df_stocks)
df_stocks_long = tidyr::pivot_longer(df_stocks, col = !index)
head(df_stocks_long)
```

```out
  index      name         value
  <date>     <chr>        <dbl>
1 2019-01-02 aapl_close    39.5
2 2019-01-02 googl_close 1055. 
3 2019-01-02 baba_close   137. 
4 2019-01-02 tsla_close    62.0
5 2019-01-03 aapl_close    35.5
6 2019-01-03 googl_close 1025. 
```


---

Let's plot the stock's prices

```R
library(ggplot2)
library(viridis)

stocks_plot = ggplot(df_stocks_long, aes(x = index, y = value, color= name)) +
  geom_line() +
  theme_minimal() +
  labs(
    title = "Stock prices",
    x = "Date", 
    y = "Price ($)") + 
  scale_x_date(date_breaks = "4 month", date_labels = "%m/%y") +
  scale_fill_viridis(discrete = TRUE) +
  scale_color_manual(labels = c("AAPL", "BABA", "GOOGL", "TSLA"),
                     values = RColorBrewer::brewer.pal("Dark2", n = 4))+
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0)),
        axis.title.x = element_text(margin = margin(t = 20, r = 0, b = 0, l = 0))) +
  labs(color = "Stocks")

stocks_plot
      
``` 

---


<div style="text-align:center"><img src="stock1.png" alt=" " width="40%"></div>



---


```R
(stocks_plot_anim = stocks_plot + geom_point() + transition_reveal(index))
```
  

Display with and 

```R
animate(stocks_plot, duration = 5, fps = 20, width = 200, height = 200, 
        renderer = gifski_renderer())

```

and save with
```R
anim_save("stocks.gif", animation = stocks_plot_anim)
```

---


<div style="text-align:center"><img src="stocks.gif" alt=" " width="40%"></div>


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
