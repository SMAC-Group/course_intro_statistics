---
type: slides
---

# Matrices, lists and dataframes

Notes: In this section, we will discuss different elements. You can find further information regarding: 
- Matrices [here](https://smac-group.github.io/ds/section-data.html#section-matrices)
- Lists [here](https://smac-group.github.io/ds/section-data.html#section-list)
- DataFrames [here](https://smac-group.github.io/ds/section-data.html#section-dataframe)

---

 <div align="center">
 <big> <b> Matrices </b> </big>
 </div> 


<div style="text-align:center"><img src="comic_matrix3.jpg" alt=" " width="40%">

---

We can use the `matrix()` function to create a matrix from a vector:

```r
(mat <- matrix(1:12, ncol = 4,  nrow = 3, byrow = TRUE))
```

```out
      [,1] [,2] [,3] [,4]
 [1,]    1    2    3    4
 [2,]    5    6    7    8
 [3,]    9   10   11   12
```

Notes: Here, the argument `byrow`	specifies that the matrix is filled by rows. Otherwise, the matrix is filled by columns by default. For example,

```r
(mat <- matrix(1:12, ncol = 4,  nrow = 3))
```
which will return:
```out
     [,1] [,2] [,3] [,4]
[1,]    1    4    7   10
[2,]    2    5    8   11
[3,]    3    6    9   12
```
---


It is often the case that we already have equi-dimensional vectors available and we wish to bundle them together as a matrix. In these cases, two useful functions are `cbind()`, which combines vectors as vertical columns side-by-side, and `rbind()`, which combines vectors as horizontal rows. Here is an example with `cbind()`:

```r
players <- c("Andy Murray", "Rafael Nadal", "Stan Wawrinka", 
             "Novak Djokovic", "Roger Federer")
grand_slam_win <- c(9, 15, 5, 12, 18)
win_percentage <- c(78.07, 82.48, 63.96, 82.77, 81.80)
(mat <- cbind(grand_slam_win, win_percentage))
```

```out
      grand_slam_win win_percentage
 [1,]              9          78.07
 [2,]             15          82.48
 [3,]              5          63.96
 [4,]             12          82.77
 [5,]             18          81.80
```

Notes: One can subset a given matrix based on a logical boolean condition. For example, let's say we want to keep only the rows for which the variable `win_percentage` is greater or equal to 80. We could proceed as follows:

```r
mat[mat[,2]>80,]
```
```out
     grand_slam_win win_percentage
[1,]             15          82.48
[2,]             12          82.77
[3,]             18          81.80
```

---

Once the matrix is defined, we can assign names to its rows and columns by using `rownames()` and `colnames()`, respectively.

```r
rownames(mat) <- players
colnames(mat) <- c("GS win", "Win rate")
mat
```

```out
                GS win Win rate
 Andy Murray         9    78.07
 Rafael Nadal       15    82.48
 Stan Wawrinka       5    63.96
 Novak Djokovic     12    82.77
 Roger Federer      18    81.80
```

---

One can also extract colnames or rownames from a matrix. For example, on could extract the rownames vector of the matrix defined in this slide with:

```r
colnames(mat)
```
```out
[1] "GS win"   "Win rate"
```


---

Similar to vectors, there are some useful functions that can be used for matrix operators as well. For example, `t()` returns a matrix transpose:

```r
(A <- matrix(1:8, 4, 2))
```
```out
      [,1] [,2]
 [1,]    1    5
 [2,]    2    6
 [3,]    3    7
 [4,]    4    8
```
```r
t(A)
```
```out
      [,1] [,2] [,3] [,4]
 [1,]    1    2    3    4
 [2,]    5    6    7    8
```

Notes: 
When we work with matrices and doing linear algebra, the function `dim` can be very useful in order to check the dimensions of matrices:

```r
?dim
```

```
dim {base}	R Documentation
Dimensions of an Object
Description
Retrieve or set the dimension of an object.
```

For example, 
```r
dim(A)
```
will return 
```out
[1] 4 2
```

---

We can also do matrix addition simply with `+`.
```r
(B = A+A)
```

```out
      [,1] [,2]
 [1,]    2   10
 [2,]    4   12
 [3,]    6   14
 [4,]    8   16
```
---

When we do matrix multiplication, we need to be more careful. Check the difference of the following two multiplications:

```r
A*A                # elementwise multiplication
```

```out
      [,1] [,2]
 [1,]    1   25
 [2,]    4   36
 [3,]    9   49
 [4,]   16   64
```

```r
(D = t(A)%*%A)     # regular matrix multiplication
```

```out
      [,1] [,2]
 [1,]   30   70
 [2,]   70  174
```

Notes: Recall that the matrix multiplication operation is defined as such. If If \\(\mathbf{A}\\) is an \\(m \times n\\) matrix and \\(\mathbf{B}\\) is an \\(n \times p\\) matrix, the matrix product \\(\mathbf{C}=\mathbf{A B}\\) (denoted without multiplication signs or dotined to be the \\(m \times p\\) such that \\(c_{i j}=a_{i 1} b_{1 j}+\cdots+a_{i n} b_{n j}=\sum_{k=1}^{n} a_{i k} b_{k j}\\).

---

In addition, the function `solve()` allows to inverse a matrix.

```r
(D_inv = solve(D))
```

```out
          [,1]     [,2]
 [1,]  0.54375 -0.21875
 [2,] -0.21875  0.09375
```

```r
round(D%*%D_inv, 14)
```

```out
      [,1] [,2]
 [1,]    1    0
 [2,]    0    1
```

```r
D%*%D_inv
```
```out
      [,1]          [,2]
 [1,]    1 -8.881784e-16
 [2,]    0  1.000000e+00
```

Notes: Recall that if \\(\mathbf{A}\\) is a matrix with a non-null determinant, then the inverse matrix noted \\(\mathbf{A}^{-1}\\) can be computed and the matrix product \\(\mathbf{A}\mathbf{A}^{-1}\\) = \\(\mathbf{I}\\), where \\(\mathbf{I}\\) is the identity matrix, a square matrix with ones on the main diagonal and zeros elsewhere.

You may notice that `D%*%D_inv` do not return exactly the \\(\mathbf{I}\\) matrix. There are some very tiny off-diagonal values (like `-8.881784e-16`). This is because computers don't have infinite precision, so there is a bit of floating-point error here.

---

We can also easily create a diagonal matrix with the function `diag()`:

```r
diag(c(1,1))
```

```out
      [,1] [,2]
 [1,]    1    0
 [2,]    0    1
```

---

An other example:

```r
n = 10
identity_mat = diag(rep(1,n))
identity_mat
```

```out
      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
 [1,]    1    0    0    0    0    0    0    0    0     0
 [2,]    0    1    0    0    0    0    0    0    0     0
 [3,]    0    0    1    0    0    0    0    0    0     0
 [4,]    0    0    0    1    0    0    0    0    0     0
 [5,]    0    0    0    0    1    0    0    0    0     0
 [6,]    0    0    0    0    0    1    0    0    0     0
 [7,]    0    0    0    0    0    0    1    0    0     0
 [8,]    0    0    0    0    0    0    0    1    0     0
 [9,]    0    0    0    0    0    0    0    0    1     0
[10,]    0    0    0    0    0    0    0    0    0     1
```

---

## Example: Portfolio Optimization

```r
# Load quantmod
library(quantmod)

# Download data
today <- Sys.Date()
five_years_ago <- seq(today, length = 2, by = "-5 year")[2]
getSymbols("AAPL", from = five_years_ago, to = today)
```

```out
[1] "AAPL"
```

```r
getSymbols("NFLX", from = five_years_ago, to = today)
```
```out
[1] "NFLX"
```

Notes: Find the documentation of the package `quantmod` "Quantitative Financial Modelling Framework" [here](https://cran.r-project.org/web/packages/quantmod/index.html).

---



```r
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

Notes: Note here that the object `Sigma` is the variance-covariance matrix of the two variable `Ra` and `Rn` and `mu` is the vector of both means. 

---

We can then compute the following financial summary:

```r
investment_summary <- matrix(NA, 2, 3)
dimnames(investment_summary)[[1]] <- c("Expected value", "Variance")
dimnames(investment_summary)[[2]] <- c("Apple", "Netflix", "Investment")
investment_summary[1, ] <- c(mu, mu_investment)
investment_summary[2, ] <- c(diag(Sigma), var_investment)
investment_summary
```

```out

                      Apple      Netflix   Investment
Expected value 0.0006760433 0.0016573827 0.0008455370
Variance       0.0003013552 0.0007005402 0.0002831629

```

---

We can also compare these investments graphically:

```r
# plot expected value of investment vs sd
plot(sqrt(investment_summary[2, ]), 
     investment_summary[1, ],
     ylab = "Daily Expected Value of Investment",
     xlab = "Daily Investment Standard Deviation", 
     pch = 19, cex = 1, lty = "solid", 
     lwd = 2, 
     xlim = c(min(sqrt(investment_summary[2, ])), max(sqrt(investment_summary[2, ])+3e-03)), 
     col = c(4,2,3))

# add grid
grid()

# add labels
text(sqrt(investment_summary[2, ]), 
     investment_summary[1, ], 
     labels = names(investment_summary[1, ]), cex= 0.7, pos = 4)
     
```

---

Which will returns the following plot:

<div style="text-align:center"><img src="plot_investement_2.png" alt=" " height="40%">





---


<div align="center">
<big> <b> Lists </b> </big>
</div> 


A list is one of the commonly used heterogeneous data structures. For example, here we create a list that contains different element types (numeric, character, logical, matrix).

```r
# List elements
num_vec <- c(188, 140)
char_vec <- c("Height", "Weight", "Length")
logic_vec <- rep(TRUE, 8)
my_mat <- matrix(0, nrow = 5, ncol = 5)
```

---


```r
# List initialization 
(my_list <- list(num_vec, char_vec, logic_vec, my_mat))
```

```out
 [[1]]
 [1] 188 140
 
 [[2]]
 [1] "Height" "Weight" "Length"
 
 [[3]]
 [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 
 [[4]]
      [,1] [,2] [,3] [,4] [,5]
 [1,]    0    0    0    0    0
 [2,]    0    0    0    0    0
 [3,]    0    0    0    0    0
 [4,]    0    0    0    0    0
 [5,]    0    0    0    0    0
```

Notes: One can check the dimensions of the list and its elements by the following commands:

```r
length(my_list)
```

```out
[1] 4
```

and

```r
 summary(my_list)
```

```out
     Length Class  Mode     
[1,]  2     -none- numeric  
[2,]  3     -none- character
[3,]  8     -none- logical  
[4,] 25     -none- numeric 

```

---



To extract/subset for the second vector (i.e. the vector of characters in this case) in the list, different from vector subsetting, we use double brackets `[[ ]]`.

```r
my_list[[2]]
```

```out
[1] "Height" "Weight" "Length"
```

```r
my_list[[2]][2]
```

```out
[1] "Weight"
```

```r
my_list[[4]][1,5]
```


```out
[1] 0
```

---


Additionally, it is possible to add named labels to the elements of your list.

```r
my_list <- list(number = num_vec, character = char_vec, 
                 logic = logic_vec, matrix = my_mat)
```

And equivalently we can subset the list based on the named labels.

```r
my_list$number
```

```out
[1] 188 140
```

```r
my_list[["number"]]
```

```out
[1] 188 140
```

---

When performing subsetting with list, always be careful with the use of brackets. Check the difference of using `[[ ]]` and `[ ]`:

```r
my_list[[1]]  
```

```out
[1] 188 140
```
```r
my_list[1]
```

```out
$number
 [1] 188 140
```

```r
typeof(my_list[[1]])
```

```out
[1] "double"
```

```r
typeof(my_list[1])
```

```out
[1] "list"
```

---

```r
my_list[[1]] + 1
```

```out
[1] 189 141
```
```r
my_list[1]$number + 1
```


```out
[1] 189 141
```


```r
my_list[1] + 1
```

```out
Error in my_list[1] + 1 : 
  non-numeric argument to binary operator
```
Notes: You may notice that the first two command work because I subset the number `189 140` for both commands `my_list[[1]]` and `my_list[1]$number` while `my_list[1]` subset a list. 

Indeed, 
```r
class(my_list[[1]])
``` 

and 

```r
class(my_list[1]$number)
``` 

returns 
```out
[1] numeric
```

while 

```r
class(my_list[1])

```

returns 

```out
[1] "list"
```


---

<div align="center">
<big> <b> Dataframes </b> </big>
</div> 


We can create a data frame using `data.frame()`.

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
```

---

We then print the following dataframe:

```r
tennis
```

```out
                date_of_birth grand_slam_win       country ATP_ranking
 Andy Murray      15 May 1987              9 Great Britain           1
 Rafael Nadal     3 June 1986             15         Spain           2
 Stan Wawrinka  28 March 1985              5   Switzerland           3
 Novak Djokovic   22 May 1987             12        Serbia           4
 Roger Federer  8 August 1981             18   Switzerland           5
                prize_money
 Andy Murray       60449649
 Rafael Nadal      85920132
 Stan Wawrinka     30577981
 Novak Djokovic   109447408
 Roger Federer    104445185
```

---

You can always subset elements and vectors of elements from a dataframe. For example:

```r
tennis$date_of_birth
```

will returns
```out
[1] 15 May 1987   3 June 1986   28 March 1985 22 May 1987   8 August 1981
Levels: 15 May 1987 22 May 1987 28 March 1985 3 June 1986 8 August 1981

```
and

```r
tennis[1,]
```

will returns

```out
            date_of_birth grand_slam_win       country ATP_ranking prize_money
Andy Murray   15 May 1987              9 Great Britain           1    60449649
```

---


## Example: Maps



Now we continue with our tennis players example and create a dataframe to store all information related to the tennis players of interest:

```r
birth_place <- c("Glasgow, Scotland", "Manacor, Spain", "Lausanne, Switzerland", "Belgrade, Serbia", "Basel, Switzerland")
lon = c(-4.251806,  3.209532  ,6.632273, 20.448922,  7.588576)
lat = c(55.86424, 39.56972 ,46.51965 ,44.78657, 47.55960)
birth_coord = data.frame(cbind(lon, lat))
players <- c("Andy Murray", "Rafael Nadal", "Stan Wawrinka", 
             "Novak Djokovic", "Roger Federer")
grand_slam_win <- c(9, 15, 5, 12, 18)
birth_coord$Players <- players
birth_coord$GS <- grand_slam_win
birth_coord$City = birth_place
```

Notes: You can obtain lattitude and longitude from a specific point in `R` using the different services like Bing or Google Maps. However, you will generally needs to register to the given service and enable access to its API with an account. Using Google map the procedure is the following:

- Request an API access key [here](https://console.cloud.google.com)
- Register your your personnal API key in `R`with 

```r
library(ggmap)
register_google(key = "your key here") 
```

- The geocode() function will return the latitude and longitude of a location using the Google Geocoding API.

```r
unimail_coord <- geocode("Unimail, Geneva", source = "google")
unimail_coord
```

```out
  A tibble: 1 x 2
    lon   lat
  <dbl> <dbl>
1  6.14  46.2
```


---


```r
birth_coord
```

```out
        lon      lat        Players GS                  City
1 -4.251806 55.86424    Andy Murray  9     Glasgow, Scotland
2  3.209532 39.56972   Rafael Nadal 15        Manacor, Spain
3  6.632273 46.51965  Stan Wawrinka  5 Lausanne, Switzerland
4 20.448922 44.78657 Novak Djokovic 12      Belgrade, Serbia
5  7.588576 47.55960  Roger Federer 18    Basel, Switzerland
```

---

We can now plot a map with the 
```r
# plot map
library(leaflet)
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addCircleMarkers(lng=birth_coord$lon, lat=birth_coord$lat,
  radius = birth_coord$GS*1.5)
m  # Print the map
```
<div style="text-align:center"><img src="img_map_player.png" alt=" " height="35%" width="35%">



---

Then we can create a dataframe to store all information related to the tennis players of interest:

```r
players <- c("Andy Murray", "Rafael Nadal", "Stan Wawrinka", 
             "Novak Djokovic", "Roger Federer")
grand_slam_win <- c(9, 15, 5, 12, 18)

birth_coord$Players <- players
birth_coord$GS <- grand_slam_win
birth_coord
```

```out
 # A tibble: 5 x 4
     lon   lat Players           GS
   <dbl> <dbl> <chr>          <dbl>
 1 -4.25  55.9 Andy Murray        9
 2  3.21  39.6 Rafael Nadal      15
 3  6.63  46.5 Stan Wawrinka      5
 4 20.4   44.8 Novak Djokovic    12
 5  7.59  47.6 Roger Federer     18
```

```r
is.data.frame(birth_coord)
```

```out
[1] TRUE
```

---

Let’s represent this information graphically. We haven’t seen how to make graph yet so don’t worry too much about the details of how this graph is made.

```r
library(mapproj)
map <- get_map(location = 'Switzerland', zoom = 4)
ggmap(map) + geom_point(data = birth_coord, 
             aes(lon, lat, col = Players, size = GS)) + 
             scale_size(name="Grand Slam Wins") + 
             xlab("Longitude") + ylab("Latitude")

```

<div style="text-align:center"><img src="fig4.png" alt=" " height="40%" width="60%">
