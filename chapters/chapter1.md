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



<exercise id="2" title="Basic arithmetic and logical computations">

`R` can be used for arithmetic and logical computations. `R` provides the following standard arithmetic operators:

<div style="text-align:center"><img src="arithmetic_op.png" alt=" " width="70%"> </div>

For example, if you want to compute the following expression: \\(6\times3 + \frac{3^2}{2} +2 \\), you can execute the following command:

```R
6*3 + 3^2/2 + 1
``` 

which will return, when executed:

```out
[1] 23.5
``` 

Similarly, `R` provides the following standard logical operators:

<div style="text-align:center"><img src="logical_op.png" alt=" " width="70%"> </div>

For example, if you want to compare two numbers, say \\(9\\) and \\(12\\), you could run the following code:


```R
a = 9
b = 12
a > b
a == b
a < b
```

which will return, when executed:

```
> a = 9
> b = 12
> a > b
[1] FALSE
> a == b
[1] FALSE
> a < b
[1] TRUE
```

Try the following commands on your console and be sure to understand how they operate and what they
return.

```R
a = 5
b = 10
a + b 
b - a
a * b
b / a
a^2
a == b
a != b
a > b
a < b
a %% 2
a %/% 2
d = TRUE
e = NA
d == TRUE
d == e
```

</exercise>



<exercise id="3" title="Working with vectors and matrices">


You can easily create vectors and matrices in `R` and performs vectors and/or matrices computations.

## Vectors

You can create a vector in different ways. For example, you can create a sequence from \\(0\\) to \\(12\\) by \\(1\\) with the following command:

```R
0:12
```

Similarly, you can use the function `seq()` or the function `c()`:

```
seq(0, 12, by = 1)
c(0,1,2,3,4,5,6,7,8,9,10,11,12)
```

All commands returns:

```out
 [1]  0  1  2  3  4  5  6  7  8  9 10 11 12
```

The operation of extracting a value from a `R` object is called <b>subsetting </b>. To subset a vector, you can use the `[]` operator. ⚠ Note that in `R` the index starts at 1.

For example, you can extract the fifth element from the previous sequence with the following command:

``` 
mysequence = seq(0, 12, by = 1)
mysequence[5]
```

```out
[1] 4
```

## Matrices

You can define a matrix in `R` with the function `matrix()`. For example, 

```R
matrix(seq(4), ncol=2, nrow=2)
```

create the following matrix:

```out
     [,1] [,2]
[1,]    1    3
[2,]    2    4
```

Similarly as for vectors, you can subset matrices with the `[]` operator. For example, we can subset the element of the first row and of the second column of the matrix previously defined with:

```R
mymat = matrix(seq(4), ncol=2)
mymat[1,2]
```

which returns:

```
[1] 3
```

## Operations on vectors and matrices

Once that a vector or a matrix is defined, one can then perform various vectorized operations and matrix calculations. Some simple examples include:

```R
b= c(1,2,3,4)
b * 2
``` 

returns:

```out
[1]  2  4  6  8
```

Similarly,

```R
sqrt(b)
``` 

returns:

```out
[1]  1.000000 1.414214 1.732051 2.000000
```

Alternatively,

```R
A = matrix(seq(4), ncol= 2)
C = matrix(c(5:8), ncol =2)
A %*% C
``` 
returns:

```
     [,1] [,2]
[1,]   23   31
[2,]   34   46
```

One can compute the inverse of the matrix \\(A\\) with the following command:

```
D = solve(A)
```

Therefore resulting in the identity matrix if matrix  \\(A\\) is multiplied by matrix \\(D\\)

```R
A %*% D
``` 

```out
      [,1] [,2]
[1,]    1    0
[2,]    0    1
``` 

One can also calculate the determinant or the transpose of a given matrix using respectively the following commands:

```R
det(A)
t(A)
```

</exercise>


<exercise id="4" title="Working with data.frames">
</exercise>

<exercise id="5" title="Basic data visualization">
</exercise>
