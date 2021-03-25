rm(list=ls())
library(poliscidata)
library(ggplot2)
library(magrittr)
library(dplyr)
data(world)



ggplot(murders, aes(region, total)) +
  geom_bar(stat="identity")


data(diamonds)

ggplot(data=diamonds, aes(x=price)) +
  geom_histogram()


ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Density") +
  geom_histogram() +
  theme_minimal() +
  ggtitle("Histogram of price")




ggplot(data=diamonds, aes(x=price, group=cut, fill=cut)) +
  xlab("Price")+
  ylab("Density") +
  geom_density(adjust=1.5, alpha=.4) +
  theme_minimal()


ggplot(world, aes(x= literacy)) +
  geom_ +
  xlab("Literacy")+
  theme_minimal() 

ggplot(world, aes(x = "", y = literacy)) +
  ylab("Literacy")+
  geom_boxplot() +
  theme_minimal() 


ggplot(diamonds, aes(x = cut, y = depth)) +
  geom_boxplot() +
  theme_minimal() +
  xlab("Cut") +
  ylab("Depth")

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() 


df_tab = diamonds %>% group_by(cut, color) %>% tally()


ggplot(df_tab) +
  aes(x = cut, weight = n) +
  geom_bar() +
  theme_minimal()



ggplot(df_tab) +
  aes(x = color, weight = n) +
  geom_bar() +
  theme_minimal()




reorder(day, -perc)ggplot(df_tab) +
  aes(x = reorder(color, n), weight = n) +
  geom_bar() +
  theme_minimal()



ggplot(df_sub) +
  aes(x = country, weight = debt) +
  geom_bar() +
  coord_flip() +
  theme_minimal() + 
  theme(axis.text.y = element_text(size = 5))



world$debt


ggplot(df_sub) +
  aes(x = reorder(country, debt), weight = debt) +
  geom_bar() +
  coord_flip() +
  theme_minimal() + 
  theme(axis.text.y = element_text(size = 5)) +
  ylab("Country") +
  xlab("Public debt as a percentage of GDP")




world = world %>%
  mutate(new_name = ifelse(as.character(country) %in% c("Canada", "India", "Thailand", "Switzerland"),
                           as.character(country) ,"")) %>%
  rename("Region" = regionun)

world 

ggplot(data = world, aes(x = gdp_10_thou, y = lifeex_total, 
                         color = Region, shape = oecd)) +
  geom_point(size = 4) +
  ylab("Life expectancy") +
  xlab("GDP per capita 10K US$") +
  ggtitle("Life expectancy vs GDP per capita") +
  geom_text(aes(label = new_name), size = 5, col ="black") +
  theme_minimal()


ggplot(data = world, aes(x = gdp_10_thou, y = lifeex_total, 
                         color = Region, shape = oecd)) +
  geom_point(size = 4) +
  ylab("Life expectancy") +
  xlab("GDP per capita 10K US$") +
  ggtitle("Life expectancy vs GDP per capita") +
  geom_text(aes(label = new_name), 
            size = 5, col ="black",
            nudge_x = .5, nudge_y = .5) +
  theme_minimal()



world = world %>% rename("Lifeexpectancy" = lifeex_total,
                         "World Region" = regionun)

world = world %>% mutate(new_name = ifelse(country %in% c("Belgium", "Canada", "Switzerland", "China"), country, ""))











world$pop_total > quantile_pop

world$country1

# rename variable
library(dplyr)
rename()
ggplot(world, aes(x = gdp_10_thou , 
                  y = lifeex_total, 
                  color = regionun, 
                  shape = oecd,
                  size = pop_total)) + 
  geom_point() +
  theme_minimal() +
  ylab("Life expectancy") +
  xlab("GDP per capita 10K US$") +
  ggtitle("Life expectancy vs GDP per capita") +
  scale_size(range=c(1,15)) 





+
  
  geom_text(aes(label = ifelse(pop_total > quantile_pop, world$country[country], "") 
  ) , size=10) +
  # ggrepel::geom_text_repel(aes(label=country), size=3)+
  theme_minimal()



###### ammounts

library(dplyr)
library(ggplot2)
library(dslabs)
data(murders)
head(murders)

df_murders = murders %>%
  group_by(region) %>%
  summarise(total_pop = sum(population),
            total_murders = sum(total)
  ) %>%
  mutate(
    murder_rate = total_murders/total_pop
  )

head(df_murders)

ggplot(df_murders) +
  aes(region, total_murders) +
  geom_bar(stat="identity") +
  theme_minimal()


