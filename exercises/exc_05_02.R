library(palmerpenguins)
library(hrbrthemes)
library(ggplot2)
library(scico)
ggplot(___, aes(x = ___, y = bill_depth_mm)) +
  geom_point(aes(color = ___, shape = ___), alpha = .6, size = 3.5) + 
  ## custom axes scaling
  scale_x_continuous(breaks = 3:6 * 10, limits = c(30, 60)) +
  ___(breaks = seq(12.5, 22.5, by = 2.5), limits = c(12.5, 22.5)) +
  ## custom colors
  scale_color_scico(palette = "bamako", direction = -1) +
  ## custom labels
  labs(
    title = ___,
    subtitle = 'A nice subtitle',
    caption = 'where the data are coming from...',
    x = 'Bill Length (mm)', 
    y = ___,
    color = 'Body mass (g)',
    shape = ___
  ) + theme_ipsum()  