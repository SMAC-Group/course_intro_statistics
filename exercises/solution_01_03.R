# Generate data
x = rnorm(1000)

# plot density
par(mfrow=c(2,1))

# KDE
plot(density(x), main = "KDE of x")

# Boxplot
boxplot(x, horizontal = T, main = "Boxplot of x")