library(idar)
data(covid)
spo2 = covid$spo2
gender = covid$sex
icu = covid$icu

spo2_icu = spo2[icu == 1]
spo2_not_icu = spo2[icu == 0]
boxplot(spo2_icu, spo2_not_icu)


# Everyone
wilcox.test(spo2, mu = 95, alternative = "less")
wilcox.test(spo2, mu = 93, alternative = "less")

t.test(spo2, mu = 95, alternative = "less")
t.test(spo2, mu = 93, alternative = "less")

# Addmited
wilcox.test(spo2_icu, mu = 92, alternative = "less")

# Not admitted
wilcox.test(spo2_not_icu, mu = 92, alternative = "greater")