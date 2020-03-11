---
type: slides
---

# A simple example of control structures

---

<div style="text-align:center"><img src="comic_control_structure.jpg" alt=" " width="50%">


---

Suppose that we want to create some simple code to check if the weather can possibly get very cold today and, if this is the case, we should take a jacket. To write such a code, first we need to find out how cold it can possibly get today at our location, i.e. the minimum temperature.

```r
library(ROpenWeatherMap)
mykey = "607bc69cf2c29223a06b22580582a124"
data = get_current_weather(mykey, city="geneva")
min_temp = data$main$temp_min - 273.15
min_temp
```

```out
[1] -1.11
```

Then we can evaluate whether a jacket is needed or not.

```{r}
if (min_temp < 10){
  cat("You need a jacket!")
}else{
  cat("You don't need a jacket!")
}

```
```out
You need a jacket!
```

---