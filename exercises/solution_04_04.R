library(dslabs)
library(dplyr)
full_join(results_us_election_2016, murders, by = "state") %>%
  mutate(prop_clinton_trump = clinton/trump)%>%
  mutate(winner = ifelse(prop_clinton_trump > 1, "clinton", "trump")) %>%
  rename(total_murders = total) %>%
  arrange(-total_murders) %>% 
  select(state, total_murders, winner) %>%
  slice(1:10)

