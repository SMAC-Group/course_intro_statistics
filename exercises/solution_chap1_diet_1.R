# Import data
library(idarps)
data(diet)

# Compute weight loss
diet$weight.loss = diet$initial.weight - diet$final.weight

# Select diet
posw = diet$diet.type=="A"

# Variable of interest
dietA = diet$weight.loss[posw]
dietA