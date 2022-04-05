data(Indometh)

# Add log concentration
Indometh$log_conc = log(Indometh$conc)

# Add log time
Indometh$log_time = ___(Indometh$___)

# Fit model 3
mod3 = lm(log_conc ~ ____, data = Indometh)