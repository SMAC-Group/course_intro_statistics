---
type: slides
---

# Bronchitis dataset

---

# Getting the data

In this set of slides, we will replicate the analysis of `bronchitis` dataset presented in the lecture slides. As always, our first step is to load the data which is available in the `idar` R package. Assuming that this package is installed (if not, please refer to Section 1 of Chapter 1), we can load the data as follows:

```r
library(idarps)
data("bronchitis")
head(bronchitis)
```

```out
# A tibble: 6 x 3
   bron  cigs  poll
  <dbl> <dbl> <dbl>
1     0  5.15  67.1
2     1  0     66.9
3     0  2.5   66.7
4     0  1.75  65.8
5     0  6.75  64.4
6     0  0     64.4
```

---

As suggested in slide 7, a possible model that can be considered for the `bronchitis` dataset is given by:

<div style="text-align:center"><img src="chap4_eq_mdl_1.png" alt=" " width="70%"></div>

We will refer to this model as "Model 1". The parameters of this first model can be estimated using the function `glm` as follows:

```{r}
mod1 = glm(bron ~ cigs, data = bronchitis, family = binomial())
```

The syntax used in this function is similar to the one used in `lm` (indeed `bron` is the response that we would like to "explain" using `cigs`, thus, `bron ~ cigs`). Note that the part `family = binomial()` is essential as it specifies that we are considering a logistic regression so make sure not to remove it. 

---

Then, we can use the function `summary` to have a look at the estimated parameters:

```r
summary(mod1)
```

```out
Call:
glm(formula = bron ~ cigs, family = binomial(), data = bronchitis)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-2.4418  -0.5472  -0.4653  -0.4405   2.1822  

Coefficients:
            Estimate Std. Error z value Pr(>|z|)    
(Intercept)  -2.2840     0.2731  -8.365  < 2e-16 ***
cigs          0.2094     0.0376   5.567 2.59e-08 ***

Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 221.78  on 211  degrees of freedom
Residual deviance: 181.71  on 210  degrees of freedom
AIC: 185.71

Number of Fisher Scoring iterations: 4
```

