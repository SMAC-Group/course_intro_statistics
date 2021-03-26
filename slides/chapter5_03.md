---
type: slides
---

# Visualizing distributions

---

When we work with continuous numerical variable, we typically want to visualize and understand how it is distributed in a dataset. As an example, let's consider the `diamonds` dataset in the `ggplot2` package. We want to visualize the distribution of the price of the diamonds (`price`) with a histogram. The heights of the histogram correspond to the counts and the widths correspond to the width of the price. 

```R
ggplot(data=diamonds, aes(x=price)) +
    geom_histogram() +
    xlab("Price")
```

---

<div style="text-align:center"><img src="hist1.png" alt=" " width="45%"></div>


---

To improve the graph, we can add a title and use a simpler theme. We can also add colors to the bins, increase the distance between bins, and increase the size of axis labels.

```R
library(ggplot2)
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Count") +
  geom_histogram(fill = "#56B4E9", colour = "white") +
  theme_minimal() +
  ggtitle("Histogram of price") +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
        )
```

---

<div style="text-align:center"><img src="hist2.png" alt=" " width="35%"></div>


---

As a histogram is generated with bins of data, its visual appearance strongly relies on the bin width, or equivalently the number of bins plotted. In most cases, `R` generates a histogram by choosing a default bin width. However, sometimes the considered bin width may not be the most appropriate and we can therefore customize it. It is important to try different bin widths and check if the resulting histograms accurately reflect the data. 

Let's try to modify the graphs by considering a large number of bins (so very small bin width). 

```R
library(ggplot2)
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Count") +
  geom_histogram(fill = "#56B4E9", colour = "white", bins = 200) +
  theme_minimal() +
  ggtitle("Histogram of price") +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
        )
```


---

<div style="text-align:center"><img src="histbin200.png" alt=" " width="35%"></div>

---
As we can see, the previous histogram considers an extremely large number of bins. As a result, the histogram becomes very wiggly and the main trends of the data are obscured. Now let's consider the other extreme where only a very small amount of bins are considered. We will see that with a large bin width, the histogram appears much smoother, yet some smaller features in the distribution of the data may disappear. 

```R
library(ggplot2)
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Count") +
  geom_histogram(fill = "#56B4E9", colour = "white", bins = 5) +
  theme_minimal() +
  ggtitle("Histogram of price") +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
        )
        
```


---

<div style="text-align:center"><img src="histbin5.png" alt=" " width="35%"></div>



---

Alternatively, we can visualize the underlying distribution of the variable by drawing an appropriate continuous curve, which is estimated from the data. There are many methods to estimate a density curve, and one of the most commonly used ones is called the Kernel Density Estimate (KDE). Let's first have a look at the default KDE computed based on our data. 

```R
ggplot(data=diamonds, aes(x=price)) +
  geom_density()
```

---

<div style="text-align:center"><img src="dens1.png" alt=" " width="35%"></div>


---

We can again change the theme, add a centered title and specify a color with some transparency level. We can again increase the distance between bins and the size of axis labels.

```R
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Density") +
  geom_density(adjust=1.5, alpha=.4, fill = "#56B4E9", color="darkblue") +
  theme_minimal() +
  ggtitle("Estimated density of price")  + 
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
        )
```

---

<div style="text-align:center"><img src="dens2.png" alt=" " width="35%"></div>

---

Like with histograms, the visualization of a KDE graph depends on the choices of bandwidth. The bandwidth parameter behaves similarly to the bin width in histograms. We can consider the KDE with differnt bandwidth. For example, we first consider a KDE with an extremely small bandwidth (analogous to the histogram with 200 bins). The density, as expected, appears very wiggly although it highly approximates the data. In this case, the density curve becomes overly peaky and visually busy, losing the main trends in the data.

```R
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Density") +
  geom_density(adjust=.1, alpha=.4, fill = "#56B4E9", color="darkblue") +
  theme_minimal() +
  ggtitle("Estimated density of price")  + 
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
        )
```



---

<div style="text-align:center"><img src="largekde.png" alt=" " width="35%"></div>

---

On the other hand, we can consider a relatively large bandwidth (analogous to the histogram with 5 bins). We can see that the estimated density appears much smoother yet may lose some small features in the distribution of the data. Therefore, like in histograms, it is important to try different bandwidth for the most appropriate estimation of the density curve. 


```R
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Density") +
  geom_density(adjust=20, alpha=.4, fill = "#56B4E9", color="darkblue") +
  theme_minimal() +
  ggtitle("Estimated density of price")  + 
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
        )
```



---

<div style="text-align:center"><img src="smallkde.png" alt=" " width="35%"></div>




