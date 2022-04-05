---
type: slides
---

# Reading dataset

---

# Representing the data

In order to assess the adequacy of our model to the data, it is useful (when this is possible) to compare the predictions and the data. This implies that we need to do two things: (1) plot the data with different colors for the groups and (2) compute predictions.

To plot the data, we can use the function `plot` as follows:

```r
plot(reading$age, reading$score)
```

<div style="text-align:center"><img src="plot_reading_1.png" alt=" " width="70%"></div>

---

# Labelling axis

The first input of the function `plot` corresponds to the "x-axis" and the second input corresponds to the "y-axis". We can modify the labels on and x- and y-axis as follows:


```r
plot(reading$age, reading$score, xlab = "Age", ylab = "Score")
```


<div style="text-align:center"><img src="plot_reading_2.png" alt=" " width="70%"></div>

---

# Color coding points based on the group

Next, we will highlight the different groups using two colors. For this purpose, we need to create one variable `group_col` indicating in which groups the points on the graph belong to:

```r
# Define the colors we want to use
colors = c("blue", "red")
group_col = 1 + as.numeric(reading$group == "Control")
plot(reading$age, reading$score, xlab = "Age", ylab = "Score",
     col = colors[group_col])
```

<div style="text-align:center"><img src="plot_reading_3.png" alt=" " width="50%"></div>

---

# Adding a legend

Finally, we can add a legend as follows:

```r
# Define the colors we want to use
colors = c("blue", "red")
group_col = 1 + as.numeric(reading$group == "Treatment")
plot(reading$age, reading$score, xlab = "Age", ylab = "Score",
     col = colors[group_col])
legend("bottomright", c("Control", "Treatment"), pch = 1, col = colors)
```

<div style="text-align:center"><img src="plot_reading_4.png" alt=" " width="50%"></div>

---

# Computing predictions

We can now compute predictions from our model. It can be observed that the age of the children ranges from 6 to 12 so our first step is to construct a sequence of numbers from 6 to 12 as follows:

```r
age_to_predict = 6:12
age_to_predict
```

```out
[1]  6  7  8  9 10 11 12
```



---
Then, using the output of the model we have that the predictions for the group "Control" are given by:

<div style="text-align:center"><img src="eq_mdl_new_1.png" alt=" " width="40%"></div>

This can be done as follows:

```r
prediction_control = -7.8639 + 6.6457*age_to_predict
prediction_control
```

```out
[1] 32.0103 38.6560 45.3017 51.9474 58.5931 65.2388 71.8845
```


---

Alternatively, we can construct an object with the data we would like to predict as follows:

```r
data_to_predict = data.frame(age = age_to_predict, 
                            group = rep("Control", length(age_to_predict)))
data_to_predict
```

```out
  age   group
1   6 Control
2   7 Control
3   8 Control
4   9 Control
5  10 Control
6  11 Control
7  12 Control
```

---

Then, we can use the function `predict` as follows:

```r
prediction_control = predict(mod1, data_to_predict)
prediction_control
```

```out
       1        2        3        4        5        6        7 
32.01012 38.65579 45.30145 51.94712 58.59278 65.23845 71.88411 
```

This approach provides the same results but is more reliable. Similarly, we can compute the predictions for the other groups as follows:


```r
data_to_predict = data.frame(age = age_to_predict, 
                            group = rep("Treatment", length(age_to_predict)))
prediction_treatment = predict(mod1, data_to_predict)
prediction_treatment
```

```out
       1        2        3        4        5        6        7 
38.38719 45.03286 51.67852 58.32419 64.96985 71.61552 78.26118
```


---

# Adding predictions to the graph

Now, we can add our predictions to the graph by simply using the function `lines` as follows:


```r
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

<div style="text-align:center"><img src="plot_reading_5.png" alt=" " width="70%"></div>


As discussed in the lecture slides, the adequacy between our predictions and the data is not ideal. To highlight the limitations of this model we will consider model diagnostic graphs in the next section. 
