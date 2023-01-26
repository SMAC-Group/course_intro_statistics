# load data and libraries
library(idarps)
library(dplyr)
data(cortisol)

# Represent Urine Cortisol (pg/mg)
boxplot(cortisol$`Urine Cortisol (pg/mg)` ~ cortisol$group)

# select variable per group
urine_cortisol_group_c = cortisol %>% filter(group=="C") %>% pull(`Urine Cortisol (pg/mg)`)
urine_cortisol_group_nc = cortisol %>% filter(group=="NC") %>% pull(`Urine Cortisol (pg/mg)`)

# test difference of location between group C and NC
res = wilcox.test(urine_cortisol_group_c, urine_cortisol_group_nc)
res
