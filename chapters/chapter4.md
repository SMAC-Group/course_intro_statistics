---
title: 'Chapter 4: Generalized Linear Models'
description:
  ''
prev: /chapter3
next: null
type: chapter
id: 2
---


<exercise id="1" title="Lecture slides">

You can view the slides directly in the browser below. To download the slides, please check [here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture4.html#1) for the .html version or [here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture4.pdf) for the .pdf version. 

<iframe src="https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture4.html#1" width="710" height="530">
</iframe>



</exercise>



<exercise id="2" title="Analysis of the bronchitis dataset: Estimation">



<slides source="chapter4_bronchitis_estimation">
</slides>


</exercise>


<exercise id = "3" title ="Analysis of the bronchitis dataset: Prediction - Part I">

<slides source="chapter4_bronchitis_prediction_1">
</slides>


</exercise>




<exercise id = "4" title ="Analysis of the bronchitis dataset: Improving our model">

<slides source="chapter4_bronchitis_improve_model">
</slides>

</exercise>




<exercise id = "5" title ="Analysis of the bronchitis dataset: How good is our model?">


<slides source="chapter4_bronchitis_how_good_model">
</slides>


</exercise>


<exercise id = "6" title ="Analysis of the bronchitis dataset: Prediction - Part II 😱">

*Similarly, to our discussion on cross-validation the content of this section is more advanced and aimed at the motivated/curious students... explaining the symbol:* 😱.

In this section we consider different approaches to present the predictions that can be made using the second model by constructing an interactive 3D plot. For this purpose, we will use the R package `plotly` which can be installed  as follows:

```r
install.packages(plotly)
```

Then, we can compute a prediction "matrix" as follows:

```r
m = 40
cigs_to_predict = seq(from = min(bronchitis$cigs), to = max(bronchitis$cigs), 
length.out = m)
poll_to_predict = seq(from = min(bronchitis$poll), to = max(bronchitis$poll), 
length.out = m)
predicted_prob = matrix(NA, m, m)
for (i in 1:m){
  for (j in 1:m){
    predicted_prob[i,j] = predict(mod2, data.frame(cigs = cigs_to_predict[i], 
    poll = poll_to_predict[j]), type = "response")
  }
}
```

Using this matrix containing predictions for different values of the variables `cigs` and `poll`, we can construct the following figure:

```r
library(plotly)
plot_ly(x = poll_to_predict, y = cigs_to_predict, z = predicted_prob) %>% 
add_surface()
```


<div align="center">
<iframe src="p_1.html" width="750" height="500" ></iframe> 
</div>
 
Or if we want something a little better:

```r
fig = plot_ly(x = poll_to_predict, y = cigs_to_predict, z = predicted_prob) %>% 
add_surface(
  contours = list(
    y = list( 
      highlight = TRUE,
      highlightcolor = "#41a7b3"
    ),
    x = list( 
      highlight = TRUE,
      highlightcolor = "#41a7b3"
    ),
  z = list(highlight = FALSE)))
fig = fig %>% 
layout(scene = list(xaxis = list(title = "Pollution index"),
                    yaxis = list(title = "Daily number of cigarettes"),
                    zaxis = list(title = "Predicted probability of Bronchitis")))
fig = fig %>% colorbar(title = "Estimated \n probability")
fig
```


<div align="center">
<iframe src="p_2.html" width="750" height="500" ></iframe> 
</div>

</exercise>





<exercise id = "7" title ="Exercise: ICU admission of COVID-19 patients - Part I">

In this section, we revisit the data from Parisi, et al., (2021) which studies the applicability of predictive models for intensive care admission of COVID-19 patients in a secondary care hospital in Belgium. In this exercise, we will consider the following model:



<div style="text-align:center"><img src="chap4_eq_mdl_3.png" alt=" " width="70%"></div>

<p>where <span
class="math inline">\(\color{#e64173}{\text{icu}_i}\)</span> is equal to
1 if patient <span class="math inline">\(i\)</span> is admitted to an
ICU (0 otherwise), <span
class="math inline">\(\color{#6A5ACD}{\text{gender}_i}\)</span> is equal
to 0 if patient <span class="math inline">\(i\)</span> is a man or equal
to 1 if patient <span class="math inline">\(i\)</span> is a woman, and
<span class="math inline">\(\color{#20B2AA}{\text{ldh}_i}\)</span>
corresponds to the lactic acid dehydrogenase of patient <span
class="math inline">\(i\)</span>.</p>

Complete the code below to estimate the parameters of this model:

<codeblock id="chap4_ex_1_1">

Remember to use `family = binomial()`.

</codeblock>

Based on this model, we would like to test if women are more likely to be admitted to an ICU. 


Consider the following six sets of hypotheses:

<p><strong>A. </strong><span class="math inline">\(H_0: \; \beta_1 = 0, \; H_a: \beta_1 \neq
0\)</span></p>

<p><strong>B. </strong><span class="math inline">\(H_0: \; \beta_1 = 0, \; H_a: \beta_1 &lt;
0\)</span></p>

<p><strong>C. </strong><span class="math inline">\(H_0: \; \beta_2 = 0, \; H_a: \beta_2 &gt;
0\)</span></p>

<p><strong>D. </strong><span class="math inline">\(H_0: \; \beta_2 = 0, \; H_a: \beta_2 &lt;
0\)</span></p>

<p><strong>E. </strong><span class="math inline">\(H_0: \; \beta_1 = 0, \; H_a: \beta_1 &gt;
0\)</span></p>

<p><strong>F. </strong><span class="math inline">\(H_0: \; \beta_1 &lt; 0, \; H_a: \beta_1 =
0\)</span></p>

What is the corresponding set of hypotheses associated to this question:


<choice id="chap4_exc1">
<opt text="Hypothesis A"> Here we would be testing that men and women are admitted to an ICU with different probabilities...
</opt>
<opt text="Hypothesis B"> Here we would be testing that women are less likely to be admitted to an ICU.
</opt>
<opt text="Hypothesis C"> Are you sure we are interested in beta 2? 🤔
</opt>
<opt text="Hypothesis D"> Are you sure we are interested in beta 2? 🤔
</opt>
<opt text="Hypothesis E" correct="true"> Well done! 👍
</opt>
<opt text="Hypothesis F"> Are you sure? 😅
</opt>
</choice>


Based on the hypotheses you select, what is the p-value associated to this test:


<choice id="chap4_exc2">
<opt text="0.00365"> Our test is not about the intercept.
</opt>
<opt text="0.00540"> Our test is not about the variable ldh.
</opt>
<opt text="0.02359"> You are considering a different alternative hypothesis. 🤔
</opt>
<opt text="0.011795">  You are considering a different alternative hypothesis. 🤔
</opt>
<opt text="0.988205" correct="true">  Well done! 👍
</opt>
</choice>


This p-value is telling us that we cannot reject the null but also that we might consider a different alternative hypothesis. Indeed, we should probably consider the following alternative hypothesis instead:

<p><span class="math display">\[H_0: \; \beta_1 = 0, \;\; H_a: \beta_1
&lt; 0\]</span></p>


<p>What could we conclude for this test (considering <span
class="math inline">\(\alpha = 0.05\)</span>):</p>


<choice id="chap4_exc3">
<opt text="We cannot reject the null. "> The p-value is actually smaller than alpha...
</opt>
<opt text="We can reject the null and accept the alternative. Therefore, men are statistically significantly more likely to be admitted to an ICU among the COVID-19 patients." correct = "true"> Well done! 👍
</opt>
<opt text="I don't know! 😢"> Don't worry... 🤗
</opt>
</choice>


Next, we are interested in testing if the variable `ldh` is relevant in regards of the admission of COVID-19 patients to an ICU. Consider the following four sets of hypothesis:


<p><strong>A. </strong><span class="math inline">\(H_0: \; \beta_2 = 0, \; H_a: \beta_2 \neq
0\)</span></p>

<p><strong>B. </strong><span class="math inline">\(H_0: \; \beta_2 = 0, \; H_a: \beta_2 &lt;
0\)</span></p>

<p><strong>C. </strong><span class="math inline">\(H_0: \; \beta_2 = 0, \; H_a: \beta_2 &gt;
0\)</span></p>

<p><strong>D. </strong><span class="math inline">\(H_0: \; \beta_2 \neq 0, \; H_a: \beta_2 =
0\)</span></p>



What is the corresponding set of hypotheses associated to this question:


<choice id="chap4_exc4">
<opt text="Hypothesis A" correct = "true"> Yay! 😆
</opt>
<opt text="Hypothesis B"> We are not assuming that lhd decreases the probability of admission.
</opt>
<opt text="Hypothesis C"> We are not assuming that lhd increases the probability of admission.
</opt>
<opt text="Hypothesis D"> Are you sure? 😅
</opt>
</choice>


Based on the hypotheses you selected, what is the p-value associated to this test:


<choice id="chap4_exc5">
<opt text="0.00365"> Our test is not about the intercept.
</opt>
<opt text="0.00540" correct = "true"> Yay! Well done! 👍
</opt>
<opt text="0.00270"> You are considering a different alternative hypothesis. 🤔
</opt>
<opt text="0.99730">  You are considering a different alternative hypothesis. 🤔
</opt>
<opt text="0.02359">  Our test is not about this variable.
</opt>
</choice>

Next, we are interested in predicting the probability that a woman of age 56 with a measured ldh of 645 and oxygen saturation of 94 is admitted to an ICU. Complete to code below to compute this probability:


<codeblock id="chap4_ex_1_2">

We only need the fact that the patient is a women and that her measured lhd is equal to 645.

</codeblock>

Based on the above code you should obtain a value of 29.92%. What does this number mean:


<choice id="chap4_exc6">
<opt text="It means that this woman will not be admitted to the ICU. "> Nope!
</opt>
<opt text="It means that this woman will be admitted to the ICU with a probability of exactly 29.92%."> The value 29.92% is only our best guess... Remember that all models are wrong but some are useful. 🤔
</opt>
<opt text="It means that this woman will be admitted to the ICU with an estimated probability of 29.92%."  correct = "true"> Well done! 👍
</opt>
<opt text="It means that this woman will be admitted to the ICU. ">  Nope!
</opt>

</choice>



In order to evaluate visually the impact of the two variables in our model, we would like to construct a graph to compare the prediction for the groups men and women as a function of the ldh. Complete the code below to make this graph:

<codeblock id="chap4_ex_1_3">

Make sure to place `ldh_to_predict` in `data.frame` used to predict...

</codeblock>








</exercise>



<exercise id = "8" title ="Exercise: ICU admission of COVID-19 patients - Part II">

The previous model ignored the age of the patients as well as their SpO2, which are arguably two important variables. Therefore, we could consider a model that includes these variables as follows:

```r
mod_big = glm(icu ~ sex + ldh + spo2 + age, data = covid, family = binomial())
summary(mod_big)
```

```out
Call:
glm(formula = icu ~ sex + ldh + spo2 + age, family = binomial(), 
    data = covid)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-1.8526  -0.7429  -0.4085   0.6182   1.8504  

Coefficients:
             Estimate Std. Error z value Pr(>|z|)  
(Intercept)  8.793791   7.405089   1.188   0.2350  
sexwomen    -1.567246   0.772703  -2.028   0.0425 *
ldh          0.003797   0.001868   2.033   0.0421 *
spo2        -0.106755   0.072588  -1.471   0.1414  
age         -0.013913   0.021722  -0.641   0.5218  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 79.499  on 63  degrees of freedom
Residual deviance: 58.501  on 59  degrees of freedom
AIC: 68.501

Number of Fisher Scoring iterations: 5
```

We can see that among these 4 variables, some appear not significant, implying that we may be able to find a smaller model with less variables which is more adequate (hopefully the model we considered previously). Indeed, we could actually wonder what is the "best" model to describe our data or at least the model with the smallest AIC. By comparing the AIC of the two models, it seems that the first one is more adequate. 


<p>However, is it the "best" model? Since our dataset has four variables (i.e. <code>sex</code>, <code>age</code>, <code>ldh</code> and <code>spo2</code>),
we can actually construct <span class="math inline">\(2^4 = 16\)</span> models (why? 🤔). Therefore, we could manually construct these 16 models and find the one with the smallest AIC. This can be done as follows:</p>



```r
# Empty model (i.e. intercept only)
mod1 = glm(icu ~ 1, data = covid, family = binomial())

# Models with one variable
mod2 = glm(icu ~ sex, data = covid, family = binomial())
mod3 = glm(icu ~ age, data = covid, family = binomial())
mod4 = glm(icu ~ ldh, data = covid, family = binomial())
mod5 = glm(icu ~ spo2, data = covid, family = binomial())

# Models with two variables
mod6 = glm(icu ~ sex + age, data = covid, family = binomial())
mod7 = glm(icu ~ sex + ldh, data = covid, family = binomial())
mod8 = glm(icu ~ sex + spo2, data = covid, family = binomial())
mod9 = glm(icu ~ age + ldh, data = covid, family = binomial())
mod10 = glm(icu ~ age + spo2, data = covid, family = binomial())
mod11 = glm(icu ~ ldh + spo2, data = covid, family = binomial())

# Models with three variables
mod12 = glm(icu ~ sex + age + ldh, data = covid, family = binomial())
mod13 = glm(icu ~ sex + age + spo2, data = covid, family = binomial())
mod14 = glm(icu ~ age + ldh + spo2, data = covid, family = binomial())
mod15 = glm(icu ~ sex + ldh + spo2, data = covid, family = binomial())

# Full model
mod16 = glm(icu ~ sex + age + ldh + spo2, data = covid, family = binomial())
```


Now, let's see which one has the smallest AIC:

```{r}
AIC_vector = c(AIC(mod1), AIC(mod2), AIC(mod3), AIC(mod4), AIC(mod5),
               AIC(mod6), AIC(mod7), AIC(mod8), AIC(mod9), AIC(mod10),
               AIC(mod11), AIC(mod12), AIC(mod13), AIC(mod14), AIC(mod15),
               AIC(mod16))
plot(AIC_vector, xlab = "Model index", ylab = "AIC", type = "b", pch = 16)
grid()
abline(h = min(AIC_vector), lty=2)
abline(h = min(AIC_vector)+2, lty=2)
```


<div style="text-align:center"><img src="plot_aic_2.png" alt=" " width="70%"></div>

 <p style="padding: 10px; border: 2px solid #358ccb; background-color:#8efaff ; border-radius: 25px;">
 
 
😱 <em> A more advanced remark for the curious/interested students: When we are comparing the AIC of different models it is practical to consider the following difference: <span class="math inline">\(\Delta_i = \text{AIC}_i -
\text{AIC}_{\min}\)</span> where <span class="math inline">\( \text{AIC}_i\)</span> denotes the AIC of the i-th model and  <span class="math inline">\(\text{AIC}_{\min}\)</span> denotes the smallest AIC among the set of models examined. In practice, selecting the model with the smallest AIC may not be the best approach and one may decide to consider a different model in some cases. For example, 
<a  style="text-decoration: none; border-bottom:1px solid darkblue;"  href="http://faculty.washington.edu/skalski/classes/QERM597/papers_xtra/Burnham%20and%20Anderson.pdf">Burnham & Anderson 2004 </a> suggested that any model having a difference <span class="math inline">\(\Delta_i < 2\)</span> has no substantial difference with the model with the smallest AIC. Other researchers have suggested to consider <span class="math inline">\(\Delta_i < 4\)</span>. These numbers are actually associated to estimation error of the AIC. In our example, we can see that Models 7, 12, 15 and 16 are such that <span class="math inline">\(\Delta_i < 2\)</span> and therefore we can consider that there are no substantial differences between them. However, Models 12, 15 and 16 are based three variables while Model 7 is only based on two variables. Thus, it is reasonable to consider either Model 7 or Model 15 (which has the smallest AIC) and to assume that these models are quite comparable.</em>

 
 
 </p>






We can see on the graph that two models have an AIC that appears smaller than the ones of the other models. Indeed, Models 7 and 15 seem to be interesting candidates. Let's have a look at these models:

```r
summary(mod7)
```

```out
Call:
glm(formula = icu ~ sex + ldh, family = binomial(), data = covid)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-1.5371  -0.7854  -0.4244   0.6393   1.9873  

Coefficients:
             Estimate Std. Error z value Pr(>|z|)   
(Intercept) -2.238523   0.770023  -2.907  0.00365 ** 
sexwomen    -1.708715   0.754830  -2.264  0.02359 * 
ldh          0.004801   0.001726   2.782  0.00540 **
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 79.499  on 63  degrees of freedom
Residual deviance: 60.961  on 61  degrees of freedom
AIC: 66.961

Number of Fisher Scoring iterations: 5
```

```r
summary(mod15)
```

```out
Call:
glm(formula = icu ~ sex + ldh + spo2, family = binomial(), data = covid)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-1.8765  -0.7099  -0.4200   0.6055   1.8993  

Coefficients:
             Estimate Std. Error z value Pr(>|z|)  
(Intercept)  6.605361   6.400212   1.032   0.3020  
sexwomen    -1.679296   0.757965  -2.216   0.0267 *
ldh          0.003892   0.001857   2.096   0.0361 *
spo2        -0.092701   0.067652  -1.370   0.1706  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 79.499  on 63  degrees of freedom
Residual deviance: 58.914  on 60  degrees of freedom
AIC: 66.914

Number of Fisher Scoring iterations: 5
```

We can see that these two models have essentially the same AIC and that the first model (i.e. Model 7) is the same model we considered in the previous exercise. How can we interpret this result:



<choice id="chap4_exc7">
<opt text="It is clear that Model 7 is best model because it has less parameters and has a small AIC. "> Model 7 is a good candidate but there is nothing clear about the fact that it is the best one.
</opt>
<opt text=" It is clear that Model 15 is the best model because it has the smallest AIC. "> Model 15 is a good candidate with the smallest AIC, however, other models may also be adequate.
</opt>
<opt text="The two models appear to be reasonable choices but others models may also be of interest. "  correct = "true"> Yes, it is very difficult to find which is the best model.
</opt>
</choice>

To compare these two final models, we could also use 10-fold cross-validation to compute an estimator of their classification accuracy This can be done as follows:

```r
library(boot)  
set.seed(1559) # For reproducibility

cost = function(resp, pred){
  mean(resp == (pred > 0.5))
}

cv.glm(covid, mod7, cost, K = 10)$delta[2]
cv.glm(covid, mod15, cost, K = 10)$delta[2]
```

```out
0.7485352
0.6806641
```


Based on this analysis, it turns out that the smaller model (i.e. model 7) appears to provide slightly more reliable prediction than the larger model (i.e. model 15). Therefore, one could argue that this candidate is an interesting choice (but this may not be the best possible model).

Now that we selected a model which only contains two variables, i.e. `ldh` and `sex`, does it imply that the variables `spo2` and `age` are irrelevant to predict ICU admissions? 


<choice id="chap4_exc8">
<opt text="Yes, since Model 7 is the best model then these variables are not important."> No, they could still be important... 🤔
</opt>
<opt text="Not at all, since Model 7 is the best model then these variables are the most important. "> No, while these variables could still be of interest, they are very likely to be less important.
</opt>
<opt text="The fact that our model has good predictive abilities suggests that these variables are not the most important ones, but they could still play a role in understanding the ICU admissions."  correct = "true"> Well done!
</opt>
</choice>


When comparing the p-values associated to the variable `sex` in the R outputs of these two models, you notice that it is equal to 2.359% for Model 7 and 2.670% for Model 15. This seems to suggest that these p-values depend on the model we are selecting and that, potentially, different models could lead to different conclusions. Do you think this is true:


<choice id="chap4_exc9">
<opt text="No, otherwise how could we trust the results of a statistical analysis?"> This is a well known problem that is encountered in statistical analysis. This problem is often called "inference after selection". Basically, the p-values should reflect the uncertainty due to the selection of the model but this is generally not the case. Sadly, there are no known consensus on how to address this problem... So let's be careful when we are using statistics!
</opt>
<opt text="Yes, this could be a problem and, in particular, if we are not careful on how we select our model. " correct="true"> This is a well known problem that is encountered in statistical analysis. This problem is often called "inference after selection". Basically, the p-values should reflect the uncertainty due to the selection of the model but this is generally not the case. Sadly, there are no known consensus on how to address this problem... So let's be careful when we are using statistics!
</opt>
<opt text="No it is not a problem if we are careful in selecting a good model. "> Sadly, we don't know how to do this... 😢
</opt>
</choice>

If we had 40 variables instead of 4, could we use the same approach where we consider the AICs of all possible models:

<choice id="chap4_exc10">
<opt text="Yes, but it will be annoying."> Actually, we could construct 109,951,200,000 different models... and that's A LOT! 😳 Actually, if fitting one model takes 1 second, we would need over 2000 years to fit all models... So, this approach is hardly possible.
</opt>
<opt text="Yes, it should be no problem. " > Actually, we could construct 109,951,200,000 different models... and that's A LOT! 😳 Actually, if fitting one model takes 1 second, we would need over 2000 years to fit all models... So, this approach is hardly possible.
</opt>
<opt text=" No, that's too many models." correct = "true"> Well done! 👍
</opt>
</choice>


To avoid considering all models, we can use the `step()` function to perform stepwise model selection using the AIC by adding variables iteratively to our initial model. This approach is known as "stepwise forward AIC" and it is an heuristic method which avoids to explore ALL models. Nevertheless, various modern methods allow to improve on this stepwise approach for model selection but they are beyond the scope of this class. You can use this approach as follows:


```r
smallest_model = glm(icu ~ 1, data = covid, family = binomial())
biggest_model = glm(icu ~ sex + age + ldh + spo2, data = covid, family = binomial())

# Find a model with a forward approach using the AIC
best_aic = step(smallest_model, scope = list(lower = formula(smallest_model),
                                        upper = formula(biggest_model)), 
                           direction = "forward", trace = FALSE)
summary(best_aic)
```

```out
Call:
glm(formula = icu ~ ldh + sex + spo2, family = binomial(), data = covid)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-1.8765  -0.7099  -0.4200   0.6055   1.8993  

Coefficients:
             Estimate Std. Error z value Pr(>|z|)  
(Intercept)  6.605361   6.400212   1.032   0.3020  
ldh          0.003892   0.001857   2.096   0.0361 *
sexwomen    -1.679296   0.757965  -2.216   0.0267 *
spo2        -0.092701   0.067652  -1.370   0.1706  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 79.499  on 63  degrees of freedom
Residual deviance: 58.914  on 60  degrees of freedom
AIC: 66.914

Number of Fisher Scoring iterations: 5
```

In this example, we can see that this approach is able to find the model with the smallest AIC (i.e. Model 15). This approach is a suitable solution when exploring all possible models is impossible.







</exercise>




<exercise id = "9" title ="Homework">

# Problem I: Framingham Heart Study

In this first exercise, we consider the data from the Framingham Heart Study which is a long term prospective study of the etiology of cardiovascular disease among a population of subjects in the community of Framingham, Massachusetts. More precisely, we are interested in the following model:

<div style="text-align:center"><img src="chap4_eq_mdl_4.png" alt=" " width="100%"></div>

where

<p>- <span class="math inline">\(g(x) = \exp(x)/(1 +
\exp(x))\)</span>;</p>
<p>- <span class="math inline">\(\color{#e64173}{\text{CHD}_i}\)</span>:
corresponds to the presence of Coronary Heart Disease defined as
pre-existing Angina Pectoris, Myocardial Infarction (hospitalized,
silent or unrecognized), or Coronary Insufficiency for subject <span
class="math inline">\(i\)</span> (0 = Free of disease; 1 = Prevalent
disease);</p>
<p>- <span class="math inline">\(\color{#6A5ACD}{\text{BMI}_i}\)</span>:
Body Mass Index of subject <span class="math inline">\(i\)</span>;</p>
<p>- <span class="math inline">\(\color{#20B2AA}{\text{SEX}_i}\)</span>:
Gender of subject <span class="math inline">\(i\)</span> (1 = Male, 2 =
Female);</p>
<p>- <span class="math inline">\(\color{#FFA500}{\text{AGE}_i}\)</span>:
Age at exam (in year) of subject <span
class="math inline">\(i\)</span>;</p>
<p>- <span
class="math inline">\(\color{#8bb174}{\text{SYSBP}_i}\)</span>: Systolic
Blood Pressure (mmHg) of subject <span
class="math inline">\(i\)</span>;</p>
<p>- <span
class="math inline">\(\color{#314f4f}{\text{DIABP}_i}\)</span>:
Diastolic Blood Pressure (mmHg) of subject <span
class="math inline">\(i\)</span>.</p>



We are interested in estimating the parameters associated to this model and assessing the validity of the following claims:

- Men are more likely than women to be affected by a coronary heart disease.

- Individuals with a higher systolic blood pressure are more likely to be affected by a coronary heart disease.

- Individuals with a higher body mass index are more likely to be affected by a coronary heart disease.

- Individuals with a lower diastolic blood pressure are more likely to be affected by a coronary heart disease.

Based on this model, what is the probability that a 50 years old men with a BMI of 25, systolic blood pressure of 120 and diastolic blood pressure of 85 is affected by a coronary heart disease? How would this probability change if we consider a person with a BMI of 50 instead (with other variables being the same)? 

To obtain the data, you first need to install the `riskCommunicator` R package as follows:

```r
install.packages("riskCommunicator")
```

Then you can obtain the data by running:
 
```r
library("riskCommunicator")
data(framingham)
```

The variables needed for your analysis are called: `PREVCHD`, `AGE`, `SYSBP`, `DIABP`, `BMI` and `SEX`.


# Problem II: Pima Indians Diabetes

In this second exercise, we will consider a dataset on diabetes where 768 women of at least 21 years old of the Pima Indian heritage were considered. This dataset includes the following variables:

- `pregnant`: Number of times pregnant
- `glucose`: Plasma glucose concentration in an oral glucose tolerance test
- `pressure`: Diastolic blood pressure (mm Hg)
- `triceps`: Triceps skin fold thickness (mm)
- `insulin`: 2-Hour serum insulin (mu U/ml)
- `mass`: Body mass index (weight in kg/(height in m)^2)
- `pedigree`: Diabetes pedigree function
- `age`: Age of the patients (years)
- `diabetes`: Class variable (test for diabetes)

The dataset is stored in the `mlbench` R package which you can install as follows:

```{r, eval = FALSE}
install.packages(mlbench)
```

Then, you can load the data as:

```{r}
library(mlbench)
data(PimaIndiansDiabetes)
head(PimaIndiansDiabetes)
```


```out
  pregnant glucose pressure triceps insulin mass pedigree age diabetes
1        6     148       72      35       0 33.6    0.627  50      pos
2        1      85       66      29       0 26.6    0.351  31      neg
3        8     183       64       0       0 23.3    0.672  32      pos
4        1      89       66      23      94 28.1    0.167  21      neg
5        0     137       40      35     168 43.1    2.288  33      pos
6        5     116       74       0       0 25.6    0.201  30      neg
```

- Given these variables, what is the largest model (which we will call "Model 1") that you can fit to predict the possibility of a woman (Pima Indian heritage) being diagnosed with diabetes?
- Based on Model 1 we would like to assess the validity of the following claims:
    - Women with a higher body mass index are more likely to be affected by diabetes.
    - Older women are more likely to be affected by diabetes.
    - Is Model 1 the best possible model to describe the data at hand? Is it the model with the smallest AIC? In order to find the model with the smallest AIC, is it feasible to explore all models? Why or why not?
    - Apply the "stepwise forward AIC" approach and describe the model you obtain (which we will call "Model 2"). Based on Model 2, re-assess the validity of the previous claims. Do you obtain different conclusions?
    - Compare the in-sample and out-of-sample classification accuracy of Models 1 and 2? Which model appears to be better?


</exercise>