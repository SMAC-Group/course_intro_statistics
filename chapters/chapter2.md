---
title: 'Chapter 2: Analysis of Variance'
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

### 1) Suppose that you want to compare the means of 2 groups, in which situation is Student's t-test a good approach:

<choice id="chap2_exc1">
<opt text="We need the following: (1) it is reasonable to assume that there are no outliers and (2) for moderate and small sample sizes the sample distribution should be at least approximately normal."> Not enough! We also need that the variances are the same between groups.
</opt>
<opt text="We need the following: (1) it is reasonable to assume that there are no outliers and (2) for moderate and small sample sizes the sample distribution should be at least approximately normal. If these criteria are met then we should test if the variances are the same between groups. If we can't reject the null, then we can use Student's t-test."> Nope, even though we can't reject the null, we are still not sure if the null is correct 😉. </opt>
<opt text="We should do the following tests: (1) test if there are no outliers, (2) test if the data are normally distributed (one test per sample) and (3) test if the variances are the same. If we can't reject the null for all tests, then we should use Student's t-test."> Nope, even though we can't reject the null, we are still not sure if the null is correct 😉. </opt>
<opt text="We need the following: (1) it is reasonable to assume that there are no outliers, (2) the variances of the two groups are known to be the same (or at least it is reasonable to assume that this is the case) and (3) for moderate and small sample sizes the sample distribution should be at least approximately normal." correct="true"> Yes! 😎
</opt>
</choice>

### 2) Suppose that you want to compare the means of 2 groups, in which situation is Welsh's t-test a good approach:

<choice id="chap2_exc2">
<opt text="When it is reasonable to assume that there are no outliers."> Nope, if the sample size is small we also need the empirical distribution to be reasonably close to a normal distribution. </opt>
<opt text="When it is reasonable to assume that the sample distribution is at least approximately normal with not many outliers."> Nope, these outliers can potentially have a very large impact! </opt>
<opt text="When it is reasonable to assume that there are no outliers and the sample size is sufficiently large" correct="true"> Indeed, if the sample size is large enough, then we don't require the sample distribution to be close to a normal because of the Central Limit Theorem. </opt>
<opt text="We need the following: (1) it is reasonable to assume that there are no outliers, (2) the variances of the two groups are known to be the same (or at least it is reasonable to assume that this is the case)."> Nope, if the sample size is small we also need the empirical distribution to be reasonably close to a normal distribution. The assumption that the variances are the same is not needed.
</opt>
</choice>

### 3) Suppose that you want to compare the means of 2 groups, in which situation is Wilcoxon rank sum test inadequate:

<choice id="chap2_exc3">
<opt text="When there are no outliers."> Nope! 😆
</opt>
<opt text="When the distribution is not symmetric and the sample is large." correct="true"> Yes! Since this test concerns the median and not the mean, the result can be quite different when the distribution is not symmetric.
</opt>
<opt text="When it is reasonable to assume that there are no outliers and the sample distribution should be at least approximately normal."> Nope, it can still perform very well in this case. 
</opt>
<opt text="When it is reasonable to assume that there are no outliers and the variances are the same."> Nope, it can still perform very well in this case. </opt>
</choice>


### 4) A researcher administers many hypothesis tests as part of a research project. He finds that, of 250 tests 11 were significant at the 5% level. The researcher feels very proud of this fact and thinks that he makes a big discovery. What do you think of this situation?

<choice id="chap2_exc4">
<opt text="It is very interesting that 11 tests are significant."> Nope, because we did many tests... </opt>
<opt text="It is interesting that 11 tests are significant but since we did many tests we should find a theoretical argument for our analysis."> Finding a posteriori argument is always dangerous. ⚠️ </opt>
<opt text="One would expect 12.5 (5% of 250) significant tests even in the purely null case, merely by chance, so we should find at least 13 significant tests for the result to be interesting."> No, actually we would need a lot more... In fact, there is a probability of 48% that one would obtain 13 or more significant tests by pure luck. 🤔 </opt>
<opt text="One would expect 12.5 (5% of 250) significant tests even in the purely null case, merely by chance. So, finding only 11 significant results is actually somewhat disappointing." correct="true"> Yes! In the class notes of John Wilder Tukey (who is a famous statistician and the inventor of many statistical methods, including the boxplot!), he used this example at Princeton University in 1976 to highlight the dangers of multiple testing (and introduce the idea of higher criticism) 🤔. </opt>
</choice>

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

<exercise id = "5" title="Exercises on the COVID-19 dataset">

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

<exercise id = "7" title="Exercises on the Pharmacy Attendance dataset">

We consider data from a study conducted in a pharmacy in Geneva where the number of clients per hour was recorded over a period of two years. We wish to assess if it is reasonable to believe that Sunday is the busiest day of the week for this pharmacy. It is important to notice that unlike our previous example, this dataset is very large with over 17 thousands observations. This is an important observation as we will see later on...

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

Since the dataset is very large, the function `boxplot_w_points` is not applicable. Indeed, if we were to use this function we would obtain the following result:

