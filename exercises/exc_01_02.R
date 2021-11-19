# Library package idar and load dataset diet first, and then test on 
# whether women ("Female" in var gender) take a diet B ("B" in var type) 
# have a significant weight loss greater than 0

# load data and libraries
library(___)
data(___)

# Compute weight loss
diet$weight.loss = diet$initial.weight - diet$final.weight

# Extract data for women who take diet B
X = diet[diet$gender == ___ & diet$diet.type == ___, ]$___

# t test
t.test(___, alternative = ___)

# Wilcoxon test
wilcox.test(___, alternative = ___)
