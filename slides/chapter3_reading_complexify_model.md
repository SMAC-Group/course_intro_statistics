---
type: slides
---

# Reading dataset

---

# Improving our model


We have seen in the previous section that our model didn't appear suitable for our data. In the lecture slides, we propose the following alternative model:

<div style="text-align:center"><img src="eq_mdl_3.png" alt=" " width="70%"></div>



---


The parameters of this second model can be estimated as follows:


```r
mod2 = lm(score ~ group*age, data = reading)
summary(mod2)
```

---

```out
Call:
lm(formula = score ~ group * age, data = reading)

Residuals:
    Min      1Q  Median      3Q     Max 
-8.5033 -2.3708  0.4076  2.5478 10.1024 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)         -3.2489     2.7903  -1.164    0.249    
groupTreatment     -36.0307     7.5392  -4.779 1.31e-05 ***
age                  6.1207     0.3108  19.693  < 2e-16 ***
groupTreatment:age   5.9539     1.0468   5.688 4.86e-07 ***

Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 3.572 on 56 degrees of freedom
Multiple R-squared:  0.9104,	Adjusted R-squared:  0.9056 
F-statistic: 189.6 on 3 and 56 DF,  p-value: < 2.2e-16
```
---

To assess its adequacy, we compare the predictions and data as follows:

```r
# Compute predictions
age_to_predict = 6:12
data_control   = data.frame(age = age_to_predict, 
                          group = rep("Control", length(age_to_predict)))
data_treatment = data.frame(age = age_to_predict, 
                          group = rep("Treatment", length(age_to_predict)))
prediction_control = predict(mod2, data_control)
prediction_treatment = predict(mod2, data_treatment)

# Define the colors we want to use
colors = c("blue", "red")
group_col = 1 + as.numeric(reading$group == "Treatment")
plot(reading$age, reading$score, xlab = "Age", ylab = "Score",
     col = colors[group_col])

# Add predictions
lines(age_to_predict, prediction_control, col = colors[1])
lines(age_to_predict, prediction_treatment, col = colors[2])

# Legend
legend("bottomright", c("Control", "Treatment"), pch = 1, col = colors)
```

---


<div style="text-align:center"><img src="plot_reading_9.png" alt=" " width="70%"></div>


---

Based on this graph, our second model appears to be more adequate than our first model. We can also compare the AIC of these two models as follows:


```r
AIC(mod1)
AIC(mod2)
```

```out
[1] 354.2688
[1] 328.9095
```

---
This approach also suggests that the second model is more adequate. Similarly to what we did previously, we can construct the model diagnostic graphs as follows:

```r
colors = c("blue", "red")
group_col = 1 + as.numeric(reading$group == "Treatment")
plot(fitted(mod2), resid(mod2), xlab = "Fitted values", 
     ylab = "Residuals", col = colors[group_col])
```



<div style="text-align:center"><img src="plot_reading_10.png" alt=" " width="70%"></div>



---


<div style="text-align:center"><img src="plot_reading_11.png" alt=" " width="70%"></div>

---

Both graphs suggest that the model is a reasonable approximation for the data we considering. However, in the lecture slides we consider a third model which is given by:

<div style="text-align:center"><img src="eq_mdl_4.png" alt=" " width="70%"></div>


---
To consider this model we first need to construct the variable "Age - 6", which can be done as follows:

```r
age_minus_6 = reading$age - 6
```

Then we can "add" this variable to our data:

```r 
reading$age_minus_6 = age_minus_6
```

---
Then, the parameters of this third model can be estimated as follows:

```r
mod3 = lm(score ~ age_minus_6 + group:age_minus_6, data = reading)
summary(mod3)
```

---

```out
Call:
lm(formula = score ~ age_minus_6 + group:age_minus_6, data = reading)

Residuals:
    Min      1Q  Median      3Q     Max 
-8.5095 -2.4182  0.4826  2.6312 10.0853 

Coefficients:
                           Estimate Std. Error t value Pr(>|t|)    
(Intercept)                 33.3504     0.7904  42.192  < 2e-16 ***
age_minus_6                  6.1522     0.2604  23.625  < 2e-16 ***
age_minus_6:groupTreatment   5.8103     0.7157   8.119 4.37e-11 ***

Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 3.542 on 57 degrees of freedom
Multiple R-squared:  0.9103,	Adjusted R-squared:  0.9072 
F-statistic: 289.2 on 2 and 57 DF,  p-value: < 2.2e-16
```

---

To assess the model adequacy, we compare the predictions and data as follows (note that this model is based on `age_minus_6` and not `age`):

```r
# Compute predictions
age_to_predict = 0:6
data_control   = data.frame(age_minus_6 = age_to_predict, 
                          group = rep("Control", length(age_to_predict)))
data_treatment = data.frame(age_minus_6 = age_to_predict, 
                          group = rep("Treatment", length(age_to_predict)))
prediction_control = predict(mod3, data_control)
prediction_treatment = predict(mod3, data_treatment)

# Define the colors we want to use
colors = c("blue", "red")
group_col = 1 + as.numeric(reading$group == "Treatment")
plot(reading$age, reading$score, xlab = "Age", ylab = "Score",
     col = colors[group_col])

# Add predictions and legend
lines(age_to_predict + 6, prediction_control, col = colors[1])
lines(age_to_predict + 6, prediction_treatment, col = colors[2])
legend("bottomright", c("Control", "Treatment"), pch = 1, col = colors)
```

---



<div style="text-align:center"><img src="plot_reading_12.png" alt=" " width="70%"></div>


---

Based on this graph, our third model appears to be a better fit compared to the second model. We can also compare the AIC of the models we have considered as follows:

```r
AIC(mod1)
AIC(mod2)
AIC(mod3)
```

```out
[1] 354.2688
[1] 328.9095
[1] 326.9479
```

---

This approach suggests that the third model is the most adequate among all three models we have considered. Finally, we can construct the model diagnostic graphs as follows:

```r
colors = c("blue", "red")
group_col = 1 + as.numeric(reading$group == "Treatment")
plot(fitted(mod3), resid(mod3), xlab = "Fitted values", 
     ylab = "Residuals", col = colors[group_col])
```

<div style="text-align:center"><img src="plot_reading_13.png" alt=" " width="70%"></div>

---

```r
qqnorm(resid(mod3))
qqline(resid(mod3))
```


<div style="text-align:center"><img src="plot_reading_14.png" alt=" " width="70%"></div>
