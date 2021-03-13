library(dplyr)
library(datasets)
esoph %>%
  rename(
    alcool_consum = alcgp,
    tobacco_consum = tobgp
  ) %>%
  mutate("drinker_group" = recode_factor(alcool_consum,
                                         "0-39g/day" = "small drinker",
                                         "40-79" = "medium drinker",
                                         "80-119" = "heavy drinker",
                                         "120+" = "dangerous drinker"
  )) %>%
  group_by(drinker_group) %>%
  summarise(n_cases = sum(ncases)) %>%
  arrange(-n_cases)