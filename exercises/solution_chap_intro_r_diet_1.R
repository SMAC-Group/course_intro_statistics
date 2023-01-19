# Import data
library(idar)
data(diet)

# subset dataset
diet_sub = diet[diet$gender == "Female" & diet$diet.type == "A", ]
diet_sub
