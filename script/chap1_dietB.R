# Import data
library(idarps) 
data(diet)
head(diet)
diet$weight.loss = diet$initial.weight - diet$final.weight

# Select diet
posw = diet$diet.type=="B"

# Variable of interest
dietB = diet$weight.loss[posw]

boxplot(dietB, main = "Diet B", ylab = "Weight loss (kg)")

boxplot(dietB, main = "Diet B", xlab = "Weight loss (kg)", horizontal = TRUE)
abline(v = 0)

boxplot_w_points(dietB, main = "Diet B", horizontal = TRUE, xlab = "Weight loss (kg)", jitter_param = .25)
abline(v = 0)

hist_compare_to_normal(dietB)

t.test(dietB, alternative = "greater")
t.test(dietB)
wilcox.test(dietB, alternative = "greater")
