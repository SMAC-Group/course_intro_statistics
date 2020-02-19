median_bootstrap_sd = function(x, bootstrap_iterations){
  T_boot = vector(length = ___)
  for(i in seq(___)){
    set.seed(i)
    boot_sample = sample(x = x, size = length(x), replace = ___)
    T_boot[i] = median(___)
  }
  se = ___
  norm_ci = c(median(x) - 2* __, median(x) + 2* se)
  percentile_ci = c(quantile(x = ___, probs = .025), ___(x = T_boot, probs = .975))
  out = list(
    vec_bootstrap_median = ___,
    nbr_iter = ___,
    variance_median = var(___),
    standard_error_median = se,
    norm_ci = ___,
    percentile_ci = percentile_ci
  )
  return(out)
}

# generate data
set.seed(1234)
my_data = rnorm(n = 100000, mean = 55, sd = 20)
my_sample = sample(my_data, size = 1000, replace = F)

# compute bootstrap estimate of the standard error
my_boot_estimate = median_bootstrap_sd(x = ___, bootstrap_iterations = 1000)

# compare true value and CI
median(my_data)
my_boot_estimate[[__]]
my_boot_estimate[[__]]
