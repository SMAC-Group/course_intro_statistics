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
library(idarps)
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

Scientist A claims that the p-value associated with the `smoke` variable is above 5% (with value of 6.67%), and therefore, his initial analysis is correct.


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


## Question 6: Based on these graphs, Scientist D asks for your opinion on her model:

- Such residual analysis graphs are not useful as we are considering a linear regression. They should only be used for a logistic regression.
- These graphs are not enough for us to judge if the model is a good fit to the data.
- These graphs suggests that a logistic regression should be used to analyze this data.
- The model seems appropriate as there is a good match between the model and the data.

Based on this model (`mod3`), Scientist D would like to assess the validity of the claim that smoking reduces the FEV among the youths.


## Question 7: Write the hypotheses you would use to test this claim. What is the associated p-value and what is your conclusion at the 5% significance level?

```R
summary(mod3)$coefficients[,4]["smoke"]/2
```

```out
##     smoke 
## 0.0139687
```

Scientist C thinks this model is suitable and he is interested in using `mod3` to predict the FEV of a woman of 65 years old with height 173cm who smokes regularly, and compare it to the FEV of a man of 19 years old with height 190cm who does not smoke. He obtains the following values:

```R
woman = data.frame(age = 65, sex = 1, height = 173, smoke = 1)
man = data.frame(age = 19, sex = 0, height = 190, smoke = 0)

# predicted FEV of the woman
exp(predict(mod3, woman))
```

```out
##        1 
## 11.87284
```

```R
# predicted FEV of the man
exp(predict(mod3, man))
```

```out
##        1 
## 5.482815
```

Scientist D is surprised and does not believe these predictions to be reasonable.


## Question 8: Comment on the validity of the comparison made by Scientist C and justify your answer.

Scientist A disagrees with the analysis with `mod3` as it demonstrates that smoking can statistically significantly reduce the FEV of youths. Indeed, he says that with Statistics we can never be sure and therefore, his initial argument based on the t-test is equally valid. The scientists are unable to reach an agreement and ask for your opinion.

## Question 9: Do you agree with the argument of Scientist A? Justify your answer.


</exercise>


<exercise id="2" title="Dataset 2: Snoring">

In order to better target potential customers for an anti-snoring product, a pharmaceutical company commissioned a study on the physical and behavioral characteristics of snorers. The following data were collected on a sample of 100 people:

- `sex`: gender of the person (0 for males and 1 for females).
- `age`: age in years.
- `height`: height in cm.
- `weight`: weight in kg.
- `smoke`: smoking behavior (0 for non-smokers and 1 for smokers).
- `alcohol`: number of glasses drunk per day (in red wine equivalent).
- `snore`: snoring diagnosis (0=not snoring, 1=snoring).

If you would like to load the data, you can do it as follows:

```R
# Load data 
library(idarps)
data("snoring")
head(snoring)
```

```out
##   sex age height weight smoke alcohol snore
## 1   0  49  157.6   51.1     0       0     0
## 2   1  38  161.2   76.8     0       0     0
## 3   0  40  180.0  104.5     1       5     0
## 4   1  33  177.9   64.7     1       0     0
## 5   0  58  197.0  124.8     0       0     1
## 6   0  41  167.9   81.5     1       0     0
```

You are working as a statistical consultant for this company, and you propose to consider the following model:

<div style="text-align:center"><img src="snoring_model.png" alt=" " width="100%"> </div>

which provides the following estimation results:

```R
mod1 = glm(snore ~ sex + age + height + weight + smoke + alcohol,  
           family = binomial(), data = snoring)
summary(mod1)
```

```out
## 
## Call:
## glm(formula = snore ~ sex + age + height + weight + smoke + alcohol, 
##     family = binomial(), data = snoring)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.5300  -0.8718  -0.5182   1.0411   2.2886  
## 
## Coefficients:
##              Estimate Std. Error z value Pr(>|z|)   
## (Intercept) -5.168850   3.012593  -1.716  0.08621 . 
## sex         -0.675357   0.686465  -0.984  0.32520   
## age          0.062702   0.023231   2.699  0.00695 **
## height       0.006336   0.016150   0.392  0.69483   
## weight       0.001810   0.008523   0.212  0.83181   
## smoke       -1.157345   0.557420  -2.076  0.03787 * 
## alcohol      0.228502   0.085534   2.671  0.00755 **
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 129.49  on 99  degrees of freedom
## Residual deviance: 109.38  on 93  degrees of freedom
## AIC: 123.38
## 
## Number of Fisher Scoring iterations: 4
```

## Question 1: What does this model tell you about a typical profile of a snorer? For example, is a snorer typically an old man? A young woman? Does a snorer typically smoke or drink a lot, and so on?

\\(\\)

