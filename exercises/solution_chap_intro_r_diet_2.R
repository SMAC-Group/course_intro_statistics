# Import data
library(idar)
data(diet)

# subset dataset
diet_sub = diet[diet$initial.weight <= 70, ]
diet_sub
