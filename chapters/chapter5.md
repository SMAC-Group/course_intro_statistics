---
title: 'Chapter 5: Data Visualization'
description:
  'Represent data and communicate information graphically.'
prev: /chapter4
next: null
type: chapter
id: 4
---



<exercise id="1" title="General information">

In this chapter we will discuss how to visualize data with `R`.

In general, after performing a statistical analysis on a given dataset, we will need to summarize our analysis and convert the results to provide essential insights, conclusions, or claims. In this stage of analysis, we generally use visual tools such as graphs or charts as supports. Therefore, creating visualizations that can correctly display the analysis results and highlight the crutial information from data has become one of the most important data analysis skills. 

**Data Visualization** is a general field that discusses how we can represent data analysis results and communicate information with graphical elements. These graphical elements include, for example, boxplots, barplots, scatterplots, lines plots. These various types of graphical representations are interchangeably referred to as plots, graphs or figures.

`R` provides various powerful tools to easily produce communicative and customizable graphs. In this chapter, we will focus on [`ggplot2`](https://ggplot2.tidyverse.org/) and its [extensions](https://exts.ggplot2.tidyverse.org/gallery/). Note that the `ggplot2` package is a part of the  [`tidyverse`](https://www.tidyverse.org/) collection of `R` packages, like the `dplyr`and `tidyr` packages as discussed in previous chapters. This makes the `ggplot2` package easy to use and to seamlessly combine with other packages in a statistical analysis. As an illustration, you can access a gallery of graphs made with `ggplot2` [here](https://www.r-graph-gallery.com/index.html) with reproducible code available. 

To get started, we recommend you to install both `ggplot2` and `esquisse` packages with the following commands in `R`:

```R
install.packages("ggplot2")
install.packages("esquisse")
```

For your reference, we also list some of the interesting resources regarding data visualization as follows:

- [ggplot2: Elegant Graphics for Data Analysis](https://ggplot2-book.org/)

- [Fundamentals of Data Visualization](https://clauswilke.com/dataviz/)

- [Data Visualization with R](https://rkabacoff.github.io/datavis/) 

- [Storytelling with Data: A Data Visualization Guide for Business Professionals](https://www.amazon.fr/Storytelling-Data-Visualization-Business-Professionals/dp/1119002257)

</exercise>


<exercise id="2" title="Getting started" type = "slides">
<slides source="chapter5_01">
</slides>
</exercise>

<exercise id="3" title="Visualizing amounts" type = "slides">
<slides source="chapter5_02">
</slides>
</exercise>


<exercise id="4" title="Visualizing distributions" type = "slides">
<slides source="chapter5_03">
</slides>
</exercise>


<exercise id="5" title="Visualizing multiple distributions" type = "slides">
<slides source="chapter5_04">
</slides>
</exercise>


<exercise id="6" title="Visualizing the relationship between numerical variables" type = "slides">
<slides source="chapter5_05">
</slides>
</exercise>

<exercise id="7" title="Visualizing time series" type = "slides">
<slides source="chapter5_06">
</slides>
</exercise>


<exercise id="8" title="ggplot2 extensions" type = "slides">
<slides source="chapter5_08">
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

