library(dslabs)
library(dplyr)
___(results_us_election_2016, ___, by = ___) %>%
  mutate(prop_clinton_trump = clinton/___) %>%
  mutate(winner = ifelse(___ > 1, "clinton", "trump")) %>%
  rename(___ = total) %>%
  arrange(-total_murders) %>% 
  select(state, total_murders, ___) %>%
  ___(n = 10)

