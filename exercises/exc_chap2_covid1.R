library(idarps)
data(covid)

# Extract the variable SpO2
spo2 = covid$___

# Extract the variable ICU
icu = covid$___

# Select SpO2 of ICU patients
spo2_icu = spo2[icu == __]

# Select SpO2 of non-ICU patients
spo2_not_icu = spo2[___ == 0]