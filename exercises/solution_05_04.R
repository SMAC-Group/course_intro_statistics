library(renpow)
data("GlobTempAnom")
library(ggridges)
ggplot(GlobTempAnom, aes(Year, height = Avg, y = 0)) + 
  geom_ridgeline(color = "#0072B2", fill = "#0072B240", size = 0.75, min_height = -2) +
  scale_y_continuous(limits = c(-0.5, 1), expand = c(0, 0),
                     name = "Global Surface Temperature Anomaly ") + 
  hrbrthemes::theme_ipsum() +
  theme(plot.margin = margin(7, 7, 3, 1.5))