# Library package idar and load dataset diet first, and then do two sample test on 
# whether there is gender difference take a diet B ("B" in var type) between male and female
# using Two sample t test and Wilcoxon rank sum test

# load data and libraries
library(idar)
data(diet)

# Compute weight loss
diet$weight.loss = diet$initial.weight - diet$final.weight

# Extract weight loss data for women who take diet B
dietB_Female = diet[diet$gender =="Female" & diet$diet.type == "B", ]$weight.loss
dietB_Male = diet[diet$gender =="Male" & diet$diet.type == "B", ]$weight.loss

# t test
t.test(___, ___, var.equal = ___)

# Wilcoxon test
wilcox.test(___,___)