---
type: slides
---

# Reading dataset

---

# Model diagnostic

In this section, we consider the construction of model diagnostic graphs discussed in the lecture slides. The first graph compares the fitted values (i.e the predictions) with the residuals of the model. The fitted values and the residuals of the model can be computed as follows:

```r
# Fitted values
fitted_values = predict(mod1)

# Residuals
residuals = resid(mod1)
```

---

Then, we can construct the graph using the function `plot` as follows:

```r
plot(fitted_values, residuals, xlab = "Fitted values", ylab = "Residuals
```


<div style="text-align:center"><img src="plot_reading_6.png" alt=" " width="70%"></div>

---

Similarly to what we did before, we can also add different colors to compare the groups:

```r
colors = c("blue", "red")
group_col = 1 + as.numeric(reading$group == "Treatment")
plot(fitted_values, residuals, xlab = "Fitted values", 
     ylab = "Residuals", col = colors[group_col])
```


<div style="text-align:center"><img src="plot_reading_7.png" alt=" " width="70%"></div>



---

This graph clearly illustrates the limitation of our model. We can also construct a normal Q-Q plot to assess if the empirical distribution of the residuals is close to a normal distribution using the functions `qqnorm` and `qqline`:

```r
qqnorm(residuals)
qqline(residuals)
```

<div style="text-align:center"><img src="plot_reading_8.png" alt=" " width="70%"></div>

