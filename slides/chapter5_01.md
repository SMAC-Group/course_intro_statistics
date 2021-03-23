---
type: slides
---

# Getting started

---

## Introducing ggplot2

[`ggplot2`](https://ggplot2.tidyverse.org/) is a `R` package that provide a system to create graphics based on [The Grammar of Graphics](https://www.springer.com/gp/book/9780387245447). 



In most cases you start with `ggplot()`, supply a dataset and aesthetic mapping (with `aes()`). You then add on layers (like `geom_point()` or `geom_histogram()`), scales (like `scale_colour_brewer()`), faceting specifications (like `facet_wrap()`) and coordinate systems (like `coord_flip()`).


<div style="text-align:center"><img src="ggplot2meme1.jpg" alt=" " width="20%">

---

For this example, we will consider the dataset `world` available in the `poliscidata` package. You can find a detailed description of all variables [here](https://rdrr.io/cran/poliscidata/man/world.html).

Let's first load the data: 

```r
library(poliscidata)
data(world)
dim(world)
```

```out
> dim(world)
[1] 167 103
 ```

We can observe that this dataset is composed of 167 observations of 103 variables.
