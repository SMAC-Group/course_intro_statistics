library(idar)
data(covid)
mod = glm(icu ~ sex + ldh, data = covid, family = binomial())
predict(mod, data.frame(sex = "women", ldh = 645), type = "response")
