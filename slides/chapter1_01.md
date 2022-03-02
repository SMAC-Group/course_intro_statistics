---
type: slides
---

# One Sample t-test

---

In this lecture, we discussed the one-sample Student's t-test for testing a simple null hypothesis. Here we would show how to use the null distribution of the statistics to determine the rejection region so as to achieve a desired significance level. The goal of statistical inference is to know whether the data come from a prescribed distribution. The hypothesis test is the tool to achieve this goal.

There are measurements on the mineral content of bones by photon absorption-metric to study whether exercise or dietary supplements would slow bone loss within older women. Data were recorded for three bones on the dominant and non-dominant side. (Data is available on http://users.stat.umn.edu/~kb/classes/5401/files/data/JWData5.txt). Click on the link, then find and save the relevant data T01_08 in the format .txt.

```r
# Set Working Directory
setwd("C:/Intro_DS/")

# Import txt file named as "T01_08" 
mnr <- read.csv("T01_08.txt",sep = "",header = FALSE) 

# # Change the name of the variable in the first column as "Dominant radius"
colnames(mnr)[1] <- "Dominant radius" 
colnames(mnr)[2] <- "Radius"
colnames(mnr)[3] <- "Dominant humerus"
colnames(mnr)[4] <- "Humerus"
colnames(mnr)[5] <- "Dominant ulna"
colnames(mnr)[6] <- "Ulna"
```

---

It is difficult to determine the probability distribution from data directly, therefore we need to propose a certain probability model for the data. Suppose the distribution of dominant radius is normal with the expectation .8 and the variance .16, we can denote the above statement as the following hypothesis:

\\(H_0:  X_1, X_2,...,X_n \sim \mathcal{N}(0.8, 0.16)\\)

Based on this hypothesis, we would like to have a test statistic \\(T\\) such that extreme values of \\(T\\) provides evidence against \\(H_0\\). Moreover, by the Central Limit Theorem (CLT), we wish to make the statistic \\(T\\) have the average form.The following are possible test statistics:

\\(\bar{X}=\frac{1}{n}(X_1+...+X_n)\\) (sample mean)

\\(S^2=\frac{1}{n-1}[(X_1-0.8)^2+...+(X_n-0.8)^2]\\) (sample variance)

Values of \\(\bar{X}\\) much larger or smaller than .8, or values of \\(S^2\\) much larger or smaller than .16, provide evidence against \\(H_0\\) in favor of various alternatives \\(H_1\\).

---

Recall that the if \\(X_1,...,X_n\stackrel{iid}{\sim} \mathcal{N}(\mu,\ \sigma^2), \bar{X}\stackrel{iid}{\sim} \mathcal{N}(\mu,\ \frac{\sigma^2}{n})\\). Therefore, the statistics \\(T=\frac{\bar{X_n}-\mu}{\sqrt{\sigma^2/n}}\stackrel{iid}{\sim}\mathcal{Student}(n-1)\rightarrow\stackrel{iid}{\sim}\mathcal{N}(0,1)\\)

might be an appropriate statistics for data since the estimator for the parameter can be obtained by sample mean and sample variance.

For the null hypothesis \\(H_0: \mu=0.8\\) against the alternative hypothesis \\(H_a: \mu \neq 0.8\\), given a significance level \\(\alpha\\), since the t-distribution is symmetric thus in this setting, the rejection region is \\(\mid T \mid > t_{1-\alpha/2}(n-1)\\).                                                          
---

# Code for one sample t-test

```r
t.test(mnr$'Dominant radius') # We use the command t.test() to check the hypothesis                
```                               
```out
One Sample t-test

data:  mnr$`Dominant radius`
t = 37.001, df = 24, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 0.796733 0.890867
sample estimates:
mean of x 
   0.8438 

```

# Result analysis of t-test
                                      
We can see from the result that the p-value is considerably smaller than the significance level 0.05. Therefore, it indicates strong evidence against \\(\mu = 0.8 \\). However,the reliability of the t-test relies on the absence of outliers. It is necessary to check the data from histograms or QQ plot before applying the t-test for statistical inference.

---

# Test statistics from histograms

Let \\(T_i=(X_i-0.8)^2\\). We are interested in testing whether \\(T_1,...,T_n\\) are distributed as \\(0.16 \times \chi_1^2\\) (their distribution under \\(H_0\\). We can see from the histogram that compared with the bars on the left side, the bars are smaller on the right side of the histogram which might be due to the outlier of the data.
                                      
```r  
n <- nrow(mnr)
V1 <- rep(NA,n)
V2 <- rep(NA,n)
for (i in 1:n){
  V1[i] <- mnr[i,1] # Check the outlier with the null hypothesis that the "Dominan radius" is of mean .8 and variance 0.16 by histogram
  V2[i] <- (mnr[i,1]-0.8)^2 
  }
hist(V1)
hist(V2)
```

---

# Result of histogram test
<div style="display:flex">
     <div style="flex:1;padding-right:10px;">
          <img src="histV1.png" width="500"/>
     </div>
     <div style="flex:1;padding-left:10px;">
          <img src="histV2.png" width="500"/>
     </div>
</div>

---

## Test statistics from QQ plot

Let \\(\max_{i=1}^{n}\mid T_{(i)}-F^{-1}(i/(n+1))\mid\\)
where \\(T_{(i)}\\) is the sorted values of \\(T_i\\). 

The theoretical value \\(F^{-1}(i/(n+1))\\)
under the null hypothesis should be very close to the sorted value \\(T_{(i)}\\). 
Therefore, the two values close to the line \\(y=x\\) indicate a good fit.     
                    
```r           
x <- rnorm(n,0.8,0.4) # Check the null hypothesis that "Dominant radius" follow the normal distribution with 0.8 mean and 0.4 standard deviation by qqplot
y <- mnr$'Dominant radius'
qqplot(x,y)
```

<div style="text-align:center"><img src="qqplot.png" alt=" " width="15%">

---

