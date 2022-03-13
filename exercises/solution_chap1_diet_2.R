# Import data
library(idar)
data(diet)

# Compute weight loss
diet$weight.loss = diet$initial.weight - diet$final.weight

# Select diet
posw = diet$diet.type=="A"

# Variable of interest
dietA = diet$weight.loss[posw]

# Boxplot
boxplot_w_points(dietA)

# Histogram
hist_compare_to_normal(dietA)