---
title: 'Chapter 2: Data Structures'
description:
  'Understand how to organizing data so that it can be used effectively. '
prev: /chapter1
next: /chapter3
type: chapter
id: 2
---


<exercise id="1" title="General Information">

In this chapter we will consider an introduction to Data Structure with `R`

</exercise>


<exercise id="2" title="Introduction to vectors" type = "slides">

<slides source="chapter2_01"> 
</slides>


</exercise>

<exercise id="3" title="Subsetting">

<slides source="chapter2_02"> 
</slides>

</exercise>

<exercise id="4" title="Attributes">

<slides source="chapter2_03"> 
</slides>


</exercise>

<exercise id="5" title="Simple functions for vectors">

<slides source="chapter2_03_01"> 
</slides>


</exercise>

<exercise id="6" title="Making sequences">

## Making Sequences

<slides source="chapter2_04"> 
</slides>

</exercise>

<exercise id="7" title="Matrices">


## Matrices

We can use the `matrix()` function to create a matrix from a vector:

```r
(mat <- matrix(1:12, ncol = 4,  nrow = 3, byrow = TRUE))
```

It is often the case that we already have equi-dimensional vectors available and we wish to bundle them together as a matrix. In these cases, two useful functions are `cbind()` to combine vectors as vertical columns side-by-side, and `rbind()` to combine vectors as horizontal rows. Here is an example with `cbind()`:

```r
players <- c("Andy Murray", "Rafael Nadal", "Stan Wawrinka", 
             "Novak Djokovic", "Roger Federer")
grand_slam_win <- c(9, 15, 5, 12, 18)
win_percentage <- c(78.07, 82.48, 63.96, 82.77, 81.80)
(mat <- cbind(grand_slam_win, win_percentage))
```

Once the matrix is defined, we can assign names to its rows and columns by using `rownames()` and `colnames()`, respectively.

```r
rownames(mat) <- players
colnames(mat) <- c("GS win", "Win rate")
mat
```

As with vectors, there are some useful functions that can be used for matrix operators. For example, `t()` returns a matrix transpose:

```r
(A_char = matrix(c("a","b","c","d"),2, 2))
(A <- matrix(1:8, 4, 2))
t(A)
```

We can also do matrix addition simply with `+`.
```r
(B = A+A)
```

When we do matrix multiplication, we need to be more careful. Check the difference of the following two multiplications:

```r
A*A                # elementwise multiplication
(D = t(A)%*%A)     # regular matrix multiplication
```

In addition, the function `solve()` allows to inverse a matrix.

```r
(D_inv = solve(D))
round(D%*%D_inv, 14)
D%*%D_inv
```

We can also easily create a diagonal matrix with the function `diag()`:

```r
diag(c(1,1))
```


## Example: Portfolio Optimization

```r
# Load quantmod
library(quantmod)

# Download data
today <- Sys.Date()
five_years_ago <- seq(today, length = 2, by = "-5 year")[2]
getSymbols("AAPL", from = five_years_ago, to = today)
getSymbols("NFLX", from = five_years_ago, to = today)

# Compute returns
Ra <- na.omit(ClCl(AAPL))
Rn <- na.omit(ClCl(NFLX)) 

# Estimation of mu and Sigma
Sigma <- cov(cbind(Ra, Rn))
mu <- c(mean(Ra), mean(Rn))

# Compute omega^*
omega_star <- (Sigma[2, 2] - Sigma[1, 2])/(Sigma[1, 1] + Sigma[2, 2] - 2*Sigma[1, 2])

# Compute investment expected value and variance
mu_investment <- omega_star*mu[1] + (1 - omega_star)*mu[2]
var_investment <- omega_star^2*Sigma[1,1] + (1 - omega_star)^2*Sigma[2,2] +
  2*omega_star*(1 - omega_star)*Sigma[1,2]
```

</exercise>


<exercise id="8" title="Lists">

## List

A list is one of the commonly used heterogeneous data structures. For example, here we create a list that contains different element types (numeric, character, logical, matrix).

```r
# List elements
num_vec <- c(188, 140)
char_vec <- c("Height", "Weight", "Length")
logic_vec <- rep(TRUE, 8)
my_mat <- matrix(0, nrow = 5, ncol = 5)

# List initialization 
(my_list <- list(num_vec, char_vec, logic_vec, my_mat))
```

To extract/subset for the second vector (i.e. the vector of characters in this case) in the list, different from vector subsetting, we use double brackets `[[ ]]`.

```r
my_list[[2]]
my_list[[2]][2]
my_list[[4]][1,5]
```

Additionally, it is possible to add named labels to the elements of your list.

```r
my_list <- list(number = num_vec, character = char_vec, 
                 logic = logic_vec, matrix = my_mat)
```

And equivalently we can subset the list based on the named labels.

```r
my_list$number
my_list[["number"]]
```

When performing subsetting with list, always be careful with the use of brackets. Check the difference of using `[[ ]]` and `[ ]`:

```r
my_list[[1]]  
my_list[1]    

typeof(my_list[[1]])
typeof(my_list[1])

my_list[[1]] + 1
```

```{r, eval=FALSE}
my_list[1] + 1
```


</exercise>





<exercise id="9" title="Dataframes">


## Dataframes

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


## Example: Maps

Please refer to the piazza post to see how to obtain a Google API key for map services. You may need the following code to activate your API key from R:

```{r, eval=FALSE}
library(ggmap)
register_google(key = "your key here") 
```

<div class="alert alert-info">
  <strong> Note: As the Google API key is related to the personal google account, the API key used to illustrate in the textbook is not shown here, and therefore, the following code is not evaluated. By inputting your personal Google API key to the above code, you should be able to run the following code and obtain desirable results. 
</div>

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



</exercise>


<exercise id="10" title="Exercises">

<codeblock id="01_03">

This is a hint.

</codeblock>
</exercise>
