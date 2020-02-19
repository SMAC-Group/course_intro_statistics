median_bootstrap_sd = function(x, bootstrap_iterations){
  T_boot = vector(length = bootstrap_iterations)
  for(i in seq(bootstrap_iterations)){
    set.seed(i)
    boot_sample = sample(x = x, size = length(x), replace = T)
    T_boot[i] = median(boot_sample)
  }
  se = sqrt(var(T_boot))
  norm_ci = c(median(x) - 2* se, median(x) + 2* se)
  percentile_ci = c(quantile(x = T_boot, probs = .025), quantile(x = T_boot, probs = .975))
  out = list(
    vec_bootstrap_median = T_boot,
    nbr_iter = bootstrap_iterations,
    variance_median = var(T_boot),
    standard_error_median = se,
    norm_ci = norm_ci,
    percentile_ci = percentile_ci
    )
  return(out)
}

# generate data
set.seed(1234)
my_data = rnorm(n = 100000, mean = 55, sd = 20)
my_sample = sample(my_data, size = 1000, replace = F)

# compute bootstrap estimate of the standard error
my_boot_estimate = median_bootstrap_sd(x = my_sample, bootstrap_iterations = 1000)

# compare true value and CI
median(my_data)
my_boot_estimate[[5]]
my_boot_estimate[[6]]
