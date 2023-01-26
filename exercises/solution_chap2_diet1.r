# Import data
library(idarps) 
data(diet)

# Compute weight loss
diet$weight.loss = diet$initial.weight - diet$final.weight

# Variables of interest
dietA = diet$weight.loss[diet$diet.type=="A"]
dietC = diet$weight.loss[diet$diet.type=="C"]

# Boxplots
boxplot_w_points(dietA, dietC, xlab = "Weight loss (kg)", horizontal = T)
abline(v = 0)