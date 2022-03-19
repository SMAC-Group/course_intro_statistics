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

You can view the slides directly in the browser below. To download the slides, please check
[here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture2.html#1). 

<iframe src="https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture2.html#1" width="710" height="530">
</iframe>



</exercise>


<exercise id = "2" title ="Exercises">

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

<exercise id = "3" title="Analysis of the Diet dataset - Part I">

<slides source="chapter2_diet">
</slides>

</exercise>

<exercise id="4" title="Exercise on the Diet dataset">

In the previous section, we compared diet A and B, in this exercise, we will consider the difference between diet A and C. In particular, we wish to show that diet C leads to a larger average weight loss than diet A.

### 1. How to plot the data?

Complete the code below to obtain two boxplots to compare the empirical distributions of the weight loss for the two diets:

<codeblock id="chap2_diet1">

In the function `boxplot_w_points` you should put the names of the variables we are interested in.

</codeblock>

### 2. Which test should we use?

Based on the graph you produce, which test appears the most appropriate to test if diet C leads to a larger average weight loss than diet A:

<choice id="chap2_diet_1">
<opt text="Student t-test."> The student t-test assume that the variances of the two groups are same. This is very hard to verify in practice and for this reason, it is preferable to avoid using this test.</opt>
<opt text="Welch t-test." correct = "true" > This is a probably a suitable choice but one could argue that outliers are present in diet A so this may not the optimal choice. </opt>
<opt text="Wilcoxon test." correct = "true" > This is arguably the best choice for this problem. </opt>
</choice>

### 3. How to perform the test you selected?

Complete the code below to test if diet C leads to a larger average weight loss than diet A:

<codeblock id="chap2_diet2">

Remember that we are interested in testing if diet C leads to a larger weight loss than diet A. Implying that we should use `alternative = "less"` since diet A is first.

</codeblock>

### 4. What can we conclude?

Based on the test you performed and considering a type I error (i.e. "alpha") of 5%, we can conclude that:

<choice id="chap2_diet_2">
<opt text="We can reject the null hypothesis at the significance level of 5% and conclude that diet A leads to a larger average weight loss than diet C."> It's the other way around... </opt>
<opt text="We can be sure that diet C leads to a larger average weight loss than diet A." > Sadly, we can never be sure with statistical methods... </opt>
<opt text="We can reject the null hypothesis at the significance level of 5% and conclude that diet C leads to a larger average weight loss than diet A." correct = "true"> Yay! 👍 </opt>
<opt text="We cannot reject the null hypothesis at the significance level of 5%."> Actually, in this case the p-value is smaller than 5% as it is 0.3469%, so we can reject the null hypothesis.</opt>
</choice>

### 5. Is diet A really so bad?

A consultant hired by the company promoting diet A is unhappy about your analysis which indicates that diet C (promoted by a competing firm) is better in terms of weight loss. The consultant construct the following argument, to claim that a diet is more efficient in terms of weight loss, we should have at least an average difference larger than one kg, otherwise a statistical difference is meaningless. Which test should the consultant perform:

<codeblock id="chap2_diet3">

Since diet A becomes first we should consider a negative difference.

</codeblock>

Based on this test, we obtain a p-value of 5.747% (which could make you think that the consultant picked one kg for a good reason... 🤔 ... ). Therefore, the consultant claims that it is statistically proven that the two diets are the same in terms of weights loss. What do you think of this argument:

<choice id="chap2_diet_3">
<opt text="The consultant showed that the average difference in terms of weight loss is equal to one kg, so his claim is incorrect."> Nope, we can't "accept" the null. </opt>
<opt text="The consultant is correct, there is not much difference..." >  </opt>
<opt text="The claim of the consultant is incorrect since, first, there no reason to compare a difference of one kg and, second, we can never accept the null hypothesis!" correct = "true"> Yay! 👍 </opt>
<opt text="The consultant showed that the average difference in terms of weight loss is equal to one kg, so his claim is correct."> Nope, we can't "accept" the null. </opt>
</choice>

The company promoting diet C is unhappy with the claims made by the consultant. So they hire there own consultant, which selects the a difference of 950 grams. Which test should the second consultant perform:

<codeblock id="chap2_diet4">

Since diet A becomes first we should consider a negative difference.

</codeblock>

Then, the (second) consultant claims that diet C leads an average weight loss that is significantly larger by 950 grams than diet A. What do you think of this argument:

<choice id="chap2_diet_4">
<opt text="The claim is correct because the p-value is smaller than alpha."> In some sense, this answer is correct... but why did the consultant pick 950 grams? </opt>
<opt text="The claim is incorrect because we can't accept the null hypothesis."> In this case, we can reject the null. </opt>
<opt text="The claim is incorrect because the hypothesis was constructed after looking at the results are known." correct = "true"> Yes, this is an example of HARKing is an acronym coined by  Norbert Kerr that refers to the questionable practice of hypothesizing after the results are known. Nevertheless, this is a very common practice... </opt>
</choice>

</exercise>

<exercise id = "5" title="Exercise on the COVID dataset">

<p>In this exercise, we revisit the data from Parisi, et al., (2021) which studies the applicability of predictive models for intensive care admission of COVID-19 patients in a secondary care hospital in Belgium. In this exercise, we wish to evaluate if the claim that the average oxygen saturation of the patients admitted to an ICU is lower than the ones that are not. For this purpose, we will conduct a statistical analysis and our first question concerns the hypotheses we should use. Let <span class="math inline">\(\mu_{I}\)</span> and <span class="math inline">\(\mu_{N}\)</span> denote the mean oxygen saturation
of the patients admitted to an ICU and the ones that are not admitted to an ICU, respectively. Consider the following four sets of hypotheses:</p>

<p><strong>A. </strong><span class="math inline">\(H_0\)</span>: <span
class="math inline">\(\mu_I = \mu_N\)</span>, <span
class="math inline">\(H_a\)</span>: <span class="math inline">\(\mu_I \neq \mu_N\)</span></p>

<p><strong>B. </strong><span class="math inline">\(H_0\)</span>: <span
class="math inline">\(\mu_I = \mu_N\)</span>, <span
class="math inline">\(H_a\)</span>: <span class="math inline">\(\mu_I > \mu_N\)</span></p>

<p><strong>C. </strong><span class="math inline">\(H_0\)</span>: <span
class="math inline">\(\mu_I = \mu_N\)</span>, <span
class="math inline">\(H_a\)</span>: <span class="math inline">\(\mu_I < \mu_N\)</span></p>

<p><strong>D. </strong><span class="math inline">\(H_0\)</span>: <span
class="math inline">\(\mu_I < \mu_N\)</span>, <span
class="math inline">\(H_a\)</span>: <span class="math inline">\(\mu_I = \mu_N\)</span></p>

Which hypotheses should you consider to assess the validity of the previously mentioned claim:


<choice id="chap2_icu1">
<opt text="We should use A."> No, we would use A to test if there is a difference. </opt>
<opt text="We should use B."> No, we would use B to test if the mean is higher for ICU patients compared to non-ICU patients. </opt>
<opt text="We should use C." correct = "true"> Well done! 😄  </opt>
<opt text="We should use D."> No, there is a problem with these hypotheses. </opt>
<opt text="Both C and D are correct and can used."> No, there is a problem with D. </opt>
<opt text="None of them are correct."> No, one of them seems to be OK here! </opt>
</choice>

As previously mentioned, we are interested in comparing if there is a difference in the mean of oxygen saturation of the patients (corresponding to the variable `spo2`) depending on their admission to an ICU (corresponding to the variable `icu`). The variable `icu` is divided into `1` (for patients that are admitted to an ICU) and `0` (for patients that are not admitted to an ICU) groups. Using this information, complete the code below to construct the variables of interest:

<codeblock id="chap2_covid1">

Remember that `icu` is `1` for the patients that are admitted and `0` otherwise.

</codeblock>

Next, we wish to visualize the empirical distribution of the data in order the select a suitable test. Complete the code below to construct boxplots comparing the two groups:

<codeblock id="chap2_covid2">

You can use the function `boxplot_w_points`...

</codeblock>

Based on this graph, which of the following tests appears to be the most suitable:

<choice id="chap2_icu2">
<opt text="Student t-test."> The student t-test assume that the variances of the two groups are same. This is very hard to verify in practice and for this reason, it is preferable to avoid using this test.</opt>
<opt text="Welch t-test." > The outliers that ca be observed in the previous graph tend to indicate that this choice is dangerous. </opt>
<opt text="Wilcoxon test." correct = "true" > This is arguably the best choice for this problem. </opt>
</choice>

Based on the test and hypotheses you selected, complete the code below to obtain the desired p-value:

<codeblock id="chap2_covid3">

You can use the function `wilcox.test`...

</codeblock>

<p>Based on the p-value you obtained, what should you do (assuming <span class="math inline">\(\alpha = 0.05\)</span>):</p>

<choice id="chap2_icu2">
<opt text="Accept the null hypothesis."> Nope you can never do that!</opt>
<opt text="Reject the alternative hypothesis." > Nope you can never do that!</opt>
<opt text="Reject the null and accepted the alternative hypothesis." correct = "true" > 👍 </opt>
<opt text="Fail to reject the null hypothesis." > Since the p-value is smaller than alpha, this is not correct. </opt>
</choice>

Therefore, we should conclude regarding the claim that the average oxygen saturation of the patients admitted to an ICU is lower than the ones that are not:

<choice id="chap2_icu3">
<opt text="Since we were able the accept the alternative hypothesis it is certain that the claim is correct."> Nope, we can never be sure! 😉 </opt>
<opt text="Since we were able the accept the alternative hypothesis we can't conclude anything." > It is when we fail to reject the null that we can't really conclude anything. </opt>
<opt text="Since we were able the accept the null hypothesis it is plausible that the claim is correct." > Are you sure you can accept the null? </opt>
<opt text="Since we were able the accept the alternative hypothesis it is plausible that the claim is correct." correct = "true" > 👍 </opt>
</choice>

</exercise>


<exercise id = "6" title="Analysis of the Diet dataset - Part II">

<slides source="chapter2_diet2">
</slides>

</exercise>

<exercise id = "7" title="Exercise on the Pharmacy Attendance dataset">

We consider data from a study conducted in a pharmacy in Geneva where the number of clients per hour was recorded over a period of two years. We wish to assess if it is reasonable to believe that Tuesday is busiest day of the week for this pharmacy. It is important to notice but unlike our previous example, this dataset is very large with over 17 thousands observations. This will important later on...

We start by importing the data and creating the variables of interest:

```r
# Load data
library(idar)
data("pharmacy")

# Construct attendance by day
monday = na.omit(pharmacy$attendance[pharmacy$weekday == "Monday"])
tuesday = na.omit(pharmacy$attendance[pharmacy$weekday == "Tuesday"])
wednesday = na.omit(pharmacy$attendance[pharmacy$weekday == "Wednesday"])
thursday = na.omit(pharmacy$attendance[pharmacy$weekday == "Thursday"])
friday = na.omit(pharmacy$attendance[pharmacy$weekday == "Friday"])
saturday = na.omit(pharmacy$attendance[pharmacy$weekday == "Saturday"])
sunday = na.omit(pharmacy$attendance[pharmacy$weekday == "Sunday"])
```

Since the dataset is so large the function `boxplot_w_points` is not appropriate. Indeed, if we were to use this function we would obtain the following result:

```r
boxplot_w_points(monday, tuesday, wednesday, thursday,
                 friday, saturday, sunday,
                 names = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"),
                 xlab = "Number of customers per hour",
                 horizontal = TRUE)
```

<div style="text-align:center"><img src="chap2_pharma_1.png" alt=" " width="90%"></div>

Instead we prefer in this case the default `R` function `boxplot` which can be used as follows:

```r
boxplot(monday, tuesday, wednesday, thursday,
                 friday, saturday, sunday,
                 names = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"),
                 xlab = "Number of customers per hour",
                 horizontal = TRUE)
```

<div style="text-align:center"><img src="chap2_pharma_2.png" alt=" " width="90%"></div>

It can be observed that the distributions don't appear to be symmetric rendering a nonparametric based on Kruskal-Wallis and/or Wilcoxon tests potentially inadequate as it would concern the median rather than the mean (as postulate in the claim we wish to investigate). Consequently, we opt for using Welch's t-tests. If you are curious why the assumption of having approximately normally distributed data is less important (due to the central limit theorem 😎 ) when the sample size is **large** you can have this paper 👇

<div style="text-align:center"><img src="paper.png" alt=" " width="80%"></div>

Link to the paper: [here](https://www.annualreviews.org/doi/abs/10.1146/annurev.publhealth.23.100901.140546) and the first sentence of the abstract tells you a lot: "*It is widely but incorrectly believed that the t-test and linear regression are valid only for Normally distributed outcomes.*" 

Using the test we selected, complete the code below to obtain the p-values associated the tests required to assess the validity of our claim:

<codeblock id="chapter2_pharma">

Remember that we are comparing `sunday` to all other days.

</codeblock>

Based on these p-values and consider a standard value of \\( \alpha \\) what can you conclude:

<choice id="chap2_pharma">
<opt text="The claim is correct since all p-values are smaller than alpha."> Yes... but we are considering many test here... 😕 </opt>
<opt text="The claim is correct and we are now certain that the average number of customer is higher on Sundays"> Nope, we can never be sure! </opt>
<opt text="The claim is incorrect we cannot reject the null hypothesis for all tests."> Yay! 😆 </opt>
<opt text="The claim is correct because we can reject the null hypothesis for most of tests."> Nope, the claim was that this was the case of all days. </opt>
</choice>

</exercise>



<exercise id="8" title="Homework 2">

We consider data from Abouir, et al., (2022) which is an observational study conducted at Geneva University Hospitals to assess the impact of weight on the pharmacokinetics of dexamethasone in normal-weight versus obese patients hospitalized for COVID-19. 

**Question I:** We consider the variable `cmax` (in ng/ml) which corresponds to the maximum concentration that the drug achieves in the blood after it has been administered. Regarding the variable `cmax`, we wish to assess the validity of the following claims:

1. Can we conclude that the mean of the variable `cmax` is lower in the group men than in the group women?
2. Can we conclude that the mean of the variable `cmax` is lower in the group obese than in the group non-obese?

To perform the analysis you will to construct the different groups we wish to compare and for this purpose we can use the following code:

```r
library(idar)
data(codex)

Cmax_men = codex$cmax[codex$gender == 1]
Cmax_women = codex$cmax[codex$gender == 0]
Cmax_obese = codex$cmax[codex$obese == 1]
Cmax_non_obese = codex$cmax[codex$obese == 0]
```

Then, we can compare the group and, for example, to compare the `cmax` between men and women we can use the following code:

```r
boxplot_w_points(Cmax_women, Cmax_men,
                 names = c("Women", "Men"),
                 ylab = "Cmax (ng/ml)")
```

<div style="text-align:center"><img src="HW2_boxplot.png" alt=" " width="70%"></div>

Perform a statistical analysis to assess the validity of the previously mentioned claims.

**Question II:** We now consider the variable `tmax` (in hour) which corresponds to the time it takes for the drug to reach the maximum concentration (i.e. Cmax) after its administration. Similarly, we wish to examine the following claims:

1. Can we conclude that the mean of the variable `tmax` is lower in the group men than in the group women?
2. Can we conclude that the mean of the variable `tmax` is lower in the group obese than in the group non-obese?

To perform the analysis you will to construct the different groups we wish to compare and for this purpose we can use the following code:

```r
Tmax_men = codex$tmax[codex$gender == 1]
Tmax_women = codex$tmax[codex$gender == 0]
Tmax_obese = codex$tmax[codex$obese == 1]
Tmax_non_obese = codex$tmax[codex$obese == 0]
```

Based on this group, perform a statistical analysis to assess the validity of the previously mentioned claims.

**Question III:** Finally, we consider the variable `auc` (in ng.h/ml) which corresponds to the integral (from 0 to 8 hours) of a curve that describes the variation of the drug concentration as a function of time. Similarly, we wish to examine the following claims:

1. Can we conclude that the mean of the variable `auc` is lower in the group men than in the group women?
2. Can we conclude that the mean of the variable `auc` is lower in the group obese than in the group non-obese?

Perform a statistical analysis to assess the validity of the previously mentioned claims.

</exercise>