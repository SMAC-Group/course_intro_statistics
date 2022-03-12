---
title: 'Chapter 1: Introduction to Statistical Inference'
description:
  ''
prev: null
next: /chapter2
type: chapter
id: 1
---


<exercise id="1" title="Installing R and RStudio">

## Installing `R`

This course will make use of the `R` programming language. The `R` language is a programming language for statistical computing and graphics supported by the R Core Team and the [`R` Foundation for Statistical Computing](https://www.r-project.org/). `R` is widely used by data scientists, data miners and statisticians for data analysis and developing statistical software.

### Installing `R` on macOS

To install `R` on macOS, download the `.pkg` installer on the [CRAN website](https://cran.r-project.org/bin/macosx/) and execute it once downloaded.

### Installing `R` on Windows

To install `R` on Windows, download the `.exe` installer on the [CRAN website](https://cran.r-project.org/bin/windows/base/) and execute it once downloaded.

### Installing `R` in Ubuntu Linux

To install `R` on Ubuntu Linux, follow the procedure detailled [here](https://cran.r-project.org/).


## Installing `RStudio`

RStudio is an Integrated Development Environment (IDE) for R. An Integrated Development Environment is a software application that provides comprehensive facilities to computer programmers for software development. An IDE normally consists of at least a source code editor, build automation tools and a debugger. We will be using RStudio Desktop throughout the semester. Please install it by going at [RStudio’s official webpage](https://www.rstudio.com/).


### Installing `RStudio` on macOS

To install `RStudio` on macOS, download the macOS `.dmg` installer on the [RStudio’s products page](https://www.rstudio.com/products/rstudio/download/) and execute it once downloaded.

### Installing `RStudio` on Windows

To install `RStudio` on Windows, download the Windows `.exe` installer the [RStudio’s products page](https://www.rstudio.com/products/rstudio/download/) and execute it once downloaded.

### Installing `RStudio` in Ubuntu Linux

To install `RStudio` on Ubuntu Linux, download the Ubuntu/Debian `.deb` installer the [RStudio’s products page](https://www.rstudio.com/products/rstudio/download/).

Open the terminal and run

```sh
sudo dpkg -i rstudio-2022.02.0-443-amd64.deb
```


### Installing `R` package `idar` 

We have developed an `R` package for this class which is called `idar` (Introduction to Data Analytics with `R` - `idar`) and that you can install by running the following code in your R console:

```r
install.packages("devtools")
devtools::install_github("https://github.com/SMAC-Group/idar", force = TRUE)
```

To test if the package was correctly installed you cans simply run

```r
library(idar)
```

If you see no error then the package was correctly installed! Below is a gif illustrating the install of the `idar` `R` package:

<center>

![](idar.gif)

</center>

</exercise>


<exercise id="2" title="Lecture Slides">


View the slides directly in the browser or download the slides
[here](https://github.com/SMAC-Group/course_data_analytics/raw/master/static/Lecture1.pdf). 

<iframe src="/Lecture1.html" width="710" height="530">
</iframe>

<!--

<br>
<br>

<iframe  width="710" height="530" src="https://www.youtube.com/embed/nG5TXyyaeDs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

-->


</exercise>

<exercise id="3" title="Diet Example - Univariate Analysis">


<slides source="chapter1_diet">
</slides>
</exercise>

<exercise id="4" title="Exercises on the Diet dataset">

Previously, we saw that Diet B was effective in reducing the weights of the participants. Is it also the case for Diet A?

### 1. How to get the data?

Complete the code below to get the data for Diet A:

<codeblock id="chap1_diet_1">

</codeblock>

### 2. How to plot the data?

Complete the code below to plot the data for Diet A:

<codeblock id="chap1_diet_2">

</codeblock>

### 3. Which test should we use

</exercise>
