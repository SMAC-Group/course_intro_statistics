---
type: slides
---

# Visualizing distributions

---

When considering continuous numerical variable, you may to visualize the distribution of the data. Let's consider the price of diamonds in the dataset `diamonds` (`price`). 

```R
ggplot(data=diamonds, aes(x=price)) +
    geom_histogram() +
    xlab("Price")
```

---

<div style="text-align:center"><img src="hist1.png" alt=" " width="50%"></div>


---

We add a title and consider a simpler theme. We alos increase distance and size of axis labels.

```R
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Count") +
  geom_histogram() +
  theme_minimal() +
  ggtitle("Histogram of price") +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
        )
```

---

<div style="text-align:center"><img src="hist2.png" alt=" " width="50%"></div>


---

```R
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Count") +
  geom_histogram(bins = 200) +
  theme_minimal() +
  ggtitle("Histogram of price") +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
        )
```


---

<div style="text-align:center"><img src="histbin200.png" alt=" " width="50%"></div>

---

```R
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Count") +
  geom_histogram(bins = 5) +
  theme_minimal() +
  ggtitle("Histogram of price") +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
        )
        
```


---

<div style="text-align:center"><img src="histbin5.png" alt=" " width="50%"></div>



---

We could also consider using a Kernel Density Estimate (KDE) to vizualise the estimated density

```R
ggplot(data=diamonds, aes(x=price)) +
  geom_density()
```

---

<div style="text-align:center"><img src="dens1.png" alt=" " width="55%"></div>


---

We change the theme, add a centered title and specify a color with some transparency value. We also increase distance and size of axis labels.

```R
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Density") +
  geom_density(adjust=1.5, alpha=.4, fill = "darkgrey") +
  theme_minimal() +
  ggtitle("Estimated density of price")  + 
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
        )
```

---

<div style="text-align:center"><img src="dens2.png" alt=" " width="55%"></div>

---

We can consider varying the bandwidth of the kernel estimator in the KDE plot.

```R
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Density") +
  geom_density(adjust=.1, alpha=.4, fill = "darkgrey") +
  theme_minimal() +
  ggtitle("Estimated density of price")  + 
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
        )
```



---

<div style="text-align:center"><img src="largekde.png" alt=" " width="55%"></div>

---

Similarly


```R
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Density") +
  geom_density(adjust=20, alpha=.4, fill = "darkgrey") +
  theme_minimal() +
  ggtitle("Estimated density of price")  + 
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 30, b = 0, l = 0), size = 15),
        axis.title.x = element_text(margin = margin(t = 40, r = 0, b = 0, l = 0), size = 15)
        )
```



---

<div style="text-align:center"><img src="smallkde.png" alt=" " width="55%"></div>




