# Load data
library(idar)
data("pharmacy")

# Construct attendance by day
monday = na.omit(pharmacy$attendance[pharmacy$weekday == "Monday"])
tuesday = na.omit(pharmacy$attendance[pharmacy$weekday == "Tuesday"])
wednesday = na.omit(pharmacy$attendance[pharmacy$weekday == "Wednesday"])
thursday = na.omit(pharmacy$attendance[pharmacy$weekday == "Thursday"])
friday = na.omit(pharmacy$attendance[pharmacy$weekday == "Friday"])
saturday = na.omit(pharmacy$attendance[pharmacy$weekday == "Saturday"])
sunday = na.omit(pharmacy$attendance[pharmacy$weekday == "Sunday"])

# T-tests
t.test(sunday, monday, alternative = "greater")
t.test(sunday, tuesday, alternative = "greater")
t.test(sunday, wednesday, alternative = "greater")
t.test(sunday, thursday, alternative = "greater")
t.test(sunday, friday, alternative = "greater")
t.test(sunday, saturday, alternative = "greater")