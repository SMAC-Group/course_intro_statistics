# Import data
library(idarps) 
data(diet)
head(diet)

# Compute weight loss
diet$weight.loss = diet$initial.weight - diet$final.weight

# Variables of interest
dietA = diet$weight.loss[diet$diet.type=="A"]
dietB = diet$weight.loss[diet$diet.type=="B"]

# Boxplots
boxplot_w_points(dietA, dietB, xlab = "Weight loss (kg)", horizontal = T)
abline(v = 0)

t.test(dietA, dietB, alternative = "two.sided")


#######

# Exercise:

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

wilcox.test(dietA, dietC, alternative = "less")

# Part II
library(idarps)

diet$weight.loss = diet$initial.weight - diet$final.weight
# Variable of interest
dietA = diet$weight.loss[diet$diet.type=="A"]
dietB = diet$weight.loss[diet$diet.type=="B"]
dietC = diet$weight.loss[diet$diet.type=="C"]

# Create data frame
dat = data.frame(response = c(dietA, dietB, dietC), 
                 groups = c(rep("A", length(dietA)), 
                            rep("B", length(dietB)), 
                            rep("C", length(dietC))))

# Let's have a look at the data
head(dat)

boxplot_w_points(dietA, dietB, dietC, xlab = "Weight loss (kg)",
                 horizontal = T)
abline(v = 0)
# Kruskal Wallis
kruskal.test(response ~ groups, data = dat)

# Wilcoxon tests
wilcox.test(dietA, dietB, alternative = "two.sided")
wilcox.test(dietA, dietC, alternative = "less")
wilcox.test(dietB, dietC, alternative = "less")

# Alpha Dunn-Sidak
1 - (1 - 0.05)^(1/3)

