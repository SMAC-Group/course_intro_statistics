---
type: slides
---

# Getting started with ggplot2

---

## Introducing ggplot2 and the grammar of graphics

[`ggplot2`](https://ggplot2.tidyverse.org/) is a `R` package that provide a system to create graphics based on Wilkinson's [The Grammar of Graphics](https://www.springer.com/gp/book/9780387245447). 

A grammar of graphic is a framework that structure and theorize each elements that constitute a statistical graph. The advantage of considering such grammar of graphic is the ability to describe and construct a wide range of statistical plots while considering a single framework. Without considering such grammar, most graphics are just a big collection of special cases and its difficult to add new elements to existing graphs.

Considering this grammar, we can describe statistical graphs with the following elements and specify them with the corresponding functions:

- **data**: the data in itself
- **aesthetics** (specified with `aes()`): describe how variables are mapped to aesthetic attributes
- **geometric** layers (specified with `geom_()`): describe how the elements will be graphically represented
- **statistics** (specified with `stat_()`): enables to transforms and summarize data
- **coordinates systems**  (specified with `coord_()`): specifies axes and coordinates
- **themes**  (specified with `theme_()`): enables to customize graphic background, axis size, or header.

When producing graphics with `ggplot2`, you specify each of these elements sequentially, separating elements with a `+`. This enables you to easily add elements and modify plots.



---
# Building a simple plot layer by layer

General principle: In most cases you start with `ggplot()`, supply a dataset and aesthetic mapping (with `aes()`). You then add on layers (like `geom_point()` or `geom_histogram()`), scales (like `scale_colour_brewer()`), faceting specifications (like `facet_wrap()`) and coordinate systems (like `coord_flip()`). You can then modify theme elements or choose predefined themes with `theme()`.

Let us consider the dataset `world` available in the `poliscidata` package already discussed on the previous chapter. You can find a detailed description of all variables [here](https://rdrr.io/cran/poliscidata/man/world.html).
Let's first load the data and `ggplot2` : 

```r
library(ggplot2)
library(poliscidata)
data(world)
```
---
## Building a simple plot layer by layer



Imagine that we would like to represent the distribution of a single variable, say the life expectancy (`lifeex_total`). To represent the density of a single random variable, could can consider various tools, such as boxplots, histograms of violin plots. Let us start with boxplots.


```r
ggplot(data = world, aes(y = lifeex_total)) +
  geom_boxplot()
```
As you can see, we specify the data and the aesthetics mapping using the function `gglplot()`. We then add a geometric layer that specify how to represent the data (here a boxplot by specifying `geom_boxplot()`).



<div style="text-align:center"><img src="boxplot_1.png" alt=" " width="15%"></div>

We observe that the y axis label should be corrected and that the plot do not have any title. Also, the grading scale at the bottom is useless and clutter the graph. Also, we prefer to have a simpler graph theme to minimise graphical details and focus attention on the data.

---
## Building a simple plot layer by layer

We can correct these details specifying these elements with:

```R
ggplot(data = world, aes(x = "", y = lifeex_total)) +
  geom_boxplot() +
  ylab("Life expectancy") +
  ggtitle(label = "Boxplot of Litteracy rate") +
  theme_minimal()
```


<div style="text-align:center"><img src="boxplot_2.png" alt=" " width="20%"></div>

---

## Building a simple plot layer by layer

We could now consider representing the distribution of this variable when conditioned on a second variable. Let's represent the distribution of  life expectancy per world region. We can produce such a plot just by specifying a second variable in the aesthetic mapping (`aes()`). We change and specify x and y labels accordingly and obtain: 

```R
ggplot(data = world, aes(x = regionun, y = lifeex_total)) +
  geom_boxplot() +
  ylab("Life expectancy") +
  xlab("Region") +
  ggtitle(label = "Life expectancy per region") +
  theme_minimal()
``` 

<div style="text-align:center"><img src="boxplot_3.png" alt=" " width="20%"></div>


---
## Building a simple plot layer by layer II

Let us now consider a slightly more complex example. We'll consider the same dataset, but this time we will represent the relationship between GDP per capita (`gdp_10_thou`), life expectancy (`lifeex_total`) and the boolean value, being a member of the OECD or not (`oecd`). 

We can produce a simple scatter plot to represent the relationship between these two variables following the elements discussed before:


```R
ggplot(data = world, aes(x = gdp_10_thou, y = lifeex_total)) +
  geom_point() +
  ylab("Life expectancy") +
  xlab("GDP per capita 10K US$") +
  ggtitle("Life expectancy vs GDP per capita") +
  theme_minimal()
``` 

---
## Building a simple plot layer by layer II

<div style="text-align:center"><img src="scatterplot_1.png" alt=" " width="40%"></div>

---
# Building a simple plot layer by layer II

### Specifying aesthetics components

We can also specify other variables in aesthetics mapping to represent more variable. `aes` supports multiple aesthetics specifications. Find more details in the [documentation](https://ggplot2.tidyverse.org/articles/ggplot2-specs.html). Imagine that we would like to identify the world regions for each country represented and whether or not the country is part of the OECD. You can specify the following mapping with `aes()`


```R

ggplot(data = world, aes(x = gdp_10_thou, y = lifeex_total, 
                         color = regionun, shape = oecd)) +
  geom_point() +
  ylab("Life expectancy") +
  xlab("GDP per capita 10K US$") +
  ggtitle("Life expectancy vs GDP per capita") +
  theme_minimal() 

```
---

<div style="text-align:center"><img src="scatterplot_2.png" alt=" " width="40%"></div>

We note that the points size are not large enough, which prevents us to clearly identify members of the OECD. Also, the variables names in the legend are not communicative. Finally, we would like to identify Canada, India, Thailand and Switzerland.

---
## Building a simple plot layer by layer II

### Adding geometric elements

As seen in chapter 4, we can use functions from the `dplyr` package for data pre-processing (renaming and creating variables).

```R
# Creating new_name and rename region
world = world %>%
  mutate(new_name = ifelse(as.character(country) %in% c("Canada", "India", "Thailand", "Switzerland"),
                           as.character(country) ,"")) %>%
 rename("Region" = regionun)

# plot
ggplot(data = world, aes(x = gdp_10_thou, y = lifeex_total, 
                         color = Region, shape = oecd)) +
  geom_point(size = 4) +
  ylab("Life expectancy") +
  xlab("GDP per capita 10K US$") +
  ggtitle("Life expectancy vs GDP per capita") +
  geom_text(aes(label = new_name), size = 5, col ="black", nudge_x = .5, nudge_y = .5) +
  theme_minimal()

``` 


---

<div style="text-align:center"><img src="scatterplot_3.png" alt=" " width="40%"></div>


---
## Presenting esquisse


<div style="text-align:center"><img src="logo_esquisse.png" alt=" " width="35%"></div>



---
## Presenting esquisse

`esquisse` is an R add-ins that "allows you to interactively explore your data by visualizing it with the ggplot2 package. It allows you to draw bar plots, curves, scatter plots, histograms, boxplot and `sf` objects, then export the graph or retrieve the code to reproduce the graph". We suggest you to get used to `ggplot2` syntax using this tool on simple datasets.




<div style="text-align:center"><img src="esquisse.gif" alt=" " width="40%"></div>
