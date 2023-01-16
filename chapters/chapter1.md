---
title: 'Chapter 1: A brief introduction to R'
description:
  ''
prev: null
next: /chapter2
type: chapter
id: 1
---

<exercise id="1" title="Installing R, RStudio, Rtools/Xcode and idar">

## Installing `R`

This course will make use of the `R` programming language. The `R` language is a programming language for statistical computing and graphics supported by the R Core Team and the [`R` Foundation for Statistical Computing](https://www.r-project.org/). `R` is widely used by data scientists, data miners and statisticians for data analysis and developing statistical software. 

### Installing `R` on macOS

To install `R` on macOS, download the `.pkg` installer on the [CRAN website](https://cran.r-project.org/bin/macosx/) and execute it once downloaded.

### Installing `R` on Windows

To install `R` on Windows, download the `.exe` installer on the [CRAN website](https://cran.r-project.org/bin/windows/base/) and execute it once downloaded.

### Installing `R` in Ubuntu Linux

To install `R` on Ubuntu Linux, follow the procedure detailed [here](https://cran.r-project.org/).


## Installing `RStudio`

RStudio is an Integrated Development Environment (IDE) for R. An IDE is a software application that provides comprehensive facilities to computer programmers for software development. An IDE normally consists of at least a source code editor, build automation tools and a debugger. We will be using RStudio Desktop throughout the semester. Please install it from the [RStudio’s official webpage](https://www.rstudio.com/).


### Installing `RStudio` on macOS

To install `RStudio` on macOS, download the macOS `.dmg` installer on the [RStudio’s products page](https://www.rstudio.com/products/rstudio/download/) and execute it once downloaded.

### Installing `RStudio` on Windows

To install `RStudio` on Windows, download the Windows `.exe` installer the [RStudio’s products page](https://www.rstudio.com/products/rstudio/download/) and execute it once downloaded.

### Installing `RStudio` in Ubuntu Linux

To install `RStudio` on Ubuntu Linux, download the Ubuntu/Debian `.deb` installer the [RStudio’s products page](https://www.rstudio.com/products/rstudio/download/). You can then install the `.deb` file.

## Installing `R` package `idar` 

We have developed an `R` package for this class which is called `idar` (which stands for Introduction to Data Analytics with `R`, `idar`). In order to install the `idar` package, you will have to first install the tools required to install `idar` directly from its [GitHub repository](https://github.com/SMAC-Group/idar).

To do so, you will first need to install a `C++` compiler in your installation. The steps to do so are the following:

Check your `R` version installed with:

```R
R.Version()$version.string
```

You should obtain an output similar to:

```out
[1] "R version 4.1.3 (2022-03-10)"
```

### Installing `Rtools` on Windows

If you are on Windows, go to the [R for Windows Build Tools Archive](https://cran.r-project.org/bin/windows/Rtools/history.html) and install the correct `Rtools` version depending on your `R` version by downloading the `.exe` file and executing it.


### Installing `Xcode` on macOS

If you are on macOS, go to the [Mac Apple Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12) and install the latest `Xcode` version that your installation support. 

You should then be able to install devtools by running the following command in `R`: 

```R
install.packages("devtools")
``` 

Make sure that the installation succeeded by looking at the last lines of the log. You should see something like:

```out
...
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (devtools)
```

Once this is done, you can install the `idar` package with:

```r
devtools::install_github("https://github.com/SMAC-Group/idar")
```

You should see something like:

```out
...
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (idar)
```

To test if the package is correctly installed you can simply run

```r
library(idar)
```

If you see no error, which means an output like this when the previous command is run:


```out
> library(idar)
> 
```

then the package is correctly installed! Congratulations!

Below is a gif illustrating the installation of the `idar` `R` package:

<center>

![](idar.gif)

</center>

</exercise>
