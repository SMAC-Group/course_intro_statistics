---
type: slides
---

# Lists

---

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