## Question 2: Based on this model, the company wants to test if smokers are less likely to snore than non-smokers. To test this claim, what are the corresponding null and alternative hypotheses? What is the corresponding p-value and your conclusion at the 5% significance level?

Your manager thinks it is unlikely that smokers tend to snore less than non-smokers. She found several scientific papers providing the opposite conclusion (i.e. smokers tend to snore more than non-smokers). She mentions that statistical analyses are uncertain and it is possible to obtain a counterintuitive conclusion once a while.


## Question 3: Do you agree with your manager? Justify your answer.

Your colleague believes that she can explain why you obtained such a counterintuitive result. She claims that since we are only interested in the `smoke` variable, we should consider a model only with this variable. As a proof, she proposes to use the following model:

<div style="text-align:center"><img src="snoring_question3.png" alt=" " width="50%"> </div>

and shows you the following estimation results:

```R
mod2 = glm(snore ~ smoke, family = binomial(), data = snoring)
summary(mod2)
```

```out
## 
## Call:
## glm(formula = snore ~ smoke, family = binomial(), data = snoring)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.0383  -0.8657  -0.8657   1.3232   1.5252  
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)
## (Intercept)  -0.3365     0.3381  -0.995    0.320
## smoke        -0.4520     0.4324  -1.045    0.296
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 129.49  on 99  degrees of freedom
## Residual deviance: 128.40  on 98  degrees of freedom
## AIC: 132.4
## 
## Number of Fisher Scoring iterations: 4
```

This result shows that the `smoke` variable is actually not significant, and therefore, we cannot claim that smokers are less likely to snore.


## Question 4: Do you agree with the argument of your colleague? Justify your answer.

Another colleague is interested in assessing whether the weight has a statistically significant impact on the probability of snoring. For this purpose, he notices that the p-value is 83.181% for the `weight` variable in `mod1`. He believes that he proved that weight has nothing to do with the probability of snoring.


## Question 5: Do you agree with the claim of your colleague? Justify your answer.

Your manager is unhappy about the first model (i.e. `mod1`) because some features in this model do not have significant impacts on snoring. So she asks you to find a smaller model with less variables which may be more adequate. She suggests you to perform stepwise model selection using the AIC by removing variables iteratively from the initial model. Following her suggestions, you obtain the results below:

```R
empty_model = glm(snore ~ 1, family = binomial(), data = snoring)

mod_aic = step(mod1,
               scope = list(lower = formula(empty_model),
                            upper = formula(mod1)), 
               direction = "backward", trace = FALSE)
summary(mod_aic)
```

```out
## 
## Call:
## glm(formula = snore ~ age + smoke + alcohol, family = binomial(), 
##     data = snoring)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.6478  -0.8471  -0.5497   1.1155   2.1525  
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)   
## (Intercept) -4.28973    1.38111  -3.106  0.00190 **
## age          0.06526    0.02316   2.818  0.00483 **
## smoke       -1.05540    0.53074  -1.989  0.04675 * 
## alcohol      0.26204    0.08063   3.250  0.00115 **
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 129.49  on 99  degrees of freedom
## Residual deviance: 110.66  on 96  degrees of freedom
## AIC: 118.66
## 
## Number of Fisher Scoring iterations: 4
```

You compare the AIC of the three models as follows:

```R
AIC(mod1)
```

```out
## [1] 123.3799
```

```R
AIC(mod2)
```

```out
## [1] 132.401
```

```R
AIC(mod_aic)
```

```out
## [1] 118.6596
```

Given these results, your manager believes that you have found the best model (i.e. `mod_aic`) that one can possibly obtain. Indeed, this model has the smallest AIC among the models you consider and all variables have associated p-values smaller than 5%.


## Question 6: Do you agree with your manager? Justify your answer.

To further assess the validity of this model (i.e. `mod_aic`), your manager asks you to compute its in-sample and out-of-sample classification accuracy. You obtain the following results:

```R
mod_aic_predict = mod_aic$fitted.values > 0.5
in_accuracy_mod_aic = mean((snoring$snore == 1) == mod_aic_predict)
in_accuracy_mod_aic
```

```out
## [1] 0.7
```

```R
library(boot)
cost = function(resp, pred){
  mean(resp == (pred > 0.5))
}

set.seed(123) # for reproducibility
out_accuracy_mod_aic = cv.glm(snoring, mod_aic, cost, K = 10)$delta[2]
out_accuracy_mod_aic
```

```out
## [1] 0.638
```

Therefore, you obtain an in-sample classification accuracy of 0.7 and an out-of-sample classification accuracy of 0.638.

## Question 7: Your manager asks you to explain to your colleagues how to interpret these numbers? Moreover, why is it expected that the out-of-sample classification accuracy is smaller than the in-sample classification accuracy?



</exercise>