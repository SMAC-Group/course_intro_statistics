---
type: slides
---

# Bronchitis dataset

---

In this section, we will investigate the reliability of our model. An important question is how does our model predict **out-of-sample**? Indeed, if the predicted probability is larger than 0.5 (why? 🤔), then we predict that the considered individual will have bronchitis (so positive). Otherwise we predict that the individual is negative. Then we can compute the **in-sample** classification accuracy by comparing the predicted values to the actual observed values for the whole sample.


```r
class_predict = mod2$fitted.values > 0.5
in_accuracy = mean((bronchitis$bron == "1") == class_predict)
in_accuracy
```

```out
0.8018868
```

---

In this case, we have 80.19% in-sample classification accuracy. We will now consider and estimate the out-of-sample classification accuracy. To do so, we will use a technique called 10-fold cross-validation, see [here](https://en.wikipedia.org/wiki/Cross-validation_(statistics)#k-fold_cross-validation) for more details).


Cross-validation, sometimes called rotation estimation or out-of-sample testing, is a model validation techniques for assessing how the results of a statistical analysis will generalize to an independent data set. Cross-validation is a resampling method that uses different portions of the data to test and train a model on different iterations. 

---

# k-folds Cross-validation


Steps in a procedure of cross validation:

1- Split the data into train and test sets and evaluate the model’s performance as ‘Measure 1’. 

2- Split the data and split into new train and test sets. Re-evaluate model’s performance. As we ‘Measure 1’ in similar way we measures ‘Measure 2’ , ‘Measure 3’ and so on.

3- To get the actual performance metric , take the average of all measures.


---
# k-folds Cross-validation

<div style="text-align:center"><img src="cv_fold.png" alt=" " width="80%"></div>

---


```r
# Make sure to install the boot package using: install.packages("boot")
library(boot)  
set.seed(1559) # For reproducibility

cost = function(resp, pred){
  mean(resp == (pred > 0.5))
}

out_accuracy = cv.glm(bronchitis, mod2, cost, K = 10)$delta[2]
out_accuracy
```

```out
0.7943663
```



In this case, we have 79.43% out-of-sample classification accuracy, which is very similar to the in-sample classification accuracy. This is because we have a large number of observations (`n=212`) compared to the number of parameters to estimate (`p=3`). This result suggests that our model is quite accurate and able to predict correctly approximately 80% of the time (which is not bad!).



---

Manual implementation of the Cross-Validation



