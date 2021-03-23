library(ggplot2)
library(poliscidata)
ggplot(world) +
  aes(x = regionun, y = lifeex_total) +
  geom_boxplot(fill = "#969696") +
  labs(x = " ", y = "Life expectancy") +
  theme_minimal()