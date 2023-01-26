# Import data
library(idarps)
data(diet)

# subset dataset
diet_sub = diet[diet$gender=="Female" & (diet$diet.type=="C" | diet$diet.type == "B") & diet$final.weight < 65, ]
diet_sub
