---
type: slides
---

# Reading dataset

---

# Confidence intervals for prediction


In the previous section, we saw that the third model appears to be the most adequate among all three models we have considered. The prediction for this model can be expressed as follows:

<div style="text-align:center"><img src="eq_mdl_new_2.png" alt=" " width="70%"></div>



which corresponds to the expected (or average) score for a child of a certain age in a certain group. But how certain are we about this expected score? To answer this question, we can compute confidence intervals (typically at the 95% confidence level) for our predicted scores. This can be done very similarly to what we did before using the function `predict`. First, we recall how the third model is estimated:

```r
library(idar)
data(reading)
reading$age_minus_6 = age_minus_6
mod3 = lm(score ~ age_minus_6 + group:age_minus_6, data = reading)
```

---
Suppose we wish to construct the predictions for children of age 6 to 12 in the control group. In the previous slides we saw that this could be done as follows:

```r
# Compute predictions
age_to_predict = 0:6
data_control   = data.frame(age_minus_6 = age_to_predict, 
                            group = rep("Control", length(age_to_predict)))
prediction_control = predict(mod3, data_control)
prediction_control
```

```out
       1        2        3        4        5        6        7 
33.35044 39.50267 45.65489 51.80712 57.95934 64.11157 70.26379 
```


---
To obtain confidence intervals for these predictions, we need to add `interval = "confidence"` in the function `predict` as follows:

```r
prediction_control = predict(mod3, data_control, interval = "confidence")
prediction_control
```

```out
       fit      lwr      upr
1 33.35044 31.76762 34.93327
2 39.50267 38.27118 40.73416
3 45.65489 44.61969 46.69010
4 51.80712 50.72519 52.88905
5 57.95934 56.61274 59.30594
6 64.11157 62.37954 65.84360
7 70.26379 68.08885 72.43874
```


---
In this output, the first column `fit` corresponds to our prediction while the second and third columns correspond to the lower and upper values of the confidence intervals (at the 95% confidence level) for these predictions. For example, for a child of age 7 (i.e. `age_minus_6` is 1 so we should check the second row of the results), our (mean) prediction is 39.50267 and a 95% confidence interval for this value is (38.27118 40.73416). Similarly, for the treatment group we can compute predictions and confidence intervals as follows: 

```r
# Compute predictions
age_to_predict = 0:6
data_treatment = data.frame(age_minus_6 = age_to_predict, 
                            group = rep("Treatment", length(age_to_predict)))
prediction_treatment = predict(mod3, data_treatment, interval = "confidence")
prediction_treatment
```

```out
        fit      lwr       upr
1  33.35044 31.76762  34.93327
2  45.31299 43.90573  46.72025
3  57.27554 54.71227  59.83881
4  69.23808 65.20382  73.27234
5  81.20063 75.62434  86.77693
6  93.16318 86.01966 100.30669
7 105.12573 96.40337 113.84808
```


---
To better understand what these confidence intervals represent, we can add them to the graph in which we compare the predictions and the original data. We recall that this graph can be construct as follows:

```r
# Define the colors we want to use
colors = c("blue", "red")
group_col = 1 + as.numeric(reading$group == "Treatment")
plot(reading$age, reading$score, xlab = "Age", ylab = "Score",
     col = colors[group_col])

# Legend
legend("bottomright", c("Control", "Treatment"), pch = 1, col = colors)
```



---

<div style="text-align:center"><img src="plot_reading_15.png" alt=" " width="70%"></div>






---

We can add our predictions for the control group by writing:

```r
lines(age_to_predict + 6, prediction_control[,1], col = colors[1])
```

We can also use the following to add the lower and upper values of the confidence intervals (note that the option `lty = 2` is used to obtain a dashed line):

```r
lines(age_to_predict + 6, prediction_control[,2], col = colors[1], lty = 2)
lines(age_to_predict + 6, prediction_control[,3], col = colors[1], lty = 2)
```


---
Therefore, the code for the graph becomes:

```r
# Define the colors we want to use
colors = c("blue", "red")
group_col = 1 + as.numeric(reading$group == "Treatment")
plot(reading$age, reading$score, xlab = "Age", ylab = "Score",
     col = colors[group_col])

# Predictions
lines(age_to_predict + 6, prediction_control[,1], col = colors[1])
lines(age_to_predict + 6, prediction_control[,2], col = colors[1], lty = 2)
lines(age_to_predict + 6, prediction_control[,3], col = colors[1], lty = 2)

lines(age_to_predict + 6, prediction_treatment[,1], col = colors[2])
lines(age_to_predict + 6, prediction_treatment[,2], col = colors[2], lty = 2)
lines(age_to_predict + 6, prediction_treatment[,3], col = colors[2], lty = 2)

# Legend
legend("bottomright", c("Control", "Treatment"), pch = 1, col = colors)
```

---

<div style="text-align:center"><img src="plot_reading_16.png" alt=" " width="70%"></div>



---
In some situations, it is also of interest to compute a prediction interval, which corresponds to a confidence interval for the score of a child of a certain age and group. This is different from a confidence interval for the mean. Indeed, in the previous graph we can see that many points are outside of the confidence region (which makes sense since the intervals are confidence intervals for the means). We can construct prediction intervals very similarly to what we did before by using `interval = "prediction"` instead of `interval = "confidence"` in the function `predict`. For example, to construct the prediction intervals for children of age 6 to 12 we can write:


```r
prediction_control = predict(mod3, data_control, interval = "prediction")
prediction_treatment = predict(mod3, data_treatment, interval = "prediction")
prediction_control
```

```out
       fit      lwr      upr
1 33.35044 26.08382 40.61706
2 39.50267 32.30440 46.70093
3 45.65489 38.48760 52.82218
4 51.80712 44.63293 58.98131
5 57.95934 50.74050 65.17819
6 64.11157 56.81100 71.41214
7 70.26379 62.84566 77.68193
```


---

In this output, we can see that our prediction intervals are much wider than the previous confidence intervals. For example, for a child of age 7 our predicted score is 39.50267 but the corresponding 95% prediction interval is (32.30440 46.70093). This means that with a probability of 95%, we expect the score of a child of age 7 in the control group to be somewhere between 32.30440 and 46.70093. Naturally, we can produce a graph similarly to the one we considered previously as follows:



```r
# Define the colors we want to use
colors = c("blue", "red")
group_col = 1 + as.numeric(reading$group == "Treatment")
plot(reading$age, reading$score, xlab = "Age", ylab = "Score",
     col = colors[group_col])

# Predictions
lines(age_to_predict + 6, prediction_control[,1], col = colors[1])
lines(age_to_predict + 6, prediction_control[,2], col = colors[1], lty = 2)
lines(age_to_predict + 6, prediction_control[,3], col = colors[1], lty = 2)

lines(age_to_predict + 6, prediction_treatment[,1], col = colors[2])
lines(age_to_predict + 6, prediction_treatment[,2], col = colors[2], lty = 2)
lines(age_to_predict + 6, prediction_treatment[,3], col = colors[2], lty = 2)

# Legend
legend("bottomright", c("Control", "Treatment"), pch = 1, col = colors)
```

---

<div style="text-align:center"><img src="plot_reading_17.png" alt=" " width="70%"></div>

