data(Indometh)

# Add log concentration
Indometh$log_conc = log(Indometh$conc)

# Add log time
Indometh$log_time = log(Indometh$time)

# Fit model 3
mod3 = lm(log_conc ~ log_time, data = Indometh)