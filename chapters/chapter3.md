---
title: 'Chapter 3: Linear Regression'
description:
  ''
prev: /chapter2
next: /chapter4
type: chapter
id: 2
---


<exercise id="1" title="Lecture slides">

You can view the slides directly in the browser below. To download the slides, please check
[here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture3.html#1) for the .html version or [here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture3.pdf) for the .pdf version. 

<iframe src="https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture3.html#1" width="710" height="530">
</iframe>

</exercise>



<exercise id = "2" title ="Analysis of the Reading dataset: Estimation">

<slides source="chapter3_reading_estimation">
</slides>

</exercise>

<exercise id = "3" title ="Analysis of the Reading dataset: Prediction">

<slides source="chapter3_reading_prediction">
</slides>

</exercise>


<exercise id = "4" title ="Analysis of the Reading dataset: Model diagnostic">

<slides source="chapter3_reading_model_diagnostic">
</slides>

</exercise>

<exercise id = "5" title ="Analysis of the Reading dataset: Improving our model">

<slides source="chapter3_reading_complexify_model">
</slides>

</exercise>


<exercise id = "6" title ="Analysis of the Reading dataset: Confidence intervals for predictions">

<slides source="chapter3_reading_ci">
</slides>

</exercise>


<exercise id="7" title="Exercise: Pharmacokinetics of Indomethacin">


In this exercise, we will consider a dataset on the pharmacokinetics of indomethacin which is an anti-inflammatory drug commonly used as a prescription medication to reduce fever, pain, stiffness, and swelling from inflammation. This dataset can be downloaded as follows:

```r
data(Indometh)
```

We can have a first look at the data by using

```r
head(Indometh)
```

```out
  Subject time conc
1       1 0.25 1.50
2       1 0.50 0.94
3       1 0.75 0.78
4       1 1.00 0.48
5       1 1.25 0.37
6       1 2.00 0.19
```

Our objective is to model the concentration (i.e. plasma concentrations of indomethacin measured in mcg/ml) as a function of the times at which blood samples were drawn (in hr). In particular, we are interested in estimating the mean concentration after 1 hour. The first variable corresponds to `Indometh$conc` and the second to `Indometh$time`.

We can visualize the relationship between these two variables by creating a scatter plot with:

```r
plot(Indometh$time, Indometh$conc, xlab = "Time (hr)", ylab = "Concentration (mcg/ml)")
```

<div style="text-align:center"><img src="plot_chap_3_ex_1_1.png" alt=" " width="90%"></div>

One scientist thinks that the following model will a good approximation:

<p><span class="math display">\[\text{Concentration}_i = \beta_0 +
\beta_1 \text{Time}_i + \varepsilon_i\]</span></p>

which we can estimate as follows:

```r
mod1 = lm(conc ~ time, data = Indometh)
```

When comparing the predictions of the model with the data, he obtains the following graph using the following code:

```r
plot(Indometh$time, Indometh$conc, xlab = "Time (hr)", ylab = "Concentration (mcg/ml)")
time_to_predict = seq(from = 0.25, to = 8, length.out = 100)
data_to_predict = data.frame(time = time_to_predict)
predict_concentration = predict(mod1, data_to_predict, interval = "confidence")
lines(time_to_predict, predict_concentration[,1])
lines(time_to_predict, predict_concentration[,2], lty = 2)
lines(time_to_predict, predict_concentration[,3], lty = 2)
``` 


<div style="text-align:center"><img src="plot_chap_3_ex_1_2.png" alt=" " width="90%"></div>


Based on this graph, the scientist asks for your opinion on his model:

<choice id="chap3_exc1">
<opt text="The model seems appropriate as there is a good match between our model and the data."> No, the fit is actually quite poor as the data don't exhibit a linear relationship between the time and the concentration.
</opt>
<opt text=" I don't know!"> 😉 </opt>
<opt text="The adequacy between our model and the data is quite poor, indicating that we should look for another model." correct="true">  Yay! 😆 </opt>
<opt text="The model is not perfect but nevertheless the adequacy is reasonable between our model and the data.">  Well a model will never be perfect but here we can see that the data exhibit a nonlinear relationship while our model is linear.
</opt>
</choice>


Another scientist suggests to transform the data and he proposes to consider the following model instead:

<p><span class="math display">\[\log(\text{Concentration}_i) = \beta_0 +
\beta_1 \text{Time}_i + \varepsilon_i\]</span></p>


and therefore he refits this model as follows:

```r
# Add log concentration
Indometh$log_conc = log(Indometh$conc)

# Fit model 2
mod2 = lm(log_conc ~ time, data = Indometh)
```

When considering the model diagnostic plots associated to this model, he obtains the following results:

```r
plot(fitted(mod2), residuals(mod2), xlab = "Fitted values", ylab = "Residuals")
```

<div style="text-align:center"><img src="plot_chap_3_ex_1_3.png" alt=" " width="90%"></div>


Based on this graph, the scientist asks for your opinion on his model:

<choice id="chap3_exc2">
<opt text="This graph indicates that the model is not adequate for the data we are considering." correct="true"> Yay! 😆
</opt>
<opt text="The model suggests that there is nothing wrong."> We can see a clear "U" shape in the residuals. </opt>
<opt text="I don't know!"> 😉 </opt>

</choice>


A third scientist thinks that we should further modify our model and she proposes to consider the following model instead:

<p><span class="math display">\[\log(\text{Concentration}_i) = \beta_0 +
\beta_1 \log(\text{Time}_i) + \varepsilon_i\]</span></p>

Complete the code below to estimate the parameters of this model:

<codeblock id="chap3_ex_1_1">

Remember we want to compute the log of the variable time.

</codeblock>

Complete the code below to compare the predictions of the model with the data:

<codeblock id="chap3_ex_1_2">

</codeblock>

Based on the graph you obtain, the scientist asks for your opinion on her model:


<choice id="chap3_exc3">
<opt text="The model seems appropriate as there is a good match between the model and the data." correct="true"> 👍
</opt>
<opt text="The adequacy between the model and the data is quite poor, indicating that we should look for another model.">  Nope, this seems quite reasonable. </opt>
</choice>


Based on this model, the scientist would like to estimate the mean concentration after 1 hour. Which one of the followings is the correct answer?

<choice id="chap3_exc4">
<opt text="-1.0317"> A negative number may not make sense...
</opt>
<opt text="-0.5058">  A negative number may not make sense...
</opt>
<opt text="0.35640">  You should consider using log(1) instead of 1...
</opt>
<opt text="0.60302" correct="true">  Well done! 👍 Note that this answer is actually only an approximation due to Jensen's inequality... But this will be beyond the scope of this class. Just to be clear, the way to compute this result is with <p><span class="math inline">exp(-0.5058)</span></p>
</opt>

</choice>

Finally, the scientists notice that our data consider the same subject several times. Indeed, the first column of the dataset indicates that the data are based on 6 subjects which were all measured 11 times. Therefore, she wonders if our linear regression model is suitable for this kind of data and asks for your advice:


<choice id="chap3_exc5">
<opt text="There is no problem to have the same subject several times in our data."> Unfortunately, we assume that residuals are iid and this is not the case here 😩. Naturally, there are methods to deal with such forms of dependence but they are beyond the scope of this class.
</opt>
<opt text="It can be problematic to have the same subject several times in our data because the residuals cannot have a normal distribution in this case "> Nope, this has no impact on the distribution.
</opt>
<opt text="It can be problematic to have the same subject several times in our data because the model will not be linear">  Nope, this has no impact on the relationship between the variables.
</opt>
<opt text="It can be problematic to have the same subject several times in our data because our data won't be independent" correct="true">  Yay! 😆 Note that Mixed Linear Models were developed to answer such form of dependence in the data. However, this is beyond the scope of this class. 
</opt>
</choice>



</exercise>










<exercise id="8" title="Exercise: Pharmacokinetics of dexamethasone">

</exercise>









<exercise id="9" title="Homework">

</exercise>












<exercise id="9" title="Optional Homework">

</exercise>
