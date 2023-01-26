---
type: slides
---

# Diet Example

---

# Getting the data

In this set of slides we will replicate the `diet` data analysis presented in the lectures slides. Our first step is to download the data which are available in the `idar` `R` package. Assuming that this package is installed (if not please refer to Chapter 1), we can load the data as follows:

```r
# Import data
library(idarps) 
data(diet)
```

We can have a first look at the data using the function `head` as follows:

```r
head(diet)
```

```out
  id gender age height diet.type initial.weight final.weight
1  1 Female  22    159         A             58         54.2
2  2 Female  46    192         A             60         54.0
3  3 Female  55    170         A             64         63.3
4  4 Female  33    171         A             64         61.1
5  5 Female  50    170         A             65         62.2
6  6 Female  50    201         A             66         64.0
```

---

# Weight loss for diet B

To assess the effectiveness of diet B, we first compute the weight loss of the participants (i.e. initial weight - final weight), which can be done in `R` as follows:

```r
# Compute weight loss
diet$weight.loss = diet$initial.weight - diet$final.weight
```

For this first example, we will only study diet B so we construct our "variable of interest", say `dietB`, by only selecting this diet. This can be done in `R` as follows:

```r
# Select diet
posw = diet$diet.type=="B"

# Variable of interest
dietB = diet$weight.loss[posw]
```

---

# Plot the data

For continuous data, a common method to visualize them is the boxplot. The default `R` function for boxplot can be used as follows:

```r
boxplot(dietB, main = "Diet B", ylab = "Weight loss (kg)")
```

<div style="text-align:center"><img src="fig1_chap1_diet.png" alt=" " width="60%">

---

To have something closer to the graph presented in the lecture slides, we can use the following code instead:

```r
boxplot(dietB, main = "Diet B", xlab = "Weight loss (kg)", horizontal = TRUE)
abline(v = 0)
```

<div style="text-align:center"><img src="fig2_chap1_diet.png" alt=" " width="60%">

---

The `boxplot` function has many options which you can explore by looking at the help page dedicated to this function by running:

```r
?boxplot
```

<div style="text-align:center"><img src="fig3_chap1_diet.png" alt=" " width="60%">

---

In order to simplify the visualization of similar data in the context of the class, we propose to use the function `boxplot_w_points` in the `idar` package. The following code can be used:
 
```r
boxplot_w_points(dietB, main = "Diet B", horizontal = TRUE, xlab = "Weight loss (kg)")
abline(v = 0)
```

<div style="text-align:center"><img src="boxplot_w_point_1.png" alt=" " width="65%">

---

# Testing diet B effectiveness 

Suppose that we wish to assess how well diet B is working. One possible method is to use a t-test based on the hypotheses

\\(H_{0}: \mu=0\\) and \\(H_{a}: \mu>0\\)


```r
t.test(dietB, alternative = "greater")
```

```out
	One Sample t-test

data:  dietB
t = 6.6301, df = 24, p-value = 3.697e-07
alternative hypothesis: true mean is greater than 0
95 percent confidence interval:
 2.424694      Inf
sample estimates:
mean of x 
    3.268 
```

---

This result implies that we can reject the null hypothesis at the significance level of 5% and conclude that diet B significantly reduces the weight of the participants. Interestingly, we can also run:

```r
t.test(dietB)
```

```out
	One Sample t-test

data:  dietB
t = 6.6301, df = 24, p-value = 7.394e-07
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 2.25069 4.28531
sample estimates:
mean of x 
    3.268 
```

which shows that we can expect a mean weight loss for diet B between 2.25 Kg and 4.29 Kg (at the 95% confidence level).     

---

As previously mentioned, the t-test is valid under strict parametric assumptions (e.g. normal distribution). While there are no perfect ways to check these assumptions, we create a simple function allowing to visually assess how close some data are to a normal distribution. 

This function available in `idar` is called `hist_compare_to_normal` and allows to compare the empirical distribution of the data to its theoretical normal distribution. The theoretical distribution is also estimated in a robust fashion (which is less influenced by outliers). 

Large difference between these distributions indicates that a t-test may not be appropriate. Of course, what constitutes a "large" difference is rather subjective. 


---

This function can be used as follows:

```r
hist_compare_to_normal(dietB)
```

<div style="text-align:center"><img src="chap1_dietB_hist.png" alt=" " width="50%"></div>

This graph together with the boxplots previously constructed could be used to argue that a t-test could be a suitable option for this dataset. However, using a Wilcoxon test instead of t-test might always be a safer choice when the distribution appears symmetric (as is the case here).



---

An non-parametric alternative to the t-test is the Wilcoxon signed rank test (often simply called "Wilcoxon test") which in this case can be used as follows:

```r
wilcox.test(dietB, alternative = "greater")
```

```out
	Wilcoxon signed rank test with continuity correction

data:  dietB
V = 313, p-value = 2.71e-05
alternative hypothesis: true location is greater than 0
```

This test provides a similar conclusion to the one obtained with the t-test. We can reject the null hypothesis at the significance level of 5% and conclude that diet B significantly reduces the weight of the participants.