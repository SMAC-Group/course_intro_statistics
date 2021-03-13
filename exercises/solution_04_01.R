library(poliscidata)
library(janitor)
library(dplyr)
world %>% clean_names() %>%
  select(country, spendeduc, spendmil, oil) %>%
  arrange(-oil) %>%
  slice(1:5)