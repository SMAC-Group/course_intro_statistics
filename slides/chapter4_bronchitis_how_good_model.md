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

In this case, we have 80.19% in-sample classification accuracy. 

---
# Out-of-sample prediction performance 😱

Understanding the details behind cross-validation is beyond the scope of this class. However, for the curious students we provide some explanations here... We use the symbol 😱 to highlight such more advanced content.

We will now consider and estimate the out-of-sample classification accuracy. To do so, we will use a technique called 10-fold cross-validation, see [here](https://en.wikipedia.org/wiki/Cross-validation_(statistics)#k-fold_cross-validation) for more details).


<div style="text-align:center"><img src="img_cv.png" alt=" " width="70%"></div>

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

# k-folds Cross-validation 😱

Cross-validation is a model validation techniques for assessing how the results of a statistical analysis will generalize to an independent data set. Cross-validation is a resampling method that uses different portions of the data to test and train a model on different iterations.


Steps in a procedure of k-folds cross validation procedure:


1. Shuffle the dataset randomly.
2. Split the dataset into k groups (typically we consider 10 groups).
3. For each unique group:
    - Take the group as a hold out or test data set.
    - Take the remaining groups as a training data set.
    - Fit the model on the training set and evaluate it on the test set.
    - Save the evaluation metric.
4. Summarize the skill of the model using the sample of model evaluation scores.

---

# k-folds Cross-validation 😱

<div style="text-align:center"><img src="cv_fold.png" alt=" " width="80%"></div>

---

# Manual implementation of Cross-Validation 😱

We can easily reproduce a the procedure carried out with `cv.glm()` using a manual implementation of a 10 folds cross-validation procedure on the accuracy of predictions made with the model `mod2`.

We first create a vector that assign each observation to a fold:

```r
# define number of fold
fold = 10
# define vector to save accuracy for each fold
cv_accuracy = vector(mode = "numeric", length = fold)
# define fold id vector
n <-  dim(bronchitis)[1]
prop <- n%/%fold
set.seed(123)
newseq <- rank(runif(n))
fold_id <- as.factor((newseq - 1)%/%prop + 1)
fold_id[1:10]
```

```out
 [1] 3  9  5  9  10 1  6  10 6  5 
Levels: 1 2 3 4 5 6 7 8 9 10 11
```

---

We can then run the procedure for each fold:

```r
# run cv procedure
for(fold_i in seq(fold)){
  # identify id train and test
  id_test = which(fold_id == fold_i)
  id_train = which(!fold_id == fold_i)
  # fit model on training and rate accuracy on test set
  fit = glm(bron ~ cigs + poll, data = bronchitis[id_train, ], family = binomial())
  y_pred_test = predict(fit, newdata = bronchitis[id_test, ], type = "response")
  y_pred_test_bin = ifelse(y_pred_test > 0.5, 1,0) 
  # compute accuracy on test set 
  cv_accuracy[fold_i] = mean(y_pred_test_bin == bronchitis[id_test, "bron"])
}
# Compute estimated cv accuracy
mean(cv_accuracy)

``` 

```out
0.8047619
```

In this case, we obtain an estimated cross-validation accuracy of 80.47%. Due to the stochastic process of assigning observations to folds, this procedure return different cross-validation metrics depending on the specified allocation of observations. When the process is repeated and the computed measures averaged, the procedure is called repeated cross validation. 
