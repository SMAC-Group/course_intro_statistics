library(idar)
data("codex")
codex$log_cmax = log(codex$cmax)
mod = lm(log_cmax ~ gender + bmi, data = codex)