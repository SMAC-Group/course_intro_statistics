---
type: slides
---

# Reading dataset

---

# Getting the data

In this set of slides, we will replicate the analysis of `reading` dataset
presented in the lectures slides. Our first step is to load the data which is available in the `idar` R package. Assuming that this package is installed (if not, please refer to Section 1 of Chapter 1), we can load the data as follows:

```r
# Import data
library(idar) 
data(reading)
```

We can have a first look at the data using the function `head` as follows:

```r
head(reading)
```

```out
  id    score       age   group
1  1 59.98881 10.937378 Control
2  2 60.39487 10.261197 Control
3  3 70.02395 11.795009 Control
4  4 41.47707  6.471665 Control
5  5 29.15497  6.321822 Control
6  6 58.84009  9.449869 Control
```

---

# Plotting the data

A graph similar to the one presented in Slide 4 can be obtained as follows:

```r
plot(reading$age, reading$score)
```

<div style="text-align:center"><img src="chap3_reading1.png" alt=" " width="70%"></div>

---

To improve the graph, we start by adding better labels on "x" and "y" axes as well as a "grid" to increase readability.

```r
plot(reading$age, reading$score, xlab = "Age", ylab = "Score")
grid()
```

<div style="text-align:center"><img src="chap3_reading2.png" alt=" " width="70%"></div>

---

Next, we highlight the two groups (i.e. `Control` and `Treatment`) and add a legend as well as a title as follows:

```r
# Plot empty graph
plot(NA, xlim = range(reading$age), ylim = range(reading$score),
    xlab = "Age", ylab = "Score", main = "Reading ability assessment")
grid()

# Add control group
index = reading$group == "Control"
points(reading$age[index], reading$score[index], 
    col = "red", pch = 16)

# Add treatment group
points(reading$age[!index], reading$score[!index], 
    col = "blue", pch = 15)

# Legend
legend("bottomright", c("Control", "Treatement"),
    col = c("red", "blue"), pch = c(16, 15))
```

---

<div style="text-align:center"><img src="chap3_reading3.png" alt=" " width="70%"></div>

If you would like to have graph looking exactly like the one presented in Slide 4, then, this is more complicated... but feel free to ask us!


---

To fit a linear regression we can use the function `lm`. For example

<center>
<p><span class="math inline">\(\color{#e64173}{\text{Score}_i} = \beta_0
+ \beta_1 \color{#6A5ACD}{\text{Group}_i} + \beta_2
\color{#20B2AA}{\text{Age}_i} + \epsilon_i, \quad \epsilon_i
\overset{iid}{\sim} \mathcal{N}(0, \sigma^2)\)</span></p>
</center>

---

```r
mod1 = lm(score ~ group + age, data = reading)
summary(mod1)
```

```out
Call:
lm(formula = score ~ group + age, data = reading)

Residuals:
   Min     1Q Median     3Q    Max 
-9.247 -3.532  0.423  3.180 12.569 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)     -7.8639     3.3238  -2.366   0.0214 *  
groupTreatment   6.3771     1.3931   4.578  2.6e-05 ***
age              6.6457     0.3695  17.985  < 2e-16 ***
---
Signif. codes:  
0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 4.447 on 57 degrees of freedom
Multiple R-squared:  0.8586,	Adjusted R-squared:  0.8536 
F-statistic:   173 on 2 and 57 DF,  p-value: < 2.2e-16
```

---


```r
# Load data
library(idar)
data(reading)

# Html colors
transp_pink = "#EB078E50"
transp_purple = "#6A5ACD50"
mypink = "#EB078E"
mypurple = "#6A5ACD"

# Empty graph
par(mar=c(4,4,2,2))
plot(NA, main = "Reading ability assessment", xlab=" ", ylab=" ", 
     xlim = c(5.9, 12.1), ylim = c(30,75),cex.lab=1.5)
mtext("Age", side = 1, line = 2.5, cex = 1.25)
mtext("Score", side = 2, line = 2.5, cex = 1.25)
grid()

# Add points for control group
index = reading$group == "Control"
points(reading$age[index], reading$score[index], pch = 19, col = transp_pink, cex = 1.25)
points(reading$age[index], reading$score[index], pch = 1, col = mypink, cex = 1.25)

# Add points for treatment group
points(reading$age[!index], reading$score[!index], pch = 15, col = transp_purple, cex = 1.25)
points(reading$age[!index], reading$score[!index], pch = 0, col = mypurple, cex = 1.25)
  
# Manual legend
text(x = 10.55, y = 38, pos = 4, "Control", cex = 1.15)
text(x = 10.55, y = 35, pos = 4, "Treatement", cex = 1.15)
points(10.35, 38.3, pch = 19, col = transp_pink, cex = 1.5)
points(10.35, 38.3, pch = 1, col = mypink, cex = 1.5)
points(10.35, 35.3, pch = 15, col = transp_purple, cex = 1.5)
points(10.35, 35.3, pch = 0, col = mypurple, cex = 1.5)
```

---

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


