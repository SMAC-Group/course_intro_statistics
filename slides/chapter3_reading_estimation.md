---
type: slides
---

# Reading dataset

---

# Getting the data

In this set of slides, we will replicate the analysis of `reading` dataset
presented in the lectures slides. Our first step is to load the data which is available in the `idarps` R package. Assuming that this package is installed (if not, please refer to Section 1 of Chapter 1), we can load the data as follows:

```r
# Import data
library(idarps) 
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

# Comparing groups

To compare the two groups (i.e. `Control` and `Treatment`), we can start by comparing the empirical distributions using boxplots similarly to the graph presented in slide 2. For this purpose, we will construct two new variables, called `control` and `treatment`, which correspond to the scores in these groups. This can be done as follows:

```r
control = reading$score[reading$group == "Control"]
treatment = reading$score[reading$group == "Treatment"]
```

The notation `reading$score[reading$group == "Control"]` means that in the dataset called `reading`, consider the variable called `score` but only select the values where the variable `group` is equal to `Control`. 


---

# Representing the distribution of the score between groups

Using these variables we can easily represent the conditional distribution of the score as follows:

```r
boxplot_w_points(control, treatment)
```

<div style="text-align:center"><img src="control_treatment_score_reading.png" alt=" " width="70%"></div>

---

# Modelling 

As suggested in slide 9, a possible model is given by:

<div style="text-align:center"><img src="eq_mdl_1.png" alt=" " width="70%"></div>

We will refer to this model as "Model 1". The parameters of this first model can be estimated using the function `lm` as follows:

```r
mod1 = lm(score ~ group + age, data = reading)
summary(mod1)
```

---


The summary of the fitted model can then be printed with:

```out 
lm(formula = score ~ group + age, data = reading)

Residuals:
   Min     1Q Median     3Q    Max 
-9.247 -3.532  0.423  3.180 12.569 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)     -7.8639     3.3238  -2.366   0.0214 *  
groupTreatment   6.3771     1.3931   4.578  2.6e-05 ***
age              6.6457     0.3695  17.985  < 2e-16 ***

Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 4.447 on 57 degrees of freedom
Multiple R-squared:  0.8586,	Adjusted R-squared:  0.8536 
F-statistic:   173 on 2 and 57 DF,  p-value: < 2.2e-16
```

---