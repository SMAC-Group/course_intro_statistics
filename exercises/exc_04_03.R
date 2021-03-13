library(dplyr)
library(datasets)
esoph %>%
  rename(
    ___ = alcgp,
    tobacco_consum = ___
  ) %>%
  mutate("drinker_group" = ___(alcool_consum,
                                         "0-39g/day" = "small drinker",
                                         "40-79" = "medium drinker",
                                         "80-119" = "___",
                                         "120+" = "dangerous drinker"
  )) %>%
  group_by(___) %>%
  summarise(n_cases = sum(___)) %>%
  arrange(-n_cases)