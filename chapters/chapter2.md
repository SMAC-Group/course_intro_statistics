---
title: 'Chapter 2: Analysis of Variance 🚧🔨 (under construction)'
description:
  ''
prev: /chapter1
next: /chapter3
type: chapter
id: 2
---


<exercise id="1" title="Theory">

View the slides directly in the browser or download the slides
[here](https://github.com/SMAC-Group/course_data_analytics/raw/master/static/Lecture2.pdf). 

<iframe src="/Lecture2.html" width="710" height="530">
</iframe>



</exercise>



<exercise id="2" title="Application" type = "slides">

<slides source="chapter2_01">
</slides>


</exercise>


<exercise id = "3" title ="Analysis of Variance: Exercises">

### 1) Consider that you want to compare several means of diffferent populations (\\( >2 \\)). The distribution of the variable of interest seems to be aproximately normally distributed, but you note that the variance of the variable of interest seems to be different between groups. What test should you consider and why?



<choice id="1">
<opt text="You should consider the two independent sample Student's t-test because the data seems to be approximately normally distributed.">
</opt>
<opt text="As you compare more than 2 groups, that the data seems to be approximately normally distributed and that variance between groups seems to be different, you should consider the Welsch one-way ANOVA." correct="true">
</opt>
<opt text="You should consider the two independent sample Welsch's t-test because there is evidence that the variance is different between groups." >
</opt>
<opt text="As you compare more than 2 groups and that the data seems to be approximately normally distributed, you should consider the Fisher one-way ANOVA." >
</opt>
</choice>

### 2) Load the package `idar` and load the dataset `cortisol` (with `data(cortisol)`). Consider the variable `Urine Cortisol (pg/mg)` and represent the variable graphically. Consider that you would like to test if there is evidence of a difference in the means of the variable `Urine Cortisol (pg/mg)` between the group `C` and `NC`. Perform the adapted test given the distribution of the variable and interpret the result.


<codeblock id="02_01">
Consider the variance and the distribution of the variable `Urine Cortisol (pg/mg)` to decide which test to apply.
</codeblock>


### 3) Consider the following statements on multiple testing and on how multiple testing affects the probability of committing a type I and type II error. Select the true statement.

<choice id="3">
<opt text="As the the probability of failing to reject a null hypothesis that is actually false (type II error) increases with the number of tests, one should correct the p-values with corrected p-values larger than the uncorrected ones.">
</opt>
<opt text="As the the probability of rejecting a null hypothesis that is actually true (type I error) increases with the number of tests, one should correct the p-values with corrected p-values larger than the uncorrected ones." correct="true">
</opt>
<opt text="There is no need to correct p-values when performing multiple testing." >
</opt>
<opt text="As the the probability of rejecting a null hypothesis that is actually true (type I error) increases with the number of tests, one should correct the p-values with corrected p-values smaller than the uncorrected ones." >
</opt>
</choice>


### 4) Load the package `palmerpenguins` and load the dataset `penguins` (with `df = palmerpenguins::penguins`). Consider the variable `bill_length_mm` and represent the variable graphically. Test with the appropriate test if there are evidences of differences in the location of the distribution of the variable `bill_length_mm` between species. Consider the three pairs of species that can be composed and for each pair, test if there are evidences of differences in the means between species. Correct the resulting p-values with the function `p.adjust` and interpret the results.

<codeblock id="02_02">
Consider the variance and the distribution of the variable `Urine Cortisol (pg/mg)` to decide which test to apply.
</codeblock>






</exercise>