ggplot(df_murders) +
  aes(reorder(region, total_murders), total_murders) +
  geom_bar(stat="identity") +
  theme_minimal()


ggplot(df_murders) +
  aes(x = reorder(region, total_murders), y= total_murders) +
  geom_bar(stat = "identity", width = .7, fill = "grey34") +
  coord_flip()+
  theme_minimal() +
  xlab("") +
  ylab("")+
  geom_text(stat='identity', aes(label=total_murders), hjust=1.4, col ="white", size = 5)+
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    axis.text = element_text(size = 13),
    axis.text.y = element_text( color="black", 
                               size=14)
  ) + ggtitle("Total murders per US region")




######################### visualizing many distributions

rm(list=ls())
library(ggplot2)
library(palmerpenguins)
library(tidyverse)   ## data science package collection (incl. the ggplot2 package)
# library(systemfonts) ## use custom fonts (need to be installed on your OS)
# library(scico)       ## scico color palettes(http://www.fabiocrameri.ch/colourmaps.php) in R 
# library(ggtext)      ## add improved text rendering to ggplot2
# library(ggforce)     ## add missing functionality to ggplot2
# library(ggdist)      ## add uncertainity visualizations to ggplot2
# library(magick)      ## load images into R
# library(patchwork)   ## combine outputs from ggplot2

data("penguins")
head(penguins)

df_peng_stats <- 
  penguins %>% 
  mutate(bill_ratio = bill_length_mm / bill_depth_mm) %>% 
  filter(!is.na(bill_ratio)) %>% 
  group_by(species) %>% 
  mutate(
    n = n(),
    median = median(bill_ratio),
    max = max(bill_ratio)
  ) %>% 
  ungroup() %>% 
  mutate(species_num = as.numeric(fct_rev(species)))  %>% 
  select(species, bill_ratio, n, median, max, species_num)

head(df_peng_stats)

df_peng_stats = df_peng_stats %>% select(species, bill_ratio, n, median, max, species_num)

ggplot(data=df_peng_stats, aes(x=bill_ratio, group=species, fill=species)) +
  geom_density(alpha=0.6) +
  scale_fill_manual(values = c("#3d6721", "#a86826", "#006c89"))  + 
  xlab("Bill ratio") + ylab("Density")


# gg ridges
# library
library(ggridges)

# Diamonds dataset is provided by R natively
#head(diamonds)

# basic example
library(ggridges)
ggplot(df_peng_stats, aes(x = bill_ratio, y = species, fill = species)) +
  geom_density_ridges(scale = .9, alpha=.8) +
  theme_ridges() + 
  theme_minimal() +
  scale_fill_manual(values = c("#3d6721", "#a86826", "#006c89")) +
  scale_color_manual(values = c("#3d6721", "#a86826", "#006c89")) +
  xlab("Bill ratio") +
  ylab("Species")



## create a second chart with raincloud plots
g1 = ggplot(df_peng_stats, aes(bill_ratio, species_num, color = species)) +
  geom_point(
    aes(y = species_num - .15), 
    shape = "|",
    size = 5,
    alpha = .33
  ) +
  ggdist::stat_halfeye(
    aes(
      y = species_num,
      color = species,
      fill = after_scale(colorspace::lighten(color, .5))
    ),
    shape = 18,
    point_size = 3,
    interval_size = 1.8,
    adjust = .5,
    .width = c(0, 1)
  ) +
  scale_color_manual(values = c("#3d6721", "#a86826", "#006c89"), guide = "none") 
g1  
g2 = g1 +
  geom_text(
    aes(x = median, label = format(round(median, 2), nsmall = 2)),
    stat = "unique",
    color = "white",
    family = "Open Sans",
    fontface = "bold",
    size = 3.4,
    nudge_y = .15
  ) +
  geom_text(
    aes(x = max, label = glue::glue("n = {n}")),
    stat = "unique",
    family = "Open Sans",
    fontface = "bold",
    size = 3.5,
    hjust = 0,
    nudge_x = .01,
    nudge_y = .02
  ) 

g2

g3 = g2 + 
  coord_cartesian(clip = "off", expand = FALSE) +
  scale_x_continuous(
    limits = c(1.6, 3.8),
    breaks = seq(1.6, 3.8, by = .2)
  )+
  scale_y_continuous(
    limits = c(.55, NA),
    breaks = 1:3,
    labels = c("Gentoo", "Chinstrap", "Adélie")
  ) 

