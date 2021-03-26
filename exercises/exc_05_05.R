library(gganimate)
library(gifski)
library(gganimate)
myanim = ___(___, aes(x = ___, y = bill_depth_mm)) +
  geom_point(aes(color = ___, group = 1), alpha = .6, size = 3.5) + 
  ## custom axes scaling
  ___(breaks = 3:6 * 10, limits = c(30, 60)) +
  scale_y_continuous(breaks = seq(12.5, 22.5, by = 2.5), limits = c(12.5, 22.5)) +
  ## custom labels
  labs(
    title = 'A good title!',
    ___ = 'A nice subtitle',
    ___ = 'where the data are coming from...',
    x = 'Bill Length (mm)', 
    y = 'Bill Depth (mm)',
    color = 'Species'
  ) + hrbrthemes::theme_ipsum() +
  ___(___, state_length = 1)