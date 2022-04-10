---
type: slides
---

# Bronchitis dataset

---

To better understand the estimated coefficients, we can compute the probability (based on our model) that a non-smoking person is diagnosed with bronchitis as follows:

```r
predict(mod1, data.frame(cigs = 0), type = "response")
```

```{out
0.09245818
```


---



This prediction can be compared with the probability that a person consuming a certain number of daily cigarettes is diagnosed with bronchitis. For example, considering 5, 10, 20 and 30 daily cigarettes, we obtain the following predictions:



```r
predict(mod1, data.frame(cigs = c(5, 10, 20, 30)), type = "response")
```

```out
0.2249282 0.4525518 0.8702592 0.9819584 
```

---

The relationship between daily cigarettes and the probability of being diagnosed with bronchitis can be represented as follows:

```{r}
cigs_to_predict = 0:30
pred = predict(mod1, data.frame(cigs = cigs_to_predict), type = "response")
plot(cigs_to_predict, pred, type = "l", xlab = "Daily number of cigarettes", ylab = "Predicted Bronchitis probability", ylim = c(0, 1))     
grid()
```

<div style="text-align:center"><img src="plot_chap4_1.png" alt=" " width="70%"></div>


---

It is also possible to add the data to this graph, although this is not always very informative as most points are on top of each other (e.g. in this dataset we have 47 non-smokers that don't have bronchitis corresponding to only one point!). 

```{r}
cigs_to_predict = 0:30
pred = predict(mod1, data.frame(cigs = cigs_to_predict), type = "response")
plot(cigs_to_predict, pred, type = "l", xlab = "Daily number of cigarettes", ylab = "Predicted Bronchitis probability", ylim = c(0, 1))     
grid()
points(bronchitis$cigs, bronchitis$bron)
```

<div style="text-align:center"><img src="plot_chap4_2.png" alt=" " width="70%"></div>


---


In some cases, we may also be interested in assessing the uncertainty associated to our predicted probabilities. For this purpose, we can compute the (estimated) standard deviation of our predictions. Then we can construct a confidence interval using this standard deviation (often we simply consider plus or minus one standard deviation) as follows:

```{r}
pred = predict(mod1, data.frame(cigs = cigs_to_predict), type = "response", se.fit = TRUE)

plot(bronchitis$cigs, bronchitis$bron, 
     xlab = "Daily number of cigarettes",
     ylab = "Predicted Bronchitis probability")
grid()
lines(cigs_to_predict, pred$fit)
lines(cigs_to_predict, pred$fit + pred$se.fit, lty = 2)
lines(cigs_to_predict, pred$fit - pred$se.fit, lty = 2)
```

---


<div style="text-align:center"><img src="plot_chap4_3.png" alt=" " width="70%"></div>


