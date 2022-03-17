# Import data
library(idar) 
data(diet)

# Compute weight loss
diet$weight.loss = diet$initial.weight - diet$final.weight

# Variables of interest
dietA = diet$weight.loss[diet$diet.type=="A"]
dietC = diet$weight.loss[diet$diet.type=="C"]

# Perfom test
wilcox.test(dietA, dietC, alternative = "less", mu = __)