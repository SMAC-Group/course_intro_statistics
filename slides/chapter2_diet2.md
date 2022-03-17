---
type: slides
---

# Comparing Diet A, B and C

---

# Getting the data

In this set of slides we will discussed the exercise presented in the last slide of the lecture slides. We will assume that we wish to assess the following claims:

1. Diet C is the most efficient in terms of average weight loss compared to the other two diets.
2. Diet A and B are comparable in terms of average weight loss.

Therefore, we hope to show that the mean of diet C is significantly higher than the means of diets A and B. Moreover, the second claim cannot be proven but we hope not reject the null hypothesis that the means of diets A and B are the same. This would imply that while we can't proven the means are the same we don't have enough evidence to conclude that they are different (which is better than nothing!).

---

We start by importing the data as presented in the lecture slides

```r
# Import data and compute weight loss
library(idar)
data(diet)
diet$weight.loss = diet$initial.weight - diet$final.weight

# Variable of interest
dietA = diet$weight.loss[diet$diet.type=="A"]
dietB = diet$weight.loss[diet$diet.type=="B"]
dietC = diet$weight.loss[diet$diet.type=="C"]

# Create data frame
dat = data.frame(response = c(dietA, dietB, dietC), 
                 groups = c(rep("A", length(dietA)), 
                            rep("B", length(dietB)), 
                            rep("C", length(dietC))))
```

---

Let's have a look at the data frame `dat`:

```r
head(dat)
```

```out
  response groups
1      3.8      A
2      6.0      A
3      0.7      A
4      2.9      A
5      2.8      A
6      2.0      A
```

---

Next, we construct boxplots to compare the empirical distribution of the three diets as follows:

```r
boxplot_w_points(dietA, dietB, dietC, xlab = "Weight loss (kg)",
                 horizontal = T)
abline(v = 0)
```

<div style="text-align:center"><img src="chap2_example_diet2_1.png" alt=" " width="60%">

---

Based on the previous graph, we decide to employ a Kruskal-Wallis test to first assess if a difference in the mean of the different groups is statistically significant. Provided that the null of this first test can rejects, we will then considers a series of Wilcoxon tests to assess the validity of the claims explained previous. However, note that in this example using Welch's one-way ANOVA combined with Welch's t-tests would also a reasonable choice.

Thus, we start by consider a Kruskal-Wallis test based on the hypotheses:

\\( H_{0}: \mu_A=\mu_B=\mu_B \\) and \\( H_{a}: H_0\\) is false. 

where \\( \mu_A \\), \\( \mu_B \\)  and \\( \mu_C \\) denote the mean weight loss for diet A, B and C, respectively. As previously, we consider \\(\alpha \\) = 0.05.

---

The p-value for this first can be computed as follows:

```r
# Kruskal Wallis
kruskal.test(response ~ groups, data = dat)
```

```out
	Kruskal-Wallis rank sum test

data:  response by groups
Kruskal-Wallis chi-squared = 9.4159, df = 2, p-value =
0.009023
```

Thus, at the 95% confidence level, we can reject the null hypothesis and accept the alternative hypothesis allowing us at least one of the means is different from the others. Consequently, we continue our analysis using Wilcoxon tests.

---

For the second step of our analysis, we consider the following hypotheses (allowing us to assess the validity of the claims originally considered):

**Test I:** \\( H_{0}: \mu_A=\mu_B \\) and \\( H_{a}: \mu_A\neq\mu_B\\).

**Test II:** \\( H_{0}: \mu_A=\mu_C \\) and \\( H_{a}: \mu_A < \mu_C\\).

**Test III:** \\( H_{0}: \mu_B=\mu_C \\) and \\( H_{a}: \mu_B < \mu_C\\).

Since we are considering three (or is it four 🤔 ?) tests we will compute a corrected \\( \alpha \\) using Dunn-Sidak correction as follows:

\\( \alpha_c = 1 - (1 - 0.05)^{1/3} \approx 1.695\%.\\)

```r
1 - (1 - 0.05)^(1/3)
```

```out
0.01695243
```

---

The p-values for the three previously mentioned tests can be obtained as follows:

```r
# Test I
wilcox.test(dietA, dietB, alternative = "two.sided")
```

```out
	Wilcoxon rank sum test with continuity correction

data:  dietA and dietB
W = 277, p-value = 0.6526
alternative hypothesis: true location shift is not equal to 0
```

```r
# Test II
wilcox.test(dietA, dietC, alternative = "two.sided")
```

```out
	Wilcoxon rank sum test with continuity correction

data:  dietA and dietC
W = 180.5, p-value = 0.006938
alternative hypothesis: true location shift is not equal to 0
```

---

```r
# Test III
wilcox.test(dietB, dietC, alternative = "less")
```

```out
	Wilcoxon rank sum test with continuity correction

data:  dietB and dietC
W = 200.5, p-value = 0.006196
alternative hypothesis: true location shift is less than 0
```

Therefore, by rejecting the null hypothesis for the both tests II and III, the first claim regarding the greater average weight loss provided by diet C compared to the other two diets is reasonable. Indeed, we can conclude, at the 95% confidence level, that the mean of diet C is significant lower than both diets A and B.  Moreover, the second claim regarding the similarities of diets A and B in terms of average weight loss is also plausible. While the equivalence can't be proven, we fail to reject the null hypothesis and therefore it is plausible that the two diet have comparable efficacy.
