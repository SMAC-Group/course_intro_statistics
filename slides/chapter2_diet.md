---
type: slides
---

# Comparing Diets A and B

---

# Getting the data

In this set of slides, we will replicate the `diet` data analysis example
presented in the lectures slides, and we will compare diets A and B. Our first step is to load the data which is available in the `idar` R package. Assuming that this package is installed (if not, please refer to Chapter 1), we can load the data as follows:

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

# Comparing weight loss for diets A and B

To compare the effectiveness of the diets, we first compute the weight loss of the participants (i.e. initial weight - final weight), which can be done in `R` as follows:

```r
# Compute weight loss
diet$weight.loss = diet$initial.weight - diet$final.weight
```

For this example, we consider diets A and B so we construct our "variables of interest", say `dietA` and `dietB`, by only selecting these diets. This can be done in `R` as follows:

```r
# Variables of interest
dietA = diet$weight.loss[diet$diet.type=="A"]
dietB = diet$weight.loss[diet$diet.type=="B"]
```

---

# Plot the data

As done previously we use the function `boxplot_w_points`:

```r
boxplot_w_points(dietA, dietB, xlab = "Weight loss (kg)", 
                               horizontal = T)
abline(v = 0)
```

<div style="text-align:center"><img src="chap2_example_diet_1.png" alt=" " width="75%">

---

Based on the previous boxplot, Welch's t-test or Wilcoxon rank sum test are both reasonable choices. For this example we will use the Welch's t-test. To compare the effectiveness of diets A and B we start by defining the hypotheses:

\\( H_{0}: \mu_A=\mu_B \\) and \\( H_{a}: \mu_A\neq\mu_B, \\)

where \\( \mu_A \\) and \\( \mu_B \\) denote the mean weight loss for diets A and B, respectively. We consider \\(\alpha \\) = 0.05 and compute the p-value as follows:

---

```r
t.test(dietA, dietB, alternative = "two.sided")
```

```out
	Welch Two Sample t-test

data:  dietA and dietB
t = 0.047594, df = 46.865, p-value = 0.9622
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -1.320692  1.384692
sample estimates:
mean of x mean of y 
    3.300     3.268 
```

Since the p-value is equal to 96.22% which is larger than 5%, we fail to reject the null hypothesis at the 95% confidence level.


