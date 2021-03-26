---
  type: slides
---

# ggplot2 extensions

---

There are multiple [`ggplot2` extensions](https://exts.ggplot2.tidyverse.org/) available on [CRAN](https://cran.r-project.org/). We have already used some of them in the previous sections of this chapter. In this section, we will explore more capabilities of these `ggplot2` extensions.

---

# gganimate

Besides representing multiple variables in one graph by specifying various geometric elements and aesthetic mappings, we can also consider to represent the data with an animated graph. Such a representation allows to visualize the evolvement of the data, which is very useful, for example, when we consider time series data. Animated graphs can be constructed with the help of the `gganimate` package. Note that `gganimate` relies on some dependencies that may need to be installed outside of an R environment.

<div style="text-align:center"><img src="hexgganimate.png" alt=" " width="50%"></div>

---

As an illustration, let us consider the stock prices of four companies: TSLA, AAPL BABA and GOOGL. Our goal is to visualize these four time series data in an animated graph. We can load the time series using the `quantmod` package. We will start with one time series of TSLA and convert the corresponding `xts` object to a `data.frame` using the `ggfortify` package. 


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

Let's first visualize the stock price of TSLA in a line graph. 

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

Now we want to generate an animated graph for the time series data of TSLA. An animated graph (also known as a gif) is essentially a rendered collection of images. Therefore, we can easily create an animated gif for this time series by specifying the variable that is supposed to change across each image. 

```R
library(gifski)
library(gganimate)
(tsla_price_anim = tsla_plot + geom_point() + transition_reveal(index))
```

We can display the animated gif with:

```R
animate(tsla_plot, duration = 5, fps = 20, width = 200, height = 200, 
        renderer = gifski_renderer())

```

We can also save the generated animated gif with:

```R
anim_save("tsla.gif", animation = tsla_price_anim)
```

---

<div style="text-align:center"><img src="tsla.gif" alt=" " width="35%"></div>


---

Let's now try to include the other three stocks into the previous animated gif. We first load the other three stocks, AAPL, GOOGL, and BABA, and combine all data into one dataframe. 


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

After loading the data, we can first visualize all four time series in one line graph.

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

Now we want to generate one animated gif with all four time series data. 

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

We can then create, display and save the animation similarly as before.

```R
(stocks_plot_anim = stocks_plot_2 + geom_point() + transition_reveal(index))
animate(stocks_plot, duration = 5, fps = 20, width = 200, height = 200, 
        renderer = gifski_renderer())
anim_save("stocks.gif", animation = stocks_plot_anim)
```

---


<div style="text-align:center"><img src="stocks.gif" alt=" " width="35%"></div>


---

We can further rescale the four time series by their first value, so that we can better compare their percent changes since January 1st, 2019.

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

We can then modify the code accordingly for the animation.

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

We can then again create, display and save the animation as follows:

```R
(stocks_plot_anim2 = stocks_plot_4 + geom_point() + transition_reveal(index))
anim_save("stocks3.gif", animation = stocks_plot_anim2)

```

---

<div style="text-align:center"><img src="stocks3.gif" alt=" " width="35%"></div>

