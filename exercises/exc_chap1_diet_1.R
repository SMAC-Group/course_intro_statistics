# Import data
library(idar)
data(diet)

# Compute weight loss
diet$weight.loss = diet$initial.weight - diet$final.weight

# Select diet
posw = diet$diet.type=="_"

# Variable of interest
dietA = diet$weight.loss[____]
