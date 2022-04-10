---
title: 'Chapter 4: Generalized Linear Models 🚧🔨 (under construction)'
description:
  ''
prev: /chapter3
next: null
type: chapter
id: 2
---


<exercise id="1" title="Lecture slides">

View the slides directly in the browser or download the slides
[here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture4.html#1). To download the slides, please check [here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture4.html#1) for the .html version or [here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture4.pdf) for the .pdf version. 

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




<exercise id = "5" title ="Analysis of the bronchitis dataset: How good is our model? (optional 🤓)">


<slides source="chapter4_bronchitis_how_good_model">
</slides>


</exercise>




<exercise id = "6" title ="Analysis of the bronchitis dataset: Prediction - Part II">



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
<iframe src="p_1.html" width="500" height="500" ></iframe> 
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
<iframe src="p_2.html" width="500" height="500" ></iframe> 
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
<opt text="Hypothesis F" correct="true"> Are you sure? 😅
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


What could we conclude for this test (considering $\alpha = 0.05$):


<choice id="chap4_exc3">
<opt text="We cannot reject the null. "> The p-value is actually smaller than alpha...
</opt>
<opt text="We can reject the null and accept the alternative. Therefore, men are statistically significantly more likely to be admitted to an ICU among the COVID-19 patients." correct = "true"> Well done! 👍
</opt>
<opt text="I don't know! 😢"> Don't worry... 
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
<opt text="0.9973">  You are considering a different alternative hypothesis. 🤔
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

We only need the fact that the patient is a women and that her measured lhd is equal to 645.

</codeblock>








</exercise>



<exercise id = "8" title ="Exercise: ICU admission of COVID-19 patients - Part II">


Not slides



</exercise>