```r
boxplot_w_points(monday, tuesday, wednesday, thursday,
                 friday, saturday, sunday,
                 names = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"),
                 xlab = "Number of customers per hour",
                 horizontal = TRUE)
```

<div style="text-align:center"><img src="chap2_pharma_1.png" alt=" " width="90%"></div>

So instead, in this case we prefer to use the default `R` function `boxplot` which can be used as follows:

```r
boxplot(monday, tuesday, wednesday, thursday,
                 friday, saturday, sunday,
                 names = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"),
                 xlab = "Number of customers per hour",
                 horizontal = TRUE)
```

<div style="text-align:center"><img src="chap2_pharma_2.png" alt=" " width="90%"></div>

It can be observed that the distributions don't appear to be symmetric, rendering that the nonparametric Kruskal-Wallis and/or Wilcoxon tests are potentially inadequate as they concern the median rather than the mean (as postulated in the claim we wish to investigate). Consequently, we opt for using Welch's t-tests. If you are curious why the assumption of having approximately normally distributed data is less important when the sample size is **large** (due to the central limit theorem 😎), you can have a look at this paper 👇

<div style="text-align:center"><img src="paper.png" alt=" " width="80%"></div>

The link to this paper is [here](https://www.annualreviews.org/doi/abs/10.1146/annurev.publhealth.23.100901.140546). The first sentence of the abstract already tells you a lot: "*It is widely but incorrectly believed that the t-test and linear regression are valid only for Normally distributed outcomes.*" 

Using the test we selected, complete the code below to obtain the p-values associated to the tests required to assess the validity of our claim:

<codeblock id="chapter2_pharma">

Remember that we are comparing `sunday` to all other days.

</codeblock>

Based on these p-values and consider a standard value of 5% for \\( \alpha \\), what can you conclude:

<choice id="chap2_pharma">
<opt text="The claim is correct since all p-values are smaller than alpha."> Yes... but we are considering many test here... 😕 </opt>
<opt text="The claim is correct and we are now certain that the average number of customers is higher on Sundays."> Nope, we can never be sure! </opt>
<opt text="The claim is incorrect as we fail to reject the null hypotheses for all tests."> Yay! 😆 </opt>
<opt text="The claim is correct because we can reject the null hypotheses for most tests."> Nope, our claim was that Sunday has larger average number of customers compared to all the other days. </opt>
</choice>

</exercise>



<exercise id="8" title="Homework 2">

We consider data from Abouir, et al., (2022) which is an observational study conducted at Geneva University Hospitals to assess the impact of weight on the pharmacokinetics of dexamethasone in normal-weight versus obese patients hospitalized for COVID-19. 

**Question I:** We consider the variable `cmax` (in ng/ml) which corresponds to the maximum concentration that the drug can achieve in the blood after it is administered. We wish to assess the validity of the following claims:

1. Can we conclude that the mean of the variable `cmax` is lower in the group men than in the group women?
2. Can we conclude that the mean of the variable `cmax` is lower in the group obese than in the group non-obese?

To perform the analysis we will need to construct the different groups we wish to compare. We can use the following code:

```r
library(idar)
data(codex)

Cmax_men = codex$cmax[codex$gender == 0]
Cmax_women = codex$cmax[codex$gender == 1]
Cmax_non_obese = codex$cmax[codex$obese == 0]
Cmax_obese = codex$cmax[codex$obese == 1]
```

Then we can make comparisons between groups. For example, to compare the `cmax` between men and women we can use the following code:

```r
boxplot_w_points(Cmax_women, Cmax_men,
                 names = c("Women", "Men"),
                 ylab = "Cmax (ng/ml)")
```

<div style="text-align:center"><img src="HW2_boxplot.png" alt=" " width="70%"></div>

Please perform a statistical analysis to assess the validity of the previously mentioned claims.

**Question II:** We now consider the variable `tmax` (in hour) which corresponds to the time it takes for the drug to reach the maximum concentration (i.e. Cmax) after its administration. Similarly, we wish to examine the following claims:

1. Can we conclude that the mean of the variable `tmax` is lower in the group men than in the group women?
2. Can we conclude that the mean of the variable `tmax` is lower in the group obese than in the group non-obese?

To perform the analysis we will need to construct the different groups we wish to compare. We can use the following code:

```r
Tmax_men = codex$tmax[codex$gender == 1]
Tmax_women = codex$tmax[codex$gender == 0]
Tmax_obese = codex$tmax[codex$obese == 1]
Tmax_non_obese = codex$tmax[codex$obese == 0]
```

Based on these groups, please perform a statistical analysis to assess the validity of the previously mentioned claims.


**Question III:** Finally, we consider the variable `auc` (in ng.h/ml) which corresponds to the integral (from 0 to 8 hours) of a curve that describes the variation of the drug concentration as a function of time. Similarly, we wish to examine the following claims:

1. Can we conclude that the mean of the variable `auc` is lower in the group men than in the group women?
2. Can we conclude that the mean of the variable `auc` is lower in the group obese than in the group non-obese?

Please perform a statistical analysis to assess the validity of the previously mentioned claims.

</exercise>