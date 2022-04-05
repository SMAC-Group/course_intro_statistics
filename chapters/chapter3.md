---
title: 'Chapter 3: Linear Regression'
description:
  ''
prev: /chapter2
next: /chapter4
type: chapter
id: 2
---


<exercise id="1" title="Lecture slides">

You can view the slides directly in the browser below. To download the slides, please check
[here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture3.html#1) for the .html version or [here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture3.pdf) for the .pdf version. 

<iframe src="https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture3.html#1" width="710" height="530">
</iframe>

</exercise>



<exercise id = "2" title ="Analysis of the Reading dataset: Estimation">

<slides source="chapter3_reading_estimation">
</slides>

</exercise>

<exercise id = "3" title ="Analysis of the Reading dataset: Prediction">

<slides source="chapter3_reading_prediction">
</slides>

</exercise>


<exercise id = "4" title ="Analysis of the Reading dataset: Model diagnostic">

<slides source="chapter3_reading_model_diagnostic">
</slides>

</exercise>

<exercise id = "5" title ="Analysis of the Reading dataset: Improving our model">

<slides source="chapter3_reading_complexify_model">
</slides>

</exercise>


<exercise id = "6" title ="Analysis of the Reading dataset: Confidence intervals for predictions">

<slides source="chapter3_reading_ci">
</slides>

</exercise>


<exercise id="7" title="Exercise: Pharmacokinetics of Indomethacin">


In this exercise, we will consider a dataset on the pharmacokinetics of indomethacin which is an anti-inflammatory drug commonly used as a prescription medication to reduce fever, pain, stiffness, and swelling from inflammation. This dataset can be downloaded as follows:

```r
data(Indometh)
```

We can have a first look at the data by using

```r
head(Indometh)
```

```out
  Subject time conc
1       1 0.25 1.50
2       1 0.50 0.94
3       1 0.75 0.78
4       1 1.00 0.48
5       1 1.25 0.37
6       1 2.00 0.19
```

Our objective is to model the concentration (i.e. plasma concentrations of indomethacin measured in mcg/ml) as a function of the times at which blood samples were drawn (in hr). In particular, we are interested in estimating the mean concentration after 1 hour. The first variable corresponds to `Indometh$conc` and the second to `Indometh$time`.

We can visualize the relationship between these two variables by creating a scatter plot with:

```r
plot(Indometh$time, Indometh$conc, xlab = "Time (hr)", ylab = "Concentration (mcg/ml)")
```

<div style="text-align:center"><img src="plot_chap_3_ex_1_1.png" alt=" " width="90%"></div>

One scientist thinks that the following model will a good approximation:

<p><span class="math display">\[\text{Concentration}_i = \beta_0 +
\beta_1 \text{Time}_i + \varepsilon_i\]</span></p>

which we can estimate as follows:

```r
mod1 = lm(conc ~ time, data = Indometh)
```

When comparing the predictions of the model with the data, he obtains the following graph using the following code:

```r
plot(Indometh$time, Indometh$conc, xlab = "Time (hr)", ylab = "Concentration (mcg/ml)")
time_to_predict = seq(from = 0.25, to = 8, length.out = 100)
data_to_predict = data.frame(time = time_to_predict)
predict_concentration = predict(mod1, data_to_predict, interval = "confidence")
lines(time_to_predict, predict_concentration[,1])
lines(time_to_predict, predict_concentration[,2], lty = 2)
lines(time_to_predict, predict_concentration[,3], lty = 2)
``` 


<div style="text-align:center"><img src="plot_chap_3_ex_1_2.png" alt=" " width="90%"></div>


Based on this graph, the scientist asks for your opinion on his model:

<choice id="chap3_exc1">
<opt text="The model seems appropriate as there is a good match between our model and the data."> No, the fit is actually quite poor as the data don't exhibit a linear relationship between the time and the concentration.
</opt>
<opt text=" I don't know!"> 😉 </opt>
<opt text="The adequacy between our model and the data is quite poor, indicating that we should look for another model." correct="true">  Yay! 😆 </opt>
<opt text="The model is not perfect but nevertheless the adequacy is reasonable between our model and the data.">  Well a model will never be perfect but here we can see that the data exhibit a nonlinear relationship while our model is linear.
</opt>
</choice>


Another scientist suggests to transform the data and he proposes to consider the following model instead:

<p><span class="math display">\[\log(\text{Concentration}_i) = \beta_0 +
\beta_1 \text{Time}_i + \varepsilon_i\]</span></p>


and therefore he refits this model as follows:

```r
# Add log concentration
Indometh$log_conc = log(Indometh$conc)

# Fit model 2
mod2 = lm(log_conc ~ time, data = Indometh)
```

When considering the model diagnostic plots associated to this model, he obtains the following results:

```r
plot(fitted(mod2), residuals(mod2), xlab = "Fitted values", ylab = "Residuals")
```

<div style="text-align:center"><img src="plot_chap_3_ex_1_3.png" alt=" " width="90%"></div>


Based on this graph, the scientist asks for your opinion on his model:

<choice id="chap3_exc2">
<opt text="This graph indicates that the model is not adequate for the data we are considering." correct="true"> Yay! 😆
</opt>
<opt text="The model suggests that there is nothing wrong."> We can see a clear "U" shape in the residuals. </opt>
<opt text="I don't know!"> 😉 </opt>

</choice>


A third scientist thinks that we should further modify our model and she proposes to consider the following model instead:

<p><span class="math display">\[\log(\text{Concentration}_i) = \beta_0 +
\beta_1 \log(\text{Time}_i) + \varepsilon_i\]</span></p>

Complete the code below to estimate the parameters of this model:

<codeblock id="chap3_ex_1_1">

Remember we want to compute the log of the variable time.

</codeblock>

Complete the code below to compare the predictions of the model with the data:

<codeblock id="chap3_ex_1_2">

</codeblock>

Based on the graph you obtain, the scientist asks for your opinion on her model:


<choice id="chap3_exc3">
<opt text="The model seems appropriate as there is a good match between the model and the data." correct="true"> 👍
</opt>
<opt text="The adequacy between the model and the data is quite poor, indicating that we should look for another model.">  Nope, this seems quite reasonable. </opt>
</choice>


Based on this model, the scientist would like to estimate the mean concentration after 1 hour. Which one of the followings is the correct answer?

<choice id="chap3_exc4">
<opt text="-1.0317"> A negative number may not make sense...
</opt>
<opt text="-0.5058">  A negative number may not make sense...
</opt>
<opt text="0.35640">  You should consider using log(1) instead of 1...
</opt>
<opt text="0.60302" correct="true">  Well done! 👍 Note that this answer is actually only an approximation due to Jensen's inequality... But this will be beyond the scope of this class. Just to be clear, the way to compute this result is with <p><span class="math inline">exp(-0.5058)</span></p>
</opt>

</choice>

Finally, the scientists notice that our data consider the same subject several times. Indeed, the first column of the dataset indicates that the data are based on 6 subjects which were all measured 11 times. Therefore, she wonders if our linear regression model is suitable for this kind of data and asks for your advice:


<choice id="chap3_exc5">
<opt text="There is no problem to have the same subject several times in our data."> Unfortunately, we assume that residuals are iid and this is not the case here 😩. Naturally, there are methods to deal with such forms of dependence but they are beyond the scope of this class.
</opt>
<opt text="It can be problematic to have the same subject several times in our data because the residuals cannot have a normal distribution in this case "> Nope, this has no impact on the distribution.
</opt>
<opt text="It can be problematic to have the same subject several times in our data because the model will not be linear">  Nope, this has no impact on the relationship between the variables.
</opt>
<opt text="It can be problematic to have the same subject several times in our data because our data won't be independent" correct="true">  Yay! 😆 Note that Mixed Linear Models were developed to answer such form of dependence in the data. However, this is beyond the scope of this class. 
</opt>
</choice>



</exercise>












<exercise id="8" title="Exercise: Pharmacokinetics of dexamethasone">

In this exercise, we will consider the data from Abouir, et al. (2022), which is an observational study conducted at Geneva University Hospitals to assess the impact of weight on the pharmacokinetics of dexamethasone in normal-weight versus obese patients hospitalized for COVID-19. The data can be loaded as follows:

```r
library(idar)
data("codex")
```

Our objective is to estimate the following model:

<p><span class="math display">\[\log (C_{\max, i}) = \beta_0 + \beta_1
\text{Gender}_i + \beta_2 \text{BMI}_i + \varepsilon_i,\]</span></p>

<p>where <span class="math inline">\(C_{\max, i}\)</span>, <span
class="math inline">\(\text{Gender}_i\)</span> and <span
class="math inline">\(\text{BMI}_i\)</span> correspond, respectively, to
the measured <span class="math inline">\(C_\max\)</span> for individual
<span class="math inline">\(i\)</span>, its gender (0 for men and 1 for
women) and its BMI. Naturally, we want to assess if this model appears
to be suitable to describe the data. Moreover, we would like to evaluate
the validity of the following claims:</p>


<p>- Women have a higher <span class="math inline">\(C_\max\)</span>
than men.</p>
<p>- Individuals with a higher BMI have a lower <span
class="math inline">\(C_\max\)</span>.</p>


Complete the code below to estimate this model:

<codeblock id="chap3_ex_2_1">
 We are interested in the log of Cmax.
</codeblock>

To assess the adequacy of our model to the data, we consider the following graph:

```r
colors = c("red", "blue")
col_index = as.numeric(codex$gender == 1) + 1
plot(codex$bmi, codex$log_cmax, col = colors[col_index],
     xlab = "BMI", ylab = "Cmax - log scale")

bmi_to_predict = 19:40
pred_men   = predict(mod, data.frame(bmi = bmi_to_predict, 
                                      gender = rep(0, length(bmi_to_predict))), 
                     interval = "confidence")
pred_women = predict(mod, data.frame(bmi = bmi_to_predict, 
                                      gender = rep(1, length(bmi_to_predict))), 
                     interval = "confidence")

lines(bmi_to_predict, pred_men[,1], col = colors[1])
lines(bmi_to_predict, pred_men[,2], col = colors[1], lty = 2)
lines(bmi_to_predict, pred_men[,3], col = colors[1], lty = 2)
lines(bmi_to_predict, pred_women[,1], col = colors[2])
lines(bmi_to_predict, pred_women[,2], col = colors[2], lty = 2)
lines(bmi_to_predict, pred_women[,3], col = colors[2], lty = 2)
legend("bottomleft", c("Men", "Women"), col = colors, pch = 1)
```

<div style="text-align:center"><img src="plot_chap_3_ex_2_1.png" alt=" " width="90%"></div>

Based on this graph, does the model appears to be suitable to describe the data?


<choice id="chap3_exc6">
<opt text="No because the relationship between the BMI and the (log of) Cmax is not linear."> A linear relationship appears to be reasonable with this dataset.
</opt>
<opt text="No because there is one outlier.">  It is true that there is an outlier (see the man with a BMI of about 31) but this value is still arguably acceptable. Naturally, a "robust" linear regression could be more appropriate in this case but these methods are beyond the scope of this class.
</opt>
<opt text="No because the data are not independent."> In this case each individual was measured once and there is no a priori reason to believe that there is any form of dependence in the data.
</opt>
<opt text="Yes, the model appears to be a reasonable approximation." correct="true">  It is not perfect but reasonable...
</opt>
</choice>

Based on this model, we obtain the following output:

```r
summary(mod)
```

```out
Call:
lm(formula = log_cmax ~ gender + bmi, data = codex)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.47722 -0.26049  0.01147  0.35029  0.76580 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  5.79742    0.47785  12.132 1.93e-12 ***
gender       0.75372    0.19354   3.894 0.000585 ***
bmi         -0.04175    0.01685  -2.477 0.019786 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.5166 on 27 degrees of freedom
Multiple R-squared:    0.4,	Adjusted R-squared:  0.3555 
F-statistic: 8.999 on 2 and 27 DF,  p-value: 0.001012
```

Consider the following four sets of hypotheses:



<p><strong>A. </strong><span class="math inline">\(H_0: \; \beta_1 &lt; 0\)</span>, <span
class="math inline">\(H_a: \; \beta_1 = 0\)</span></p>

<p><strong>B. </strong><span class="math inline">\(H_0: \; \beta_1 = 0\)</span>, <span
class="math inline">\(H_a: \; \beta_1 &gt; 0\)</span></p>

<p><strong>C. </strong><span class="math inline">\(H_0: \; \beta_1 = 0\)</span>, <span
class="math inline">\(H_a: \; \beta_1 &lt; 0\)</span></p>

<p><strong>D. </strong><span class="math inline">\(H_0: \; \beta_2 = 0\)</span>, <span
class="math inline">\(H_a: \; \beta_2 &gt; 0\)</span></p>

<p><strong>E. </strong><span class="math inline">\(H_0: \; \beta_2 = 0\)</span>, <span
class="math inline">\(H_a: \; \beta_2 &lt; 0\)</span></p>



<p>Considering the first claim (i.e. women have a higher <span
class="math inline">\(C_\max\)</span> than men), what are the hypotheses
we should consider to evaluate its validity:</p>


<choice id="chap3_exc7">
<opt text="Hypothesis A"> The alternative is (normally) what we want to prove...
</opt>
<opt text="Hypothesis B" correct="true"> Yay! 😆
</opt>
<opt text="Hypothesis C"> This would be true if the variable gender was changed to 0 for women and 1 for men.
</opt>
<opt text="Hypothesis D"> The first claim is not about the BMI. 🤔
</opt>
<opt text="Hypothesis E"> The first claim is not about the BMI. 🤔
</opt>
</choice>


Using the hypotheses you selected, what is the associated p-value?

<choice id="chap3_exc8">
<opt text="1.93e-12"> No that's the intercept.
</opt>
<opt text="0.000585"> This is not the correct alternative hypothesis. 🤔
</opt>
<opt text="0.019786">  No that's for the BMI.
</opt>
<opt text="0.0002925" correct="true"> 👍
</opt>
<opt text="0.9997075"> This is not the correct alternative hypothesis. 🤔
</opt>
<opt text="0.009893"> No that's for the BMI.
</opt>
<opt text="0.990107"> No that's for the BMI.
</opt>
</choice>


Based on this p-value what can you conclude?

<choice id="chap3_exc9">
<opt text="At the 95% confidence level, we can reject the null and accept the alternative. Therefore, women have a statistically significantly higher Cmax than men." correct="true"> 👍
</opt>
<opt text="At the 95% confidence level, we don't have enough evidence to reject the null hypothesis."> No, the p-value is smaller than alpha.
</opt>
<opt text="At the 95% confidence level, we can accept the null hypothesis."> Are you sure you can accept the null? 😏
</opt>
</choice>


Similarly, what can you conclude for the second claim?

<choice id="chap3_exc10">
<opt text="At the 95% confidence level, we can reject the null and accept the alternative. Therefore, an increase in BMI is statistically significantly associated to a decrease in Cmax." correct="true"> 👍 Just to be sure, you found a p-value of 0.009893 right?
</opt>
<opt text="At the 95% confidence level, we don't have enough evidence to reject the null hypothesis."> No, the p-value is smaller than alpha.
</opt>
<opt text="At the 95% confidence level, we can accept the null hypothesis."> Are you sure you can accept the null? 😏
</opt>
</choice>


<p>Finally, one subject (which was not included in the original study)
is measured with a <span class="math inline">\(C_\max\)</span> of 40.3.
This subject is a female of age 58 with a BMI of 28. We are suspecting
that this subject is reacting differently than the subjects in our
study. Complete the code below to compute a confidence interval
(at the 95% confidence level) for <span class="math inline">\(C_\max\)</span> of an individual having these characteristics:</p>


<codeblock id="chap3_ex_2_2">
We want to compute a prediction confidence interval.
</codeblock>


<p>Based on this code, we obtain a 95% confidence interval for the log
<span class="math inline">\(C_\max\)</span> of (4.283257, 6.48104). What
is this telling us?</p>

<choice id="chap3_exc11">
<opt text="The subject has a suspiciously high Cmax of 40.3 while our confidence intervals is (4.283257, 6.48104)."> Did you forget a log somewhere?
</opt>
<opt text="The subject has a suspiciously low Cmax of 40.3 (corresponding to a logarithm value of 3.696) as our confidence interval is (4.283257, 6.48104)." correct="true"> 👍
</opt>
<opt text="The subject has a reasonable Cmax value."> Wrong 😏
</opt>
</choice>












</exercise>









<exercise id="9" title="Homework">

We consider synthetic data based on Charepalli et al. (2018) where the impact on important biomarkers of different diets was studied. One of the experiments was conducted on pigs which were divided into two treatment groups, "C" and "NC", corresponding to two dietary compositions. The first group "C" contains 20% of deep fried potatoes (i.e. chips) while this is not the case in the group "NC" which doesn't contain any fried food. Caloric intake was measured weekly until the end of the study. The objective of our study is to evaluate the possible link existing between fried food consumption and its effects on inflammatory response. For this purpose, we will model the logarithm of the cortisol levels (in pg/mg) as a function of other variables (e.g. diet, caloric intake and so on). You can load the data as follows (make sure to update `idar`):

```r
library(idar)
data("cortisol")

# Log transform
cortisol$log_cortisol = log(cortisol$cortisol)
```







Two scientists working on this project have different (and contradicting) theories regarding the inflammatory response induced by fried food. Your objective is to model the data in a suitable way to assess the validity of their claims.

1. **Scientist A**: There is no connection between fried food consumption and cortisol levels. However, caloric intake has a significant impact on cortisol levels (i.e. the scientist believes that a higher caloric intake leads to a lower cortisol level).
2. **Scientist B**: Fried food consumption as well as caloric intake have significant impact on cortisol levels. Higher amount of fried food consumption corresponds to higher cortisol levels.


Scientist A considers the following model:

```r
mod_scientist_A = lm(log_cortisol ~ caloric, data = cortisol)
summary(mod_scientist_A)
```

```out
Call:
lm(formula = log_cortisol ~ caloric, data = cortisol)

Residuals:
    Min      1Q  Median      3Q     Max 
-1.8395 -0.5889  0.1799  0.6998  1.8756 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  8.7732375  0.5228605  16.779  < 2e-16 ***
caloric     -0.0006702  0.0001683  -3.983  0.00019 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.8741 on 59 degrees of freedom
Multiple R-squared:  0.2119,	Adjusted R-squared:  0.1985 
F-statistic: 15.86 on 1 and 59 DF,  p-value: 0.0001895
```

This scientist claims that this model verifies the claim that higher caloric intake is significantly associated to a lower cortisol level. However, the second scientist considers the following model:

```r
mod_scientist_B = lm(log_cortisol ~ caloric + group, data = cortisol)
summary(mod_scientist_B)
```

```out
Call:
lm(formula = log_cortisol ~ caloric + group, data = cortisol)

Residuals:
    Min      1Q  Median      3Q     Max 
-2.0341 -0.4551  0.2124  0.4368  1.5076 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  5.0968675  0.7986440   6.382 3.17e-08 ***
caloric      0.0010089  0.0003373   2.991  0.00407 ** 
groupNC     -2.4746749  0.4535788  -5.456 1.05e-06 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.7167 on 58 degrees of freedom
Multiple R-squared:  0.4792,	Adjusted R-squared:  0.4612 
F-statistic: 26.68 on 2 and 58 DF,  p-value: 6.082e-09
```

Scientist B thinks that this is a better model leading to different conclusions.

- For the first model:
    1. Construct a graph comparing the predictions with the data (make sure to highlight the two groups with different colors).
    2. Construct model diagnostic graphs.
    3. Compute the AIC.
- For the second model:
    1. Construct a graph comparing the predictions with the data (make sure to highlight the two groups with different colors).
    2. Construct model diagnostic graphs.
    3. Compute the AIC.
- Based on this analysis, which model should you consider and why?
- Based on the model you selected, what can you say about the claims of the scientists?
- Read the Wikipedia page on the [Simpson paradox](https://en.wikipedia.org/wiki/Simpson%27s_paradox). Explain how this paradox is related to your analysis.


</exercise>












<exercise id="10" title="Optional Homework">






</exercise>
