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

### 1) Suppose that you want to compare the means of more than 2 groups. The variable of interest seems to be aproximately normally distributed, but you notice that its variances are different between groups. In this case, which test should you consider and why?



<choice id="1">
<opt text="You should consider the two independent sample Student's t-test because the data are approximately normally distributed."> 
</opt>
<opt text="Because you want to compare more than 2 groups, the data seem to be approximately normally distributed, and the variances between groups are different, you should consider the Welch's one-way ANOVA." correct="true">
</opt>
<opt text="You should consider the two independent sample Welch's t-test because the variances are different between groups." >
</opt>
<opt text="As you compare more than 2 groups and that the data seem to be approximately normally distributed, you should consider the Fisher one-way ANOVA." >
</opt>
</choice>

### 2) Load the package `idar` and the dataset `cortisol` with `data(cortisol)`. Consider the variable `Urine Cortisol (pg/mg)` and represent the variable graphically. Consider that you would like to test if there is evidence of a difference in the means of the variable `Urine Cortisol (pg/mg)` between the groups `C` and `NC`. Perform the adapted test given the distribution of the variable and interpret the result.


<codeblock id="02_01">
Check the distribution and the variance of the variable `Urine Cortisol (pg/mg)` to decide which test to apply.
</codeblock>


### 3) Which of the following statement is true?

<choice id="3">
<opt text="As the probability of failing to reject a null hypothesis that is actually false (type I error) increases with the number of tests, one should consider the corrected p-values that are larger than the uncorrected ones.">
</opt>
<opt text="As the probability of rejecting a null hypothesis that is actually true (type I error) increases with the number of tests, one should consider the corrected p-values that are larger than the uncorrected ones." correct="true">
</opt>
<opt text="As the probability of rejecting a null hypothesis that is actually true (type I error) increases with the number of tests, one should consider the corrected p-values that are smaller than the uncorrected ones." >
</opt>
<opt text="There is no need to correct p-values when performing multiple testing." >
</opt>
</choice>


### 4) Load the package `palmerpenguins` and the dataset `penguins` with `df = palmerpenguins::penguins`. Consider the variable `bill_length_mm` and represent the variable graphically. Use the appropriate test to check if there is evidence of difference in the location of the distributions of the variable `bill_length_mm` between species. Correct the resulting p-values with the function `p.adjust` and interpret the results.

<codeblock id="02_02">
We should first check if there is significant difference in the location of `bill_length_mm` for all species. If so, then we should test in pairs to compare the location of `bill_length_mm` between each pair of species.
</codeblock>

</exercise>

<exercise id = "3" title="Analysis of the Diet dataset - Part I">

<slides source="chapter2_diet">
</slides>

</exercise>

<exercise id="4" title="Exercises on the Diet dataset">

In the previous section, we compared diets A and B. In this section, we will consider the difference of the average weight loss between diets A and C. In particular, we are interested in testing whether diet C leads to a larger average weight loss than diet A.

### 1. How to plot the data?

Complete the code below to obtain the boxplot to compare the empirical distributions of the weight loss of the two diets:

<codeblock id="chap2_diet1">

In the function `boxplot_w_points`, you should put the names of the variables we are interested in.

</codeblock>

### 2. Which test should we use?

Based on the graph you produce, which test appears to be the most appropriate to test if diet C leads to a larger average weight loss than diet A?

<choice id="chap2_diet_1">
<opt text="Student's t-test."> The student t-test assumes that the variances of the two groups are the same. This is very hard to verify in practice and thus, it is preferable to avoid using this test.</opt>
<opt text="Welch's t-test."> This is probably a suitable choice but one can argue that outliers are present in diet A so this may not be the optimal choice. </opt>
<opt text="Wilcoxon test." correct = "true" > This is arguably the best choice for this problem. </opt>
</choice>

### 3. How to perform the test you selected?

Complete the code below to test if diet C leads to a larger average weight loss than diet A:

<codeblock id="chap2_diet2">

Remember that we are interested in testing if diet C leads to a larger weight loss than diet A, which implies that we should use `alternative = "less"` since diet A is first.

</codeblock>

### 4. What can we conclude?

Based on the test you performed and considering a significance level of 5%, we can conclude that:

<choice id="chap2_diet_2">
<opt text="We can reject the null hypothesis at the significance level of 5% and conclude that diet A leads to a larger average weight loss than diet C."> Be careful with the order of the diets used in the statement. </opt>
<opt text="We can be sure that diet C leads to a larger average weight loss than diet A." > Sadly, we can never be sure with statistical methods. </opt>
<opt text="We can reject the null hypothesis at the significance level of 5% and conclude that diet C leads to a larger average weight loss than diet A." correct = "true"> Yay! 👍 </opt>
<opt text="We cannot reject the null hypothesis at the significance level of 5%."> In this case the p-value is smaller than 5% so we can reject the null hypothesis.</opt>
</choice>

### 5. Is diet A really so bad?

A consultant who is hired by the company and promotes diet A is unhappy about your analysis as it indicates that diet C (promoted by a competing firm) is better in terms of weight loss. Thus the consultant constructs the following argument: to claim that a diet is more effective in terms of weight loss, we should have at least an average difference larger than one kg, otherwise the statistical difference is meaningless. Below we perform the test that the consultant is interested in:

<codeblock id="chap2_diet3">

Since diet A is put first, we should consider a negative difference.

</codeblock>

Based on this test, we obtain a p-value of 5.747% (which could make you think that the consultant picked one kg for a good reason...🤔). Therefore, the consultant claims that it is statistically proven that the two diets are the equally effective in terms of weights loss. What do you think of this argument?

<choice id="chap2_diet_3">
<opt text="The consultant showed that the average difference in terms of weight loss is equal to one kg, so his claim is incorrect."> Nope, we can never "accept" the null. </opt>
<opt text="The consultant is correct, there is indeed not much difference between the two diets." >  </opt>
<opt text="The claim of the consultant is incorrect for the following reasons. First, there is no good reason to compare a difference of one kg and second, we can never accept the null hypothesis!" correct = "true"> Yay! 👍 </opt>
<opt text="The consultant showed that the average difference in terms of weight loss is equal to one kg, so his claim is correct."> Nope, we can never "accept" the null. </opt>
</choice>

The competing company that promotes diet C is unhappy about the claims made by the consultant. So they hire their own consultant, who selects a difference of 950 grams. Which test should this second consultant perform:

<codeblock id="chap2_diet4">

Since diet A becomes first we should consider a negative difference.

</codeblock>

Then, the (second) consultant claims that diet C leads an average weight loss that is significantly larger by 950 grams than diet A. What do you think of this argument:

<choice id="chap2_diet_4">
<opt text="The claim is correct because the p-value is smaller than 5%."> In some sense, this answer is correct... but why did the consultant pick 950 grams? </opt>
<opt text="The claim is incorrect because we can't accept the null hypothesis."> In this case, we can reject the null. </opt>
<opt text="The claim is incorrect because the hypothesis was constructed after looking at the known results." correct = "true"> Yes, this is an example of HARKing, an acronym coined by Norbert Kerr that refers to the questionable practice of hypothesizing after the results are known. Nevertheless, this is a very common practice... </opt>
</choice>

</exercise>

<exercise id = "5" title="Exercise on the COVID-19 dataset">

<p>In this section, we revisit the data from Parisi, et al., (2021) which studies the applicability of predictive models for intensive care admission of COVID-19 patients in a secondary care hospital in Belgium. In this exercise, we wish to evaluate whether the average oxygen saturation of the patients admitted to an ICU is lower than the ones that are not. For this purpose, we will conduct a statistical analysis and our first question concerns the hypotheses we should use. Let <span class="math inline">\(\mu_{I}\)</span> and <span class="math inline">\(\mu_{N}\)</span> denote the mean oxygen saturation
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

As previously mentioned, we are interested in testing if ICU patients have lower mean of oxygen saturation (corresponding to the variable `spo2`) compared to the non-ICU patients. The variable `icu` has values of `1` (for patients that are admitted to an ICU) and `0` (for patients that are not admitted to an ICU). Using this information, please complete the code below to construct the variables of interest:

<codeblock id="chap2_covid1">

Remember that `icu` is `1` for the patients that are admitted to an ICU and `0` otherwise.

</codeblock>

Next, we wish to visualize the empirical distribution of the data in order to select a suitable test. Complete the code below to construct boxplots comparing the two groups:

<codeblock id="chap2_covid2">

Which function in the `idar` R package that allows to construct boxplots of two groups?

</codeblock>

Based on this graph, which of the following test appears to be the most suitable?

<choice id="chap2_icu2">
<opt text="Student's t-test."> The student's t-test assumes that the variances of the two groups are the same. This is very hard to verify in practice and thus, it is preferable to avoid using this test.</opt>
<opt text="Welch's t-test." > The outliers observed in this graph tend to indicate that this choice can be problematic. </opt>
<opt text="Wilcoxon test." correct = "true" > This is arguably the best choice for this problem. </opt>
</choice>

Based on the test and hypotheses you selected, complete the code below to obtain the p-value for the test of interest.

<codeblock id="chap2_covid3">

The function `wilcox.test` can be used for Wilcoxon test. 

</codeblock>

<p>Based on the p-value you obtained, what can you conclude (assuming <span class="math inline">\(\alpha = 0.05\)</span>):</p>

<choice id="chap2_icu3">
<opt text="Accept the null hypothesis."> Nope you can never accept the null!</opt>
<opt text="Reject the alternative hypothesis." > Nope you can never reject the alternative!</opt>
<opt text="Reject the null and accept the alternative hypothesis." correct = "true" > 👍 </opt>
<opt text="Fail to reject the null hypothesis." > Since the p-value is smaller than alpha, this is not correct. </opt>
</choice>

Therefore, we should conclude regarding the claim that the average oxygen saturation of the patients admitted to an ICU is lower than the ones that are not:

<choice id="chap2_icu4">
<opt text="Since we were able to accept the alternative hypothesis it is certain that the claim is correct."> Nope, we can never be sure! 😉 </opt>
<opt text="Since we were able to accept the alternative hypothesis we can't conclude anything." > It is when we fail to reject the null that we can't really conclude anything. </opt>
<opt text="Since we were able the accept the null hypothesis it is plausible that the claim is correct." > Are you sure you can accept the null? </opt>
<opt text="Since we were able to accept the alternative hypothesis it is plausible that the claim is correct." correct = "true" > 👍 </opt>
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