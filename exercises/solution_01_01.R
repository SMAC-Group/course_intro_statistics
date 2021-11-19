# Consider the dataset palmerpenguins in the packages palmerpenguins 
# represent the bill length for species Gentoo and Chinstrap
# we would like to test that the true difference in means for variable bill_length_mm
# between group Chinstrap and group Gentoo is greater than 0

# load data and libraries
library(palmerpenguins)
library(dplyr)
library(ggplot2)
data("penguins")

# filter data to only keep Gentoo or Chinstrap
penguins_sub = penguins %>% filter(species %in% c("Gentoo", "Chinstrap"))

# boxplot
ggplot(penguins_sub, aes(x=species, y=bill_length_mm)) + 
  geom_boxplot()

# t test
t.test(formula = penguins_sub$bill_length_mm ~ penguins_sub$species, alternative = "greater")
