rm(list=ls())
library(poliscidata)
library(ggplot2)
library(magrittr)
library(dplyr)
data(world)
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


ggplot(df_sub) +
  aes(x = reorder(country, debt), y = debt) +
  geom_segment( aes(x=reorder(country, debt), xend=country, y=0, yend=debt)) +
  geom_point( color="black", size=2, alpha=0.6) +
  coord_flip() +
  theme_minimal() + 
  theme(axis.text.y = element_text(size = 5)) +
  xlab("Country") +
  ylab("Public debt as a percentage of GDP")


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


ggplot(data = world, aes(x = gdp_10_thou, y = Life expectancy, 
                         color = World Region, shape = oecd)) +
  geom_point() +
  ylab("Life expectancy") +
  xlab("GDP per capita 10K US$") +
  ggtitle("Life expectancy vs GDP per capita") +
  theme_minimal() 










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
