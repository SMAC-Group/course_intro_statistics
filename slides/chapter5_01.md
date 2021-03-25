---
type: slides
---

# Getting started with ggplot2

---

<div style="text-align:center"><img src="ggplot2.png" alt=" " width="50%"></div>

---

## Introduction of ggplot2 and the grammar of graphics

[`ggplot2`](https://ggplot2.tidyverse.org/) is a `R` package that provides a system to create graphics based on Wilkinson's [the Grammar of Graphics](https://www.springer.com/gp/book/9780387245447). 

The grammar of graphics is essentially a framework that conceptualizes and structures each element that constitutes a graph. This framework stipulates certain rules regarding the formation of graphs, allowing us to build a wide range of graphs in a systematic manner.

Following this grammar of graphics, we will describe different statistical graphs with the following elements as well as their corresponding functions:

- **data**: The data based on which we construct graphs.
- **aesthetics** (specified with `aes()`): This element describes how variables will be mapped to different aesthetic attributes.
- **geometric layers** (specified with `geom_()`): This element describes how variables will be represented graphically. 
- **statistics** (specified with `stat_()`): This element summarizes the key information from the data. 
- **coordinates systems** (specified with `coord_()`): This element specifies axes and coordinates. 
- **themes**  (specified with `theme_()`): This element allows to customize the theme of a graph, such as its graphic background, axis size, or header.

When constructing graphs with `ggplot2`, you can specify each of these elements sequentially and separate these elements with a `+`. This syntax allows you to easily adjust, add or remove elements when modifying the graphs.



---
# Building a simple plot by layers

When working with `ggplot2`, a general principle is to first start with `ggplot()` by supplying a dataset and specify the aesthetic mapping with `aes()`. Then you can start adding on different elements on the graph, such as layers (e.g. `geom_point()` or `geom_histogram()`), scales (e.g. `scale_colour_brewer()`), faceting specifications (e.g. `facet_wrap()`) and coordinate systems (e.g. `coord_flip()`). After adding these elements, you can then modify the theme elements or choose pre-defined themes with `theme()`.

As an illustration, let us consider the dataset `world` which is available in the `poliscidata` package. You can find a detailed description about this dataset [here](https://rdrr.io/cran/poliscidata/man/world.html). Let's first load the data and the `ggplot2` package. 

```r
library(ggplot2)
library(poliscidata)
data(world)
```
---
## Building a simple plot by layers

Suppose that we would like to represent the distribution of a single variable, say the life expectancy (`lifeex_total`). To represent the density of a single random variable, we can consider different graphs, such as boxplots, histograms or violin plots. Let's start with the boxplot, which can be constructed as follows.

```r
ggplot(data = world, aes(y = lifeex_total)) +
  geom_boxplot()
```
As you can see, we specify the data and the aesthetic mapping using the function `gglplot()`. After the set up, we can then add a geometric layer to specify how the data should be represented. In this case, we specify a boxplot by using the `geom_boxplot()` function.

---
## Building a simple plot by layers

<div style="text-align:center"><img src="boxplot_1.png" alt=" " width="40%"></div>

We can see that the y-axis label should be corrected and that the plot does not have any title. Moreover, the grading scale at the bottom is redundant with no specific meanings. In addition, we can actually have a much simpler graph theme to minimize the graphical details so that we can focus more on the data itself. So let's correct the graph!

---
## Building a simple plot by layers

We can correct the above mentioned details by specifying these elements with:

```R
ggplot(data = world, aes(x = "", y = lifeex_total)) +
  geom_boxplot() +
  ylab("Life expectancy") +
  ggtitle(label = "Boxplot of Litteracy rate") +
  theme_minimal()
```


<div style="text-align:center"><img src="boxplot_2.png" alt=" " width="30%"></div>

---

## Building a simple plot by layers

We can now try to represent the distribution of this variable conditional on a second variable. More specifically, let's represent the distribution of life expectancy per world region. We can produce such a plot just by specifying a second variable in the aesthetic mapping with `aes()`. We can also change and specify the labels for x-axis and y-axis accordingly.

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
## Building a more complex plot by layers

Let us now consider a slightly more complex example. We'll consider the same dataset, but this time we will represent the relationship between GDP per capita (`gdp_10_thou`), life expectancy (`lifeex_total`) and whether a country is a member of the OECD or not (`oecd`). 

We can produce a simple scatter plot to represent the relationship between the life expectancy and GDP per capita by following the elements discussed before:


```R
ggplot(data = world, aes(x = gdp_10_thou, y = lifeex_total)) +
  geom_point() +
  ylab("Life expectancy") +
  xlab("GDP per capita 10K US$") +
  ggtitle("Life expectancy vs GDP per capita") +
  theme_minimal()
``` 

---
## Building a more complex plot by layers

<div style="text-align:center"><img src="scatterplot_1.png" alt=" " width="60%"></div>

---
# Building a more complex plot by layers

### Specifying aesthetics components

We can also specify other variables in the aesthetic mapping to represent more variables. `aes()` supports multiple aesthetic specifications. You can find more details in the [documentation](https://ggplot2.tidyverse.org/articles/ggplot2-specs.html). Imagine that we would like to distinguish the world regions for each country considered and identify whether the country is part of the OECD or not. You can specify these elements with `aes()` as follows:


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

<div style="text-align:center"><img src="scatterplot_2.png" alt=" " width="60%"></div>

Note that the size of points is not large enough, which prevents us from clearly identifying members of the OECD. Also, the names of variables in the legend are not formalized. Finally, let's try to specifically identify the following countries: Canada, India, Thailand and Switzerland.

---
# Building a more complex plot by layers

### Adding geometric elements

As seen in Chapter 4, we can use functions from the `dplyr` package to pre-process raw data (e.g. rename and create variables).

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

<div style="text-align:center"><img src="scatterplot_3.png" alt=" " width="65%"></div>


---
# Esquisse


<div style="text-align:center"><img src="logo_esquisse.png" alt=" " width="30%"></div>

`esquisse` is an R add-ins that allows you to interactively explore your data by visualizing it with the `ggplot2` package. It allows you to draw bar plots, curves, scatter plots, histograms, boxplot and `sf` objects (find more details [here](https://r-spatial.github.io/sf/articles/sf1.html)), then to export the graph or to retrieve the code to reproduce the graph. We recommend you to get used to `ggplot2` syntax using this tool on simple datasets.



---

<div style="text-align:center"><img src="esquisse.gif" alt=" " width="60%"></div>
