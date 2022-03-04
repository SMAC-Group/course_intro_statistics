---
type: slides
output: pdf_document
---

# Testing multiple hypothesis 

---

In this lecture, we discussed the two-sample Student's t-test for testing a simple null hypothesis. Here we would show an example how to conduct such test in R and the basic idea for the test. 

Consider the setting of two independent samples follow the Gaussian distribution with the mean of \\(\mu_X\\) for \\(n\\) observations and \\(\mu_Y\\) for \\(m\\) observations respectively, and the common variance \\(\sigma^2\\). 

We assumes \\(H_0: \mu_X=\mu_Y, H_1: \mu_X > \mu_Y\\). With \\(H_0: \mu_X - \mu_Y =0\\), we would like to construct a test statistics which includes \\(\bar{X}-\bar{Y}\\). Since
\\(\bar{X}-\bar{Y}{\sim} \mathcal{N}(\mu_X - \mu_Y,\,\frac{\sigma^2}{n}+\frac{\sigma^2}{m})\\), a natural idea is to use the standardized normal distribution to determine the rejection region with the significance level \\(\alpha\\), which is \\(Z=(\bar{X}-\bar{Y})/(\sqrt{\frac{\sigma^2}{n}+\frac{\sigma^2}{m}}) > z(\alpha)\\). 

As \\(\sigma^2\\) is unknown, so we would consider to use both the \\(X_i\\)'s and \\(Y_i\\)'s to estimate \\(\sigma^2\\) by taking \\(S_p^2=\frac{1}{m+n-2}(\sum_{i=1}^{n}(X_i-\bar{X})^2)+\sum_{i=1}^{n}(Y_i-\bar{Y})^2)\\)

\\({\sim}  \sigma^2\mathcal{X}_{m+n-2}^2\\).

Hence \\(U = \frac{S_p^2}{\sigma^2}\\)
\\({\sim} \frac{1}{m+n-2}\mathcal{X}_{m+n-2}^2\\) and \\(Z=(\bar{X}-\bar{Y})/(\sqrt{\frac{\sigma^2}{n}+\frac{\sigma^2}{m}}) {\sim} {\mathcal{N}(0,1)}\\)

can construct a test statistics \\(T = \frac{Z}{U} {\sim} {\mathcal{t}_{m+n-2}}\\). 

The test has the rejection area which rejects \\(H_0\\) when  \\(T>t_{m+n-2}(\alpha)\\).

---

# Code of  two sample t-test with equal variance
Let's continue the same example in Chapter 1 where we would like to know whether the radius bone on the dominant and non-dominant side have the same mean.

```r
t.test(x=mnr$'Dominant radius', y=mnr$Radius,var.equal=TRUE)  
```
```out
Two Sample t-test

data:  mnr$`Dominant radius` and mnr$Radius
t = 0.81527, df = 48, p-value = 0.4189
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.0373593  0.0883193
sample estimates:
mean of x mean of y 
  0.84380   0.81832 
```

### result analysis

As the p-value \\(= 0.4189 > 0.05= \alpha\\), thus the null hypothesis can be accepted which we can think that the two samples have the same mean.

---

# t-test for two samples with unequal variance
In the case of unequal variance of two samples, the test statistics \\(T_{welch}=\frac{\bar{X}-\bar{Y}}{\sqrt{\frac{1}{n}S_X^2+\frac{1}{m}S_Y^2}}\\), which is close to the \\(t\\) distribution with degree of freedom that equals \\(\frac{(S_X^2/n+S_Y^2/m)^2}{(S_X^2/n)^2/(n-1)+(S_Y^2/m)^2/(m-1)}\\). 

---

# Code of two sample t-test with unequal variance
```r
t.test(x=mnr$'Dominant radius', y=mnr$Radius,var.equal=FALSE) 
```
```out
Welch Two Sample t-test

data:  mnr$`Dominant radius` and mnr$Radius
t = 0.81527, df = 47.799, p-value = 0.419
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.03736613  0.08832613
sample estimates:
mean of x mean of y 
  0.84380   0.81832 
```
## result analysis
As the p-value \\(= 0.419 > 0.05= \alpha\\), thus the null hypothesis can be accepted which we can think that the two samples have the same mean.

---

## Mann-Whitney-Wilcoxon test

The Mann-Whitney-Wilcoxon test has the same principle as the Wilcoxon signed rank test, which thinks that the empirical cumulative distribution functions of two samples are the same when sampling randomly from two populations. We can use the following code to conduct the test. 

```r
wilcox.test( x =mnr$'Dominant radius', y = mnr$Radius,exact=FALSE) 
```
```out
Wilcoxon rank sum test with continuity correction

data:  mnr$"Dominant radius" and mnr$Radius
W = 367.5, p-value = 0.2903
alternative hypothesis: true location shift is not equal to 0
```
## result analysis
From the result we can know that the p-value =0.2903 > \\(\alpha=0.05\\) which indicates the same result as these by the Welch's test and Student's test.

---

## Kruskal-Wallis test

The location test is sort of non-parametric method to test multiple hypothesis. The method of Kruskal-Wallis mixes all samples from different samples, then  we would like to illustrate it by comparing whether the three bones of dominant size have the same mean.

```r
x <- list(DR=c(mnr$'Dominant radius'), DH=c(mnr$'Dominant humerus'), DU=c(mnr$'Dominant ulna'))
kruskal.test(x)
```
```out
Kruskal-Wallis rank sum test

data:  x
Kruskal-Wallis chi-squared = 56.333, df = 2, p-value =
5.854e-13
```
## result analysis
From the result we can know that the p-value =5.854e-13 < \\(\alpha=0.05\\) which indicates an evidence against the null hypothesis that three bones of dominant size have the same mean.