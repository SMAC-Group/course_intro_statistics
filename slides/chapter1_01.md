---
type: slides
---

# One Sample t-test

---

In this lecture, we discussed the one-sample Student's t-test for testing a simple null hypothesis. 

Please keep in mind the following steps to conduct t-test:
1. Define hypothesis: \\(H_0: \mu=0\\) and \\(H_a: \mu > 0\\)
2. Define \\(\alpha\\): we consider \\(\alpha=5\\)%
3. Compare p-vale and \\(\alpha\\)
4. Conclusion: if the p-value is much smaller than the significance level \\(\alpha\\), then it implies evidently that the null hypothesis should be rejected.


---

## Loading data

In this set of slides we will continue to use the `diet` data to explain how can we test our hypothesis. Our first step is to import the data in your Rstudio.

```r
# Import data
library(idar)
data(diet)
```
We can have an overview for the data using the function `names` to see which variables included in the data set.
```
names(diet)
```
```out
[1] "id"             "gender"         "age"           
[4] "height"         "diet.type"      "initial.weight"
[7] "final.weight"   
```
---

## Weight loss for all diet

```r
diet$weight.loss = diet$initial.weight - diet$final.weight
boxplot(diet$weight.loss, main = "Diet", ylab = "Weight loss (kg)")
```
<div style="text-align:center"><img src="weight_loss_1.png" alt=" " width="75%">

---

## Step 1: Define hypothesis
Here we are interested in exploring whether the weight loss follows a normal distribution with specific parameter. It is difficult to know the probability distribution from data directly, therefore we need to propose a certain probability model for the data. We can get some information from the `boxplot`, then it is reasonable to have a guess that the distribution of weight loss have the expectation within the range from 2 to 4, say 3.9. We can denote the above statement as the following hypothesis:

\\(H_0:  X_1, X_2,...,X_n \sim \mathcal{N}(3.9, \sigma^2)\\) 

Values of \\(\bar{X}\\) much larger or smaller than 3.9, provide evidence against \\(H_0\\) in favor of various alternatives \\(H_a\\).

---

## Step 2: Define \\(\alpha\\)

Recall that the if \\(X_1,...,X_n\stackrel{iid}{\sim} \mathcal{N}(\mu,\ \sigma^2), \bar{X}\stackrel{iid}{\sim} \mathcal{N}(\mu,\ \frac{\sigma^2}{n})\\). Therefore, the statistics \\(T=\frac{\bar{X_n}-\mu}{\sqrt{\sigma^2/n}}\stackrel{iid}{\sim}\mathcal{Student}(n-1)\rightarrow\stackrel{iid}{\sim}\mathcal{N}(0,1)\\)

can used to be the estimator for our null hypothesis.

For the null hypothesis \\(H_0: \mu=3.9\\) against the alternative hypothesis \\(H_a: \mu > 3.9\\), given a significance level \\(\alpha\\), say 5%, since the t-distribution is symmetric thus in this setting, the rejection region is \\(T > t_{1-\alpha/2}(n-1)\\). 

## Step 3: Compare p-value and \\(\alpha\\)

If p-value of t-test is much smaller than the significance level \\(\alpha\\), say 0.05, then the null hypothesis should be rejected.
---

# Weight loss t-test

```r
# Based on our null hypothesis, the data should have the expectation equals to 3.9. 
# Equivalently, the result of sequence of t should have the mean equals to zero.
t=diet$weight.loss-3.9 
t.test(t,alternativ = "greater")               
```                               
```out
	One Sample t-test

data:  t
t = 0.16022, df = 75, p-value = 0.4366
alternative hypothesis: true mean is greater than 0
95 percent confidence interval:
 -0.4326495        Inf
sample estimates:
 mean of x 
0.04605263 
```

---

## Step 4: Conclusion
We can see from the result that the p-value is considerably larger than the significance level 0.05. Therefore, it indicates strong evidence against \\(\mu > 3.9 \\), which means in average, the participant loses weight 3.9 kg evidently. 

---

# Normality test: histogram

Based on the previous result, the reliability of the t-test relies on the normal distribution. It is necessary to check the data from histogram or QQ plot before applying the t-test for statistical inference. We can use the function `hist_compare_to_normal` to draw the plot.
                                      
```r  
t <- diet$weight.loss
hist_compare_to_normal(t)
```

<div style="text-align:center"><img src="hist_com.png" alt=" " width="40%">

We can see from the histogram that basically, the data is distributed normally.

---

## Normality test: QQ plot

As previously mentioned, the t-test is valid under strict parametric assumptions for it is dependent the normal distribution. We could check their empirical distribution and its theoretical normal distribution by their QQ plot.

Suppose we would like the verify that whether the `weight.loss` follows the normal distribution with expectation 3.9 and variance 4. Now we could have the null hypothesis 
\\(H_0:  X_1, X_2,...,X_n \sim \mathcal{N}(3.9,4)\\).

Let \\(\max_{i=1}^{n}\mid T_{(i)}-F^{-1}(i/(n+1))\mid\\), where \\(T_{(i)}\\) is the sorted values of \\(T_i\\). 

The theoretical value \\(F^{-1}(i/(n+1))\\)
under the null hypothesis should be very close to the sorted value \\(T_{(i)}\\). 

Therefore, the two values close to the line \\(y=x\\) indicate a good fit. We could use `qqplot` to have such test.

---

## QQ plot

```r
x <- rnorm(n,3.9,2) 
y <- diet$weight.loss
qqplot(x,y)
```
<div style="text-align:center"><img src="qqplot2.png" alt=" " width="70%"> 

---

## Wilcoxon test

In the setting of samples following the normal distribution, we could use t-test to test parameters. Whereas in the case of unknowing the distribution, there is a risk in using t-test. Thus, Wilcoxon test is considered to replace t-test. Suppose we do not know whether the `weight.loss` is normal distributed, then we could use `wilcox.test` to check if \\(\mu=3.9\\).
```r
wilcox.test(t, alternative = "greater")
```
```out
	Wilcoxon signed rank test with continuity correction

data:  t
V = 1461, p-value = 0.5052
alternative hypothesis: true location is greater than 0
```
The p-value is much larger than 0.05 which indicates the same conclusion as that with t-test.

---
