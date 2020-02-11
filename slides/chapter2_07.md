---
type: slides
---

# Dataframes

---

We can create a data frame using data.frame()

```r
### Creation

players <- c("Andy Murray", "Rafael Nadal", "Stan Wawrinka", 
             "Novak Djokovic", "Roger Federer")

grand_slam_win <- c(9, 15, 5, 12, 18)

date_of_birth <- c("15 May 1987", "3 June 1986", "28 March 1985", 
                  "22 May 1987", "8 August 1981")

country <- c("Great Britain", "Spain", "Switzerland", 
            "Serbia", "Switzerland")
ATP_ranking <- c(1, 2, 3, 4, 5)

prize_money <- c(60449649, 85920132, 30577981, 109447408, 104445185)

tennis <- data.frame(date_of_birth, grand_slam_win, country, 
                    ATP_ranking, prize_money)

dimnames(tennis)[[1]] <- players
tennis
```

---


## Example: Maps

Please refer to the piazza post to see how to obtain a Google API key for map services. You may need the following code to activate your API key from R:

```{r, eval=FALSE}
library(ggmap)
register_google(key = "your key here") 
```

Notes : As the Google API key is related to the personal google account, the API key used to illustrate in the textbook is not shown here, and therefore, the following code is not evaluated. By inputting your personal Google API key to the above code, you should be able to run the following code and obtain desirable results. 


After registering the API key from R, you can start to play with the map services as follows. The `geocode()` function will return the latitude and longitude of a location using the Google Geocoding API. For example, we can locate Uni-Mail using the following code:

```{r, eval=FALSE}
unimail_coord <- geocode("Unimail, Geneva", source = "google")
```

Now we continue with our tennis players example:

```{r, eval=FALSE}
birth_place <- c("Glasgow, Scotland", "Manacor, Spain", "Lausanne, Switzerland", "Belgrade, Serbia", "Basel, Switzerland")
birth_coord <- geocode(birth_place, source = "google")
```

Then we can create a dataframe to store all information related to the tennis players of interest:

```{r, eval=FALSE}
players <- c("Andy Murray", "Rafael Nadal", "Stan Wawrinka", 
             "Novak Djokovic", "Roger Federer")
grand_slam_win <- c(9, 15, 5, 12, 18)

birth_coord$Players <- players
birth_coord$GS <- grand_slam_win
birth_coord
is.data.frame(birth_coord)
```

Let's represent this information graphically. We haven't seen how to make graph yet so don't worry too much about the details of how this graph is made.

```{r, eval=FALSE}
library(mapproj)
map <- get_map(location = 'Switzerland', zoom = 4)
ggmap(map) + geom_point(data = birth_coord, 
             aes(lon, lat, col = Players, size = GS)) + 
             scale_size(name="Grand Slam Wins") + 
             xlab("Longitude") + ylab("Latitude")
```


