library(palmerpenguins)
library(hrbrthemes)
library(ggplot2)
library(scico)
library(magick)
counts_penguins = data.frame(species = names(table(penguins$species)), count = as.numeric(table(penguins$species)))

adelie = magick::image_read("https://raw.githack.com/SMAC-Group/course_intro_ds/master/img/adelie.png")
img_adelie = grid::rasterGrob(adelie, interpolate = TRUE)
chinestrap = magick::image_read("https://raw.githack.com/SMAC-Group/course_intro_ds/master/img/chinestrap.png")
img_chinestrap = grid::rasterGrob(chinestrap, interpolate = TRUE)
gentoo = magick::image_read("https://raw.githack.com/SMAC-Group/course_intro_ds/master/img/gentoo.png")
img_gentoo = grid::rasterGrob(gentoo, interpolate = TRUE)
ggplot(___) +
  aes(x = reorder(___, count), y = count, fill = ___) +
  geom_bar(stat = "identity", width = .7) +
  ___(ylim = c(0, 200)) +
  theme_minimal() +
  xlab("") +
  ylab("")+
  geom_text(stat='identity', aes(label = ___), hjust=1.4, col ="white", size = 5)+
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    axis.text = element_text(size = 13),
    axis.text.y = element_text( color="black", 
                                size=14)
  ) + ___(values = c("Adelie" = "#3d6721", 
                                   "Gentoo" = "#006c89", 
                                   "Chinstrap" = "#a86826")) +
  ___(img_adelie, ymin = 153, ymax = 172, xmin = 2.5, xmax = 3.5) +
  annotation_custom(img_gentoo, ymin = 128, ymax = 147, xmin = 1.5, xmax = 2.5) +
  annotation_custom(___, ymin = 78, ymax = 97, xmin = 0.5, xmax = 1.5) +
  theme(legend.position="none")