g3
g4 =  g3 +  labs(
  x = "Bill ratio",
  y = NULL,
  subtitle = "B. Raincloud plot showing the distribution of bill ratios, estimated as bill length divided by bill depth.",
  caption = "Data: Gorman, Williams & Fraser (2014) *PLoS ONE* &bull; Illustration: Allison Horst"
) +
  theme(
    panel.grid.major.x = element_line(size = .35),
    panel.grid.major.y = element_blank(),
    axis.text.y = element_text(size = 13),
    axis.ticks.length = unit(0, "lines"),
    plot.title.position = 'plot',
    plot.subtitle = element_text(margin = margin(t = 5, b = 10)),
    plot.margin = margin(10, 25, 10, 25)
  )

g4





################# ralationsip between numerical variables
rm(list=ls())
library(tidyverse)   ## data science package collection (incl. the ggplot2 package)
library(systemfonts) ## use custom fonts (need to be installed on your OS)  
library(scico)       ## scico color palettes(http://www.fabiocrameri.ch/colourmaps.php) in R 
library(ggtext)      ## add improved text rendering to ggplot2
library(ggforce)     ## add missing functionality to ggplot2
library(ggdist)   
data(iris)
data(penguins)

penguins = na.omit(penguins)

ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm)) + 
  
  geom_point(aes(color = body_mass_g), alpha = .6, size = 3.5) +
  
  scico::scale_color_scico(palette = "bamako", direction = -1) +
  coord_cartesian(xlim = c(25, 65), ylim = c(10, 25)) +
  rcartocolor::scale_fill_carto_d(palette = "Bold") +
  labs(
    title = "Bill Dimensions of Brush-Tailed Penguins (*Pygoscelis*)",
    subtitle = 'A scatter plot of bill depth versus bill length.',
    caption = "Data: Gorman, Williams & Fraser (2014) *PLoS ONE*",
    x = "**Bill Length** (mm)", 
    y = "**Bill Depth** (mm)",
    color = "Body mass (g)",
    fill = "Species"
  ) +
  ggforce::geom_mark_ellipse(
    aes(fill = species, label = species), 
    alpha = .15, show.legend = FALSE
  ) 

data(iris)
iris = janitor::clean_names(iris)

g1 = ggplot(iris, aes(x = sepal_width, y = sepal_length)) + 
  geom_point(aes(color = petal_width), alpha = .6, size = 3.5) +
  theme_minimal() +
  scico::scale_color_scico(palette = "bamako", direction = -1) 

g1

g2 = g1 + 
  labs(
    title = "Sepal and Petal dimensions of Iris",
    subtitle = 'A scatter plot of Sepal Length vs Sepal Width',
    caption = "Data: Iris flower dataset, Fisher, Anderson (1936)",
    x = "Sepal Length (cm)", 
    y = "Sepal Width (cm)",
    fill = "Species",
    color = "Petal Width (cm)"
    
  ) + 
  theme_minimal()

g2

g3 = g2 + 
  coord_cartesian(xlim = c(1, 6), ylim = c(4, 9)) +
  rcartocolor::scale_fill_carto_d(palette = "Bold")+
  ggforce::geom_mark_ellipse(
  aes(fill = species, label = species), 
  alpha = .15, show.legend = FALSE)


g3
















#################### time series

rm(list=ls())
library(dslabs)
data(gapminder)
head(gapminder)
library(tidyr)
library(janitor)











df_ch = gapminder %>% filter(country == "Switzerland")
df_ch$year = as.Date(as.character(df_ch$year), format = "%Y")

ggplot(df_ch, aes(year, life_expectancy)) +
  geom_line() +
  theme_minimal() +
  labs(
    title = "Life expectancy in Switzerland",
    caption = "Data: Gapminder, Hans Rosling",
    x = "Year (Year)", 
    y = "Life expectancy") + 
  scale_x_date(date_breaks = "5 year", date_labels = "%Y") +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0)),
        axis.title.x = element_text(margin = margin(t = 20, r = 0, b = 0, l = 0)))
  
  


gapminder %>%
  filter(country %in% c("Switzerland", "Canada", "China", 
                        "India", "Egypt", "Germany", "Nepal")) %>%
  group_by(year, country) %>%
  summarise(life_expectancy = mean(life_expectancy)) %>%
  ggplot(aes(x=year, y=life_expectancy, color=country)) +
  geom_line(size=1)+ 
  theme_minimal() +
  labs(
    title = "Evolution of Life expectancy per continent",
    caption = "Data: Gapminder, Gapminder Foundation",
    x = "Year", 
    y = "Life expectancy",
    color = "Continent"
  )
  




library(palmerpenguins)
data("penguins")
unique(penguins$island)





#### ammounts

data("ChickWeight")

