library(dplyr)
library(dslabs)
murders %>%
  group_by(abb) %>%
  summarise(total_pop = sum(population),
            total_murders = sum(total)) %>%
  mutate(murder_rate = total_murders/ total_pop) %>%
  arrange(-murder_rate) %>%
  select(abb, murder_rate) %>%
  slice(1:5)