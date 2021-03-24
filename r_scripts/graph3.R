library(palmerpenguins)
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
  mutate(species_num = as.numeric(fct_rev(species))) 

ggplot(data=df_peng_stats, aes(x=bill_ratio, group=species, fill=species)) +
  geom_density(alpha=0.6) +
  scale_fill_manual(values = c("#3d6721", "#a86826", "#006c89"))  + 
  xlab("Bill ratio") + ylab("Density")

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

g3 = g2 + +
  coord_cartesian(clip = "off", expand = FALSE) +
  scale_x_continuous(
    limits = c(1.6, 3.8),
    breaks = seq(1.6, 3.8, by = .2)
  )+
  scale_y_continuous(
    limits = c(.55, NA),
    breaks = 1:3,
    labels = c("Gentoo", "Chinstrap", "Adélie")
  ) +
  scale_color_manual(values = c("#3d6721", "#a86826", "#006c89"), guide = "none") +
  scale_fill_manual(values = c("#3d6721", "#a86826", "#006c89"), guide = "none") 

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



























# Plot
ggplot(penguins, aes(x = bill_length_mm, y = species, fill = ..x..)) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8)
  )


















# Plot
library(ggridges)
ggplot(penguins, aes(x=bill_length_mm, group=species, fill=species)) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  scale_fill_viridis(name = "Temp. [F]", option = "C") +
  labs(title = 'Temperatures in Lincoln NE in 2016') +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8)
  )


# first plot
ggplot(data=penguins, aes(x=bill_length_mm, y=species, fill=species)) +
  geom_density(adjust=1.5, alpha = .6) +
  facet_wrap(~species) +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    axis.ticks.x=element_blank()
  ) +
  scale_fill_manual(values = c("#3d6721", "#a86826", "#006c89"), guide = "none") 


# basic example
ggplot(diamonds, aes(x = price, y = cut, fill = cut)) +
  geom_density_ridges() +
  theme_ridges() + 
  theme(legend.position = "none")
 
  
  library(viridis)
  library()
    
      
  