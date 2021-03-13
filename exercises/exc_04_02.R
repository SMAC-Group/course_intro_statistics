library(dplyr)
library(dslabs)
murders %>%
  group_by(___) %>%
  summarise(total_pop = sum(___),
            ___ = sum(total)) %>%
  ___(murder_rate = total_murders/ ___) %>%
  arrange(-___) %>%
  select(abb, murder_rate) %>%
  ___(1:5)