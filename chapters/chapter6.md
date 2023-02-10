---
title: 'Chapter 6: Practice Exam'
description:
  ''
prev: /chapter5
next: null
type: chapter
id: 6
---

<exercise id="1" title="Dataset 1: Forced Expiratory Volume">

In the late 1970s, a study was conducted in suburban Boston to investigate the relationship between forced expiratory volume and smoking behavior in 654 youths between the ages of 3 and 19. This dataset contains the following variables:

- `fev`: forced expiratory volume or FEV, which measures the amount of air a person can exhale during a forced breath.
- `age`: age in years.
- `sex`: gender (0 for males and 1 for females).
- `height`: height in cm.
- `smoke`: smoking behavior (0 for non-smokers and 1 for smokers).

If you would like to load the data, you can do it as follows:

```R
# Load data
library(idar)
data("fev")
head(fev)
``` 

```out
##     fev age sex smoke height
## 1 1.708   9   0     0 144.78
## 2 1.724   8   0     0 171.45
## 3 1.720   7   0     0 138.43
## 4 1.558   9   1     0 134.62
## 5 1.895   9   1     0 144.78
## 6 2.336   8   0     0 154.94
```

Scientist A is interested in testing whether smokers have higher FEV values than non-smokers. To start, he graphically plots the FEV values among smokers and non-smokers as follows:

```R
boxplot(fev$fev ~ fev$smoke)
```

<div style="text-align:center"><img src="boxplot_fev_smoke.png" alt=" " width="70%"> </div>


Moreover, he considers a t-test and obtains the following result:

```R
nonsmokers = fev$fev[fev$smoke == 0]
smokers = fev$fev[fev$smoke == 1]
t.test(nonsmokers, smokers, alternative = "less")
```

```out
## 
##  Welch Two Sample t-test
## 
## data:  nonsmokers and smokers
## t = -7.1496, df = 83.273, p-value = 1.537e-10
## alternative hypothesis: true difference in means is less than 0
## 95 percent confidence interval:
##        -Inf -0.5453699
## sample estimates:
## mean of x mean of y 
##  2.566143  3.276862
```

Based on this analysis, Scientist A claims that smoking significantly increases the FEV.

## Question 1: Do you see any potential problems of the approach of Scientist A? Justify your answer.


Scientist B has doubts on the approach Scientist A takes. She proposes to fit the following model instead:

<div style="text-align:center"><img src="fev_question2_model.png" alt=" " width="70%"> </div>

which provides the following estimation results:

```R
mod1 = lm(fev ~ age + height + smoke, data = fev)
summary(mod1)
```

```out
## 
## Call:
## lm(formula = fev ~ age + height + smoke, data = fev)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.50182 -0.26305 -0.01882  0.24989  1.98535 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -4.616007   0.223883 -20.618  < 2e-16 ***
## age          0.059741   0.009563   6.247 7.57e-10 ***
## height       0.042951   0.001858  23.115  < 2e-16 ***
## smoke       -0.110232   0.060017  -1.837   0.0667 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.4189 on 650 degrees of freedom
## Multiple R-squared:  0.7676, Adjusted R-squared:  0.7665 
## F-statistic: 715.7 on 3 and 650 DF,  p-value: < 2.2e-16
```

## Question 2: Does this model suggest that smoking increases the FEV as claimed by Scientist A? Justify your answer.

Scientist A claims that the p-value associated with the smoke variable is above 5% (with value of 6.67%), and therefore, his initial analysis is correct.


## Question 3: Do you think the argument of Scientist A is correct? Moreover, what is the hypothesis associated to this p-value with value of 6.67%? Is it relevant to what Scientist A claims? Justify your answer.

Scientist C thinks that the model of Scientist B can be improved. So he proposes to fit the following model:

<div style="text-align:center"><img src="fev_question3_model.png" alt=" " width="70%"> </div>

which provides the following estimation results:

```R
mod2 = lm(fev ~ age + sex + height + smoke, data = fev)
summary(mod2)
```

```out
## 
## Call:
## lm(formula = fev ~ age + sex + height + smoke, data = fev)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.37656 -0.25033  0.00894  0.25588  1.92047 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -4.456974   0.222839 -20.001  < 2e-16 ***
## age          0.065509   0.009489   6.904 1.21e-11 ***
## sex          0.157103   0.033207   4.731 2.74e-06 ***
## height       0.041023   0.001873  21.901  < 2e-16 ***
## smoke       -0.087246   0.059254  -1.472    0.141    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.4122 on 649 degrees of freedom
## Multiple R-squared:  0.7754, Adjusted R-squared:  0.774 
## F-statistic:   560 on 4 and 649 DF,  p-value: < 2.2e-16
```


He also computes the AIC of both models, which gives:

```R
AIC(mod1)
```

```out
## [1] 723.9682
```

```R
AIC(mod2)
```

```out
## [1] 703.7935
```

Scientist C claims that the model he proposed (`mod2`) is better because the \\(R^2\\) for `mod2` is 0.7754 whereas the \\(R^2\\) for `mod1` is 0.7676.


## Question 4: Do you agree with the argument used by Scientist C to justify the use of `mod2`? Provide your opinion as to which model appears to be better and justify your answer.

When considering the model diagnostic plots associated to the second model (`mod2`), Scientist C obtains the following graph:

```R
plot(fitted(mod2), resid(mod2))
```

<div style="text-align:center"><img src="fev_question4_graph.png" alt=" " width="70%"> </div>

## Question 5: Based on this graph, Scientist C asks for your opinion on his model:

- The model seems appropriate as there is a good match between the model and the data.
- The adequacy between the model and the data is quite poor, indicating that we should look for another model.
- This graph alone is not enough for us to judge if the model is a good fit to the data.
- This graph suggests that Scientist A is correct and that the t-test is more appropriate for this dataset.


Scientist D joins the discussion and she thinks that the previous model is not adequate. She proposes to consider the following model:

<div style="text-align:center"><img src="fev_question5_model.png" alt=" " width="70%"> </div>

which provides the following estimation results:

```R
mod3 = lm(log(fev) ~ age + sex + height + smoke, data = fev)
summary(mod3)
```

```out
## 
## Call:
## lm(formula = log(fev) ~ age + sex + height + smoke, data = fev)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.63278 -0.08657  0.01146  0.09540  0.40701 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -1.943998   0.078639 -24.721  < 2e-16 ***
## age          0.023387   0.003348   6.984  7.1e-12 ***
## sex          0.029319   0.011719   2.502   0.0126 *  
## height       0.016849   0.000661  25.489  < 2e-16 ***
## smoke       -0.046067   0.020910  -2.203   0.0279 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.1455 on 649 degrees of freedom
## Multiple R-squared:  0.8106, Adjusted R-squared:  0.8095 
## F-statistic: 694.6 on 4 and 649 DF,  p-value: < 2.2e-16
```

When considering the model diagnostic plots associated to this model, Scientist D obtains the following graphs:

```R
par(mfrow=c(1,2))
plot(fitted(mod3), resid(mod3))
qqnorm(resid(mod3))
qqline(resid(mod3))
```

<div style="text-align:center"><img src="fev_question5_graph.png" alt=" " width="90%"> </div>











</exercise>