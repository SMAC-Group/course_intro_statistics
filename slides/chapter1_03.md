---
type: slides
---

# Matrices, Lists and DataFrames

---

 <div align="center">
 <big> <b> Matrices </b> </big>
 </div> 


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

Notes: Here, the argument `byrow`	specifies that the matrix is filled by rows. Otherwise, the matrix is filled by columns.

---


It is often the case that we already have equi-dimensional vectors available and we wish to bundle them together as a matrix. In these cases, two useful functions are `cbind()` to combine vectors as vertical columns side-by-side, and `rbind()` to combine vectors as horizontal rows. Here is an example with `cbind()`:

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

Notes: One can also extract colnames or rownames from a matrix. For example, on could extract the rownames vector of the matrix defined in this slide with:

```r
colnames(mat)
```
```out
[1] "GS win"   "Win rate"
```


---


As with vectors, there are some useful functions that can be used for matrix operators. For example, `t()` returns a matrix transpose:

```r
(A_char = matrix(c("a","b","c","d"),2, 2))
```
```out
      [,1] [,2]
 [1,] "a"  "c" 
 [2,] "b"  "d"
```
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

Notes: Recall that the matrix multiplication operation is defined as such. If If \\(\mathbf{A}\\) is an \\(m \times n\\) matrix and \\(\mathbf{B}\\) is an \\(n \times p\\) matrix, the matrix product \\(\mathbf{C}=\mathbf{A B}\\) (denoted without multiplication signs or dotined to be the \\(m \times p\\) such that \\(c_{i j}=a_{i 1} b_{1 j}+\cdots+a_{i n} b_{n j}=\sum_{k=1}^{n} a_{i k} b_{k j}\\)

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
my_list[1] + 1
```

```out
Error in my_list[1] + 1 : 
  non-numeric argument to binary operator
```

---

<div align="center">
<big> <b> Dataframes </b> </big>
</div> 


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
```

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


## Example: Maps

Please refer to the piazza post to see how to obtain a Google API key for map services. You may need the following code to activate your API key from R:

```r
library(ggmap)
register_google(key = "your key here") 
```


Notes: As the Google API key is related to the personal google account, the API key used to illustrate in the textbook is not shown here, and therefore, the following code is not evaluated. By inputting your personal Google API key to the above code, you should be able to run the following code and obtain desirable results. 

---

After registering the API key from R, you can start to play with the map services as follows. The `geocode()` function will return the latitude and longitude of a location using the Google Geocoding API. For example, we can locate Uni-Mail using the following code:

```r
unimail_coord <- geocode("Unimail, Geneva", source = "google")
```

Now we continue with our tennis players example:

```r
birth_place <- c("Glasgow, Scotland", "Manacor, Spain", "Lausanne, Switzerland", "Belgrade, Serbia", "Basel, Switzerland")
birth_coord <- geocode(birth_place, source = "google")
```

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

<div style="text-align:center"><img src="fig4.png" alt=" " width="70%">
