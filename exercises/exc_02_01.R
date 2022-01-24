# load data and libraries
library(idar)
library(dplyr)
data(cortisol)

# Represent Urine Cortisol (pg/mg)
boxplot(___ ~ cortisol$group)

# select variable per group
urine_cortisol_group_c = cortisol %>% filter(group==___) %>% pull(`Urine Cortisol (pg/mg)`)
urine_cortisol_group_nc = cortisol %>% filter(group=="NC") %>% pull(___)

# test difference of location between group C and NC
res = wilcox.test(___, urine_cortisol_group_nc)
res