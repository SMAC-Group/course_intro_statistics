library(idar)
data(bronchitis)
mod2 = glm(bron ~ cigs + poll, data = bronchitis, family = binomial())
fold = 10
cv_error = vector(mode = "numeric", length = fold)
# split in k-folds
# get dimension of dataset

n <-  dim(bronchitis)[1]
prop <- n%/%fold
set.seed(7)
newseq <- rank(runif(n))
k <- as.factor((newseq - 1)%/%prop + 1)
y <- unlist(strsplit(as.character(form), " "))[2]
vec_accuracy <- vector(length = fold)