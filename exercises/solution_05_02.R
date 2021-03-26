library(palmerpenguins)
library(hrbrthemes)
library(ggplot2)
library(scico)
ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point(aes(color = body_mass_g, shape = species), alpha = .6, size = 3.5) + 
  ## custom axes scaling
  scale_x_continuous(breaks = 3:6 * 10, limits = c(30, 60)) +
  scale_y_continuous(breaks = seq(12.5, 22.5, by = 2.5), limits = c(12.5, 22.5)) +
  ## custom colors
  scale_color_scico(palette = "bamako", direction = -1) +
  ## custom labels
  labs(
    title = 'A good title!',
    subtitle = 'A nice subtitle',
    caption = 'where the data are coming from...',
    x = 'Bill Length (mm)', 
    y = 'Bill Depth (mm)',
    color = 'Body mass (g)',
    shape = 'Species'
  ) + theme_ipsum()  