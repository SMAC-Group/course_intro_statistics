library(idar)
data(covid)

# SpO2
spo2 = covid$spo2

# SpO2 (in ICU)
icu = covid$icu
spo2_icu = spo2[icu == 1]

# SpO2 (not in ICU)
spo2_not_icu = spo2[icu == 0]

# Check empirical distribution
boxplot_w_points(spo2_icu, spo2_not_icu, ylab = "Oxygen saturation (%)")

wilcox.test(spo2, mu = 95, alternative = "less")
wilcox.test(spo2, mu = 93, alternative = "less")

# This might not be a good idea...
t.test(spo2, mu = 95, alternative = "less")
t.test(spo2, mu = 93, alternative = "less")

# ICU
wilcox.test(spo2_icu, mu = 92, alternative = "less")

# No ICU
wilcox.test(spo2_not_icu, mu = 92, alternative = "greater")

# This might not be a good idea...
t.test(spo2_icu, mu = 92, alternative = "less")
t.test(spo2_not_icu, mu = 92, alternative = "greater")

