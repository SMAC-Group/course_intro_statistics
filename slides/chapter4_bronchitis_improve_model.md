---
type: slides
---

# Bronchitis dataset

---


In the lecture slides, we consider an alternative model which accounts for pollution:


<div style="text-align:center"><img src="chap4_eq_mdl_2.png" alt=" " width="85%"></div>


This second model (i.e. "Model 2") can be estimated using the function `glm` as follows:

```{r, results='hide'}
mod2 = glm(bron ~ cigs + poll, data = bronchitis, family = binomial())
summary(mod2)
```

---

```out
Call:
glm(formula = bron ~ cigs + poll, family = binomial(), data = bronchitis)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-2.4023  -0.5606  -0.4260  -0.3155   2.3594  

Coefficients:
             Estimate Std. Error z value Pr(>|z|)    
(Intercept) -10.08491    2.95100  -3.417 0.000632 ***
cigs          0.21169    0.03813   5.552 2.83e-08 ***
poll          0.13176    0.04895   2.692 0.007113 ** 

Signif. codes:  
0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 221.78  on 211  degrees of freedom
Residual deviance: 174.21  on 209  degrees of freedom
AIC: 180.21

Number of Fisher Scoring iterations: 5
```

---

This second model appears to be more suitable to the data at hand given that it is associated to a lower AIC. Indeed, we have

```r
AIC(mod1)
AIC(mod2)
```

```out
185.7072
180.2145
```
---

Based on this second model, we can also compute predictions. For example, we can consider `poll = 55` (i.e. low pollution index) and different daily cigarettes consumption (i.e. `cigs = c(0, 15, 30)`) as follows:

```r
predict(mod2, data.frame(cigs = c(0, 15, 30), poll = c(55, 55, 55)),
type = "response")
```

```out
0.05529655 0.58349743 0.97104009 
```


---

Similarly, we can consider a higher pollution index, say `poll = 65`:

```r
predict(mod2, data.frame(cigs = c(0, 15, 30), poll = c(65, 65, 65)), 
type = "response")
```

```out
0.1793777 0.8395305 0.9920771  
```

---


Graphically, the predictions from these two values of the pollution indices can be represented as follows:

```r
pred_poll_low = predict(mod2, data.frame(cigs = cigs_to_predict, 
poll = rep(55, length(cigs_to_predict))), type = "response")

pred_poll_high = predict(mod2, data.frame(cigs = cigs_to_predict, 
poll = rep(70, length(cigs_to_predict))), type = "response")

plot(bronchitis$cigs, bronchitis$bron, 
     xlab = "Daily number of cigarettes",
     ylab = "Predicted Bronchitis probability")
grid()
lines(cigs_to_predict, pred_poll_high, col = "#F8766D")
lines(cigs_to_predict, pred_poll_low, col = "#00BFC4")

legend(x = 18, y = 0.4, c("High pollution index", "Low pollution index"), 
col = c("#F8766D", "#00BFC4"), lwd = 1)
```

---


<div style="text-align:center"><img src="plot_chap4_4.png" alt=" " width="70%"></div>

