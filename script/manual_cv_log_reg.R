library(idarps)
data(bronchitis)
mod2 = glm(bron ~ cigs + poll, data = bronchitis, family = binomial())

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
table(fold_id)
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
