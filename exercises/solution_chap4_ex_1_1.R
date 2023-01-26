library(idarps)
data(covid)
mod = glm(icu ~ sex + ldh, data = covid, family = binomial())
summary(mod)