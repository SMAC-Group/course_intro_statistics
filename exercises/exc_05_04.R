library(renpow)
data("GlobTempAnom")
library(ggridges)
ggplot(___, aes(___, height = ___, y = 0)) + 
  geom_ridgeline(color = "#0072B2", fill = "#0072B240", size = 0.75, min_height = -2) +
  ___(limits = c(-0.5, 1), expand = c(0, 0),
      name = ___) + 
  hrbrthemes::theme_ipsum() +
  ___(plot.margin = margin(7, 7, 3, 1.5))