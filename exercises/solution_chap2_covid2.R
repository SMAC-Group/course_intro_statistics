library(idarps)
data(covid)

# Extract the variable SpO2
spo2 = covid$spo2

# Extract the variable ICU
icu = covid$icu

# Select SpO2 of ICU patients
spo2_icu = spo2[icu == 1]

# Select SpO2 of non-ICU patients
spo2_not_icu = spo2[icu == 0]

# Boxplot
boxplot_w_points(spo2_not_icu, spo2_icu, names = c("No ICU", "ICU"),
                 ylab = "Oxygen saturation (%)")