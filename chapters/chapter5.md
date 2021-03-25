---
title: 'Chapter 5: Data visualization'
description:
  'Represent data and communicate information graphically.'
prev: /chapter4
next: null
type: chapter
id: 4
---



<exercise id="1" title="General information">

In this chapter we will discuss different elements regarding Data Visualization with `R`.

Once you performed a statistical analysis on a given set of data, you generally want to produce and transmits results and essential insights from you analysis with graphical means to support your claims. Creating communicative graphs that correctly represent that data can be challenging and one should be careful to avoid traps in order to represent the information as accurately as possible. 

**Data Visualization** is the field that describe how to represent information and data with graphical elements. For example, we can mention boxplots, barplots, scatterplots, lines plots, etc. These various types of graphical representation of data are interchangeably referred to as plots, graphs or charts.

`R` provides powerful tools to easily produce communicative and customizable charts. In the context of this website, we will focus on [`ggplot2`](https://ggplot2.tidyverse.org/) and its [extensions](https://exts.ggplot2.tidyverse.org/gallery/). Note that `ggplot2` is part of the  [`tidyverse`](https://www.tidyverse.org/) collection of `R` packages, such as `dplyr`and `tidyr` previously discussed. This is an advantage because it makes it easy to seamlessly combine the uses of these packages in the context of a statistical analysis. 

You can access a gallery of graphs made with `ggplot2` [here](https://www.r-graph-gallery.com/index.html) with reproducible code available.

Furthermore, we suggest you to install `ggplot2` and `esquisse` with:

```R
install.packages("ggplot2")
install.packages("esquisse")
```

There are plenty of interesting resources on Data Visualization and Data Vizualisation with `R`.

Here is non-exhaustive lists of great resources on the topic:

- [ggplot2: elegant graphics for data analysis](https://ggplot2-book.org/)

- [Fundamentals of Data Visualization](https://clauswilke.com/dataviz/)

- [Data Visualization with R](https://rkabacoff.github.io/datavis/) 

- [Storytelling with Data: A Data Visualization Guide for Business Professionals](https://www.amazon.fr/Storytelling-Data-Visualization-Business-Professionals/dp/1119002257)

</exercise>


<exercise id="2" title="Getting started" type = "slides">
<slides source="chapter5_01">
</slides>
</exercise>

<exercise id="3" title="Visualizing ammounts" type = "slides">
<slides source="chapter5_02">
</slides>
</exercise>


<exercise id="4" title="Visualizing distributions" type = "slides">
<slides source="chapter5_03">
</slides>
</exercise>


<exercise id="5" title="Visualizing many distributions" type = "slides">
<slides source="chapter5_04">
</slides>
</exercise>


<exercise id="7" title="Visualizing the relationship between numerical variables" type = "slides">
<slides source="chapter5_05">
</slides>
</exercise>

<exercise id="8" title="Visualizing time series" type = "slides">
<slides source="chapter5_05">
</slides>
</exercise>





<exercise id = "9" title ="Data visualization: Exercises">

---

### 1) Consider the dataset `world` in the `poliscidata` package. Find the description of the dataset [here](https://rdrr.io/cran/poliscidata/man/world.html). Produce a graph presenting a boxplot for the distribution of Life expectancy (`lifeex_total`) per region (`regionun`).

<div style="text-align:center">
<img src="life_exp_region.png" alt="" width="100%">
</div>

<codeblock id="05_01">

</codeblock>

