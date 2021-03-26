---
type: slides
---

# Visualizing distributions

---

When considering continuous numerical variable, we typically want to visualize its distribution. As an example, let's consider the `diamonds` dataset in the `ggplot2` package and the variable of the price of the diamonds (`price`). 

```R
ggplot(data=diamonds, aes(x=price)) +
    geom_histogram() +
    xlab("Price")
```

---

<div style="text-align:center"><img src="hist1.png" alt=" " width="45%"></div>


---

To improve the graph, we can add a title and consider a simpler theme. We can also increase the distance and size of axis labels.

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

Let's try to modify the graphs by considering a large number of bins. 

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
As we can see, the previous histogram considers an extremely large number of bins, leading to a very wiggly density curve. Now let's consider the other extreme where only a very small amount of bins are considered. We will see that with a lack of bins, the density of the variable is harder to identify, although it looks much smoother.

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

We can also consider a Kernel Density Estimate (KDE) to visualize the estimated density.

```R
ggplot(data=diamonds, aes(x=price)) +
  geom_density()
```

---

<div style="text-align:center"><img src="dens1.png" alt=" " width="35%"></div>


---

We can again change the theme, add a centered title and specify a color with some transparency level. We can again increase the distance and size of axis labels.

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

We can consider the KDE with differnt bandwidth. For example, we first consider a KDE with an extremely small bandwidth (analogous to the histogram with 200 bins). The density, as expected, appears very wiggly although it highly approximates the data. 

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

On the other hand, we can consider a relatively large bandwidth (analogous to the histogram with 5 bins). We can see that the estimated density appears much smoother yet showing big bias in estimation, resulting in a poor approximation of the density. 


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




