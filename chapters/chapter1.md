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

To install `R` on Ubuntu Linux, follow the procedure detailed [here](https://cran.r-project.org/).


## Installing `RStudio`

RStudio is an Integrated Development Environment (IDE) for R. An IDE is a software application that provides comprehensive facilities to computer programmers for software development. An IDE normally consists of at least a source code editor, build automation tools and a debugger. We will be using RStudio Desktop throughout the semester. Please install it from the [RStudio’s official webpage](https://www.rstudio.com/).


### Installing `RStudio` on macOS

To install `RStudio` on macOS, download the macOS `.dmg` installer on the [RStudio’s products page](https://www.rstudio.com/products/rstudio/download/) and execute it once downloaded.

### Installing `RStudio` on Windows

To install `RStudio` on Windows, download the Windows `.exe` installer the [RStudio’s products page](https://www.rstudio.com/products/rstudio/download/) and execute it once downloaded.

### Installing `RStudio` in Ubuntu Linux

To install `RStudio` on Ubuntu Linux, download the Ubuntu/Debian `.deb` installer the [RStudio’s products page](https://www.rstudio.com/products/rstudio/download/). You can then install the `.deb` file.

### Installing `R` package `idar` 

We have developed an `R` package for this class which is called `idar` (Introduction to Data Analytics with `R` - `idar`) and that you can install by running the following code in your R console:

```r
install.packages("devtools")
devtools::install_github("https://github.com/SMAC-Group/idar", force = TRUE)
```

To test if the package is correctly installed you can simply run

```r
library(idar)
```

If you see no error then the package is correctly installed! Below is a gif illustrating the installation of the `idar` `R` package:

<center>

![](idar.gif)

</center>

</exercise>


<exercise id="2" title="Lecture Slides">


You can view the slides directly in the browser below. To download the slides, please check [here](https://github.com/SMAC-Group/course_data_analytics/raw/master/static/Lecture1.pdf). 

<iframe src="/Lecture1.html" width="710" height="530">
</iframe>

<!--

<br>
<br>

<iframe  width="710" height="530" src="https://www.youtube.com/embed/nG5TXyyaeDs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

-->

</exercise>

<exercise id = "3" title ="Exercises">

### 1. Which of the following statements are incorrect?

<choice id="chap1_theo1">
<opt text="Every decision based on statistical methods is associated to a risk of taking the wrong decision." > Sad but true... 😟  </opt>
<opt text="Decisions based on p-values are not necessarily correct."> Sad but true... 😟 </opt>
<opt text="A scientific result based on a statistical analysis cannot be wrong." correct = "true"> It can still go wrong! </opt>
<opt text="It is only when the null hypothesis is rejected that we are sure that our decision is correct." correct = "true"> This is wrong as there are both type I and II errors.</opt>
<opt text="When the null hypothesis is rejected, our conclusion can still be incorrect."> </opt>
<opt text="A scientific result based on statistical analyses allows to further our understanding on the studied phenomenon without being able to guarantee that the conclusions are 100% correct."> </opt>
</choice>

### 2) In hypothesis testing, the type I error corresponds to:

<choice id="chap1_theo2">
<opt text="the probability of rejecting null hypothesis when null hypothesis is true."correct="true"> 👍 
</opt>
<opt text="the probability of not rejecting null hypothesis when null hypothesis is false."> No, this is the type II error. 
</opt>
<opt text="the probability of accepting the null hypothesis when alternative hypothesis is true."> No... and we can never "accept" the null hypothesis!
</opt>
</choice>

### 3)  Which of the following statement is false?

<choice id="3">
<opt text="Small p-value indicates strong evidence against the null hypothesis." >
</opt>
<opt text="When the p-value is small enough, one says that the test based on the null and alternative hypothesis is significant." >
</opt>
<opt text="When the p-value is not small enough, with the available data, we can reject the null hypothesis."correct="true"> We can only reject the null hypothesis when the p-value is smaller than a certain threshold. 
</opt>
<opt text="The obtained p-value summarizes the incompatibility between the data and the model constructed under the set of assumptions.">
</opt>
</choice>


### 4) Which of the following statement is true?
<choice id="4">
<opt text="A p-value of 1% is significant." >
</opt>
<opt text="A p-value of 5% is significant." >
</opt>
<opt text="A p-value of 8% is significant.">
</opt>
<opt text="None of the above statement is true." correct="true" > A p-value can only be considered as significant in comparison to a certain significance level. 
</opt>
</choice>


### 5) When a measurement can be thought of as the average of numerous factors, its distribution tends to go to
<choice id="4">
<opt text="A uniform distribution." >
</opt>
<opt text="A normal distribution." correct="true" >
</opt>
<opt text="We can never know.">
</opt>
<opt text="It depends on the types of numerous factors." >
</opt>
</choice>


### 6) Which of the following statement is true?
<choice id="4">
<opt text="One-sample t-test can be used as long as there is no outlier in the sample." > T-test should be used when the data have no outlier AND are approximately normally distributed. 
</opt>
<opt text="T-test states the hypothesis on the sample mean and Wilcoxon signed rank test states the hypothesis in terms of sample median." > The hypothesis statement is always with respect to a population level quantity.
</opt>
<opt text="Wilcoxon signed rank test is always better than the t-test."> The Wilcoxon signed rank test may lose some power than the t-test if the data have no outlier and are approximately normally distributed.
</opt>
<opt text="T-test is a parametric test whereas Wilcoxon signed rank test is a nonparametric test." correct="true" > 
</opt>
</choice>

</exercise>



<exercise id="4" title="Analysis of the Diet dataset">


<slides source="chapter1_diet">
</slides>
</exercise>

<exercise id="5" title="Exercises on the Diet dataset">

Previously, we saw that Diet B was effective in reducing the weights of the participants. Is it also the case for Diet A?

### 1. How to get the data?

Complete the code below to get the data for Diet A:

<codeblock id="chap1_diet_1">

The variable `posw` allows to select the diet we are interested in.

</codeblock>

### 2. How to plot the data?

Complete the code below to plot the data for Diet A:

<codeblock id="chap1_diet_2">

You can use the functions `boxplot_w_points` and `hist_compare_to_normal`.

</codeblock>

### 3. Which test should we use?

Based on the graph you produced which test appears the most appropriate to test if Diet A leads to a significant weight loss:

<choice id="chap1_diet_1">
<opt text="t-test."> The t-test doesn't appear to be an ideal choice in this case given the outliers that can be observed in the graph...</opt>
<opt text="Wilcoxon test." correct = "true" > Given the outliers that can be observed this test appears to be a suitable choice. </opt>
<opt text="other tests should be used here."> While it is true that other methods could be used here, one of the two tests above seems reasonable here. </opt>
</choice>

### 4. How to perform the test you selected?

Complete the code below to test if Diet A is effective in reducing the weights of the participants:

<codeblock id="chap1_diet_3">

Remember to we are interested in testing if the participants are losing weight, so we should use `alternative = "greater"` 

</codeblock>

### 5. What can we conclude?

Based on the test you performed and considering a type I error (i.e. "alpha") of 5%, what can you conclude:

<choice id="chap1_diet_2">
<opt text="The test shows that it is sure that Diet A significantly reduces the weight of the participants." > Sadly, we can never be sure with statistical methods... </opt>
<opt text="We don't really know..."> In some sense, this is correct... 😉  However, the statistical method you selected indicates that it is very likely that the Diet is working. </opt>
<opt text="We can reject the null hypothesis at the significance level of 5% and conclude that Diet A significantly reduces the weight of the participants." correct = "true"> Yay! 👍 </opt>
<opt text="We cannot reject the null hypothesis at the significance level of 5%."> Actually, in this case the p-value is smaller that 5% as it is 0.00101%, so we can reject the null.</opt>
</choice>

</exercise>


<exercise id="6" title="Analysis of hospital length of stay of COVID 19 patients">

</exercise>

<exercise id="7" title="Homework 1">

We consider data from Parisi, et al., (2021) which studies the applicability of predictive models for intensive care admission of COVID-19 patients in a secondary care hospital in Belgium. Indeed, this study is based on data of patients admitted to an emergency department with a positive RT-PCR SARS-CoV-2 test. For the moment, the only variable we will consider is the oxygen saturation of the patients and your goal is to conduct an analysis based on this data to answer the following questions:

1. Can we conclude that the admitted COVID 19 patients have an average oxygen saturation that can be considered low?
2. Can we conclude that the admitted COVID 19 patients have an average oxygen saturation below 93%?
3. Can we conclude that the COVID 19 patients admitted to an Intensive Care Unit (ICU) tend to have a lower oxygen saturation than the ones that are not? For example, is it reasonable to conclude that average oxygen saturation of ICU patients is lower than 92%? Similarly, is it reasonable to conclude that average oxygen saturation of non ICU patients is greater than 92%?

The data can be obtained as follows:

```r
library(idar)
data(covid)

# SpO2
spo2 = covid$spo2

# SpO2 (in ICU)
icu = covid$icu
spo2_icu = spo2[icu == 1]

# SpO2 (not in ICU)
spo2_not_icu = spo2[icu == 0]
```

</exercise>

<exercise id="8" title="Example ?????? TO DO JUN">

<slides source="chapter1_01">
</slides>

</exercise>

