data(Indometh)

# Add log concentration
Indometh$log_conc = log(Indometh$conc)

# Add log time
Indometh$log_time = log(Indometh$time)

# Fit model 3
mod3 = lm(log_conc ~ log_time, data = Indometh)

# Compute predictions
time_to_predict = seq(from = 0.25, to = 8, length.out = 100)
predict_concentration = predict(mod3, data.frame(log_time = log(time_to_predict)), interval = "confidence")

# Make graph
plot(Indometh$log_time, Indometh$log_conc, xlab = "Time (hr) - Log scale", ylab = "Concentration (mcg/ml) - Log scale")
lines(log(time_to_predict), predict_concentration[,1])
lines(log(time_to_predict), predict_concentration[,2], lty = 2)
lines(log(time_to_predict), predict_concentration[,3], lty = 2)
