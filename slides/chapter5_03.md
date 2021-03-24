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

<div style="text-align:center"><img src="hist1.png" alt=" " width="30%"></div>


---

We may migth want to add a title and consider a simpler theme

```R
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Count") +
  geom_histogram() +
  theme_minimal() +
  ggtitle("Histogram of price")
```

<div style="text-align:center"><img src="hist2.png" alt=" " width="30%"></div>


---

We could also consider using a Kernel Density Estimate (KDE) to vizualise the estimated density

```R
ggplot(data=diamonds, aes(x=price)) +
  geom_density()
```


<div style="text-align:center"><img src="dens1.png" alt=" " width="30%"></div>


---

By specifying some additional parameters we obtain a better looking graph.

```R
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Density") +
  geom_density(adjust=1.5, alpha=.4, fill = "darkgrey") +
  theme_minimal() +
  ggtitle("Estimated density of price")
```

<div style="text-align:center"><img src="dens2.png" alt=" " width="30%"></div>


---

One could also consider visualizing this distribution with a KDE.

```R
ggplot(data=diamonds, aes(x=price)) +
  xlab("Price")+
  ylab("Density") +
  geom_density(adjust=1.5, alpha=.4, fill = "grey80") +
  theme_minimal() +
  ggtitle("Estimated density of price")
```





