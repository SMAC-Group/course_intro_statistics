# Data wrangling

# clean ws
rm(list = ls())

airquality

# the pipe operator
set.seed(12345)
which.max(table(rpois(n = 1000, lambda = 10)))
set.seed(12345)
rpois(n = 1000, lambda = 10) %>%
  table() %>%
  which.max()

# load data
# install.packages("gapminder")
# https://www.rdocumentation.org/packages/gapminder/versions/0.3.0
# install.packages("poliscidata")
# https://rdrr.io/cran/poliscidata/man/world.html
library(poliscidata)
library(gapminder)
data("gapminder")
data("world")

# load packages
library(naniar)
library(janitor)
library(dplyr)
library(tidyr)

# Common operations in Data Wrangling

# get dimensions and inspect structure
dim(world)
dim(gapminder)
str(gapminder)

# subset and filter data
# subset
df_world_red <- world %>%
  select(country, debt, literacy, spendeduc, spendmil, eu) %>%
  head()

world %>%
  filter(democ == "Yes") %>%
  filter(oecd == "OECD Member state") %>%
  filter(debt >= .5) %>%
  select(lifeex_f)

head(df_world_red)

# clean names
colnames(gapminder)
gapminder <- clean_names(gapminder)
colnames(gapminder)

# filter
df_gpmind <- gapminder %>%
  filter(continent %in% c("Asia", "Americas", "Oceania")) %>%
  filter(year >= 1990)

# NA
vis_miss(df_world_red, show_perc = T)
gg_miss_var(df_world_red, show_pct = T)


# pivoting, grouping and summarizing
df_a <- gapminder %>%
  pivot_wider(
    id_cols = c("country", "continent"),
    values_from = c("gdp_percap"),
    names_from = "year",
    names_prefix = ""
  ) %>%
  select(country, "2007") %>%
  rename(gdp_2007 = "2007") %>%
  slice(1, 10,  60)


df_b <- world %>%
  select(country, oecd) %>%
  filter(country %in% c("Afghanistan", "Belgium", "Switzerland"))


df_a
df_b

full_join(df_a, df_b)
inner_join(df_a, df_b)
right_join(df_a, df_b)
left_join(df_a, df_b)
# library(dcldata)
# example_eagle_nests

gapminder %>%
  group_by(continent) %>%
  summarize(
    mean_life_exp = mean(life_exp),
    mean_gdp = mean(gdp_percap),
    no = n()
  )

df_a <- gapminder %>%
  select(country, continent, life_exp) %>%
  filter(continent = Asia)


# joins
full_join(df_world_red %>% select(country, eu),
  df_gdp_per_year,
  by = "country"
) %>% head()

right_join(
  df_world_red %>% select(country, eu),
  df_gdp_per_year %>% filter(continent == "Africa")
) %>%
  head()


# reencoding and creating variable
library(plyr)
df_world_red_2 <- df_world_red %>%
  select(country, debt, spendeduc, spendmil, eu) %>%
  mutate(
    eu_bin = revalue(
      factor(df_world_red$eu),
      c("EU Member state" = "1", "Not member" = "0")
    ),
    ratio_spend_educ_mil = spendeduc / spendmil
  ) %>%
  head()




# 
data("swiss")
help(swiss)
colnames(swiss)
swiss = swiss %>% rename(fert = Fertility, perc_male_agr = Agriculture)
colnames(swiss)
swiss = swiss %>% rename_with(tolower)
colnames(swiss)

library(magrittr)
library(poliscidata)
library(dplyr)

my_vec <- sample(c("a", "b", "c"), 15, replace = TRUE)
my_vec
recode(my_vec, a = "var_1", b = "var_2")

iris
iris %>% mutate(species_fact = recode(Species, "setosa" = 1, "versicolor" = 2, "virginica" = 3))

world %>%
  select(country, debt, spendeduc, spendmil, eu) %>% 
  mutate(eu_bin=recode_factor(eu, 
                       "EU Member state" = 1,
                       "Not member"=0),
         ratio_spend_educ_mil = spendeduc / spendmil)
str(world)

myvec = c("a", "b", "a", "c", "b")
myvec %>% recode("a" = va)
# data vizualisation
# <div style="text-align:center"><img src="cleaning_data.png" alt=" " width="40%">
library(janitor)
head(iris)
iris = iris %>% 
  mutate(species_bin = recode_factor(Species, "setosa" = 1, "versicolor" = 2, "virginica" = 3),
         ratio_petal_w_sepal_l = Petal.Length / Sepal.Length,
         ratio_petal_w_sepal_w = Petal.Width / Sepal.Width)
head(iris)
