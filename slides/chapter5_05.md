---
  type: slides
---
# Visualizing relationship between numerical variables

---

Let us consider the `iris` dataset available in base `R`. You can find a detailled description of the dataset [here](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html).


```R
data(iris)
library(ggplot2)
library(janitor)
head(iris)
``` 



```out
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
``` 


---

We often use scatterplot to represent relationship between numerical values.

```R
iris = clean_names(iris)
g1 = ggplot(iris, aes(x = sepal_width, y = sepal_length)) + 
  geom_point(aes(color = petal_width), alpha = .6, size = 3.5) +
  theme_minimal() +
  scico::scale_color_scico(palette = "bamako", direction = -1) 

g1
``` 

---

<div style="text-align:center"><img src="sct1.png" alt=" " width="40%"></div>


---

```R
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


``` 

---

<div style="text-align:center"><img src="sct2.png" alt=" " width="40%"></div>


---
```R
library(rcartocolor)
library(ggforce)
g3 = g2 + 
  coord_cartesian(xlim = c(1, 6), ylim = c(4, 9)) +
  scale_fill_carto_d(palette = "Bold")+
  geom_mark_ellipse(
  aes(fill = species, label = species), 
  alpha = .15, show.legend = FALSE)


g3
``` 

---

<div style="text-align:center"><img src="sct3.png" alt=" " width="40%"></div>

  
---

```R
library(magick)
iris_png = image_read("https://raw.githack.com/SMAC-Group/course_intro_ds/master/img/iris2.png")
img_iris_png = grid::rasterGrob(iris_png, interpolate = TRUE)
g4 = g2 + 
  coord_cartesian(xlim = c(1.5, 4.75), ylim = c(2.5, 9)) +
  rcartocolor::scale_fill_carto_d(palette = "Bold")+
  ggforce::geom_mark_ellipse(
    aes(fill = species, label = species), 
    alpha = .10, show.legend = FALSE) + theme(legend.position = "top") +
  guides(color = guide_colorbar(title.position = "top", 
                                title.hjust = .5, 
                                barwidth = unit(20, "lines"), 
                                barheight = unit(.5, "lines"))) +
  annotation_custom(img_iris_png, ymin = 2.5, ymax = 5.5, xmin = 3.95, xmax = 5.45)
g4
```

---
  

<div style="text-align:center"><img src="scatterimg.png" alt=" " width="40%"></div>

  
  