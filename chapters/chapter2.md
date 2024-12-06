---
title: 'Semaine 2: Variables aléatoires'
description:
  ''
prev: /chapter1
next: null
type: chapter
id: 2
---

<exercise id="1" title="Lecture slides">


You can view the slides directly in the browser below. To download the slides, please check [here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture1.html#1) for the .html version or [here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture1.pdf) for the .pdf version. 

<iframe src="https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture1.html#1" width="710" height="530">
</iframe>

<!--

<br>
<br>

<iframe  width="710" height="530" src="https://www.youtube.com/embed/nG5TXyyaeDs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

-->

</exercise>

<exercise id = "2" title ="Exercises">

### 1) Which of the following statements are incorrect?

<choice id="chap1_theo1">
<opt text="Every decision based on statistical methods is associated to a risk of taking the wrong decision." > Sad but true... 😟  </opt>
<opt text="Decisions based on p-values are not necessarily correct."> Sad but true... 😟 </opt>
<opt text="A scientific result based on a statistical analysis cannot be wrong." correct = "true"> It can still go wrong! </opt>
<opt text="It is only when the null hypothesis is rejected that we are sure that our decision is correct." correct = "true"> This is wrong as there are both type I and II errors.</opt>
<opt text="When the null hypothesis is rejected, our conclusion can still be incorrect."> </opt>
<opt text="A scientific result based on statistical analyses allows to further our understanding on the studied phenomenon without being able to guarantee that the conclusions are 100% correct."> </opt>
</choice>

### 2) In hypothesis testing, the type I error corresponds to:

<choice id="chap1_theo2">
<opt text="The probability of rejecting the null hypothesis when the null hypothesis is true."correct="true"> 👍 
</opt>
<opt text="The probability of not rejecting the null hypothesis when the null hypothesis is false."> No, this is the type II error. 
</opt>
<opt text="The probability of accepting the null hypothesis when the alternative hypothesis is true."> No... and we can never "accept" the null hypothesis!
</opt>
</choice>

### 3)  Which of the following statement is false?

<choice id="chap1_theo3">
<opt text="Small p-value indicates strong evidence against the null hypothesis." >
</opt>
<opt text="When the p-value is small enough, one says that the test based on the null and alternative hypothesis is significant." >
</opt>
<opt text="When the p-value is not small enough, with the available data, we can reject the null hypothesis."correct="true"> We can only reject the null hypothesis when the p-value is smaller than a certain threshold. 
</opt>
<opt text="The obtained p-value summarizes the incompatibility between the data and the model constructed under the set of assumptions.">
</opt>
</choice>


### 4) Which of the following statement is true?
<choice id="chap1_theo4">
<opt text="A p-value of 1% is significant." >
</opt>
<opt text="A p-value of 5% is significant." >
</opt>
<opt text="A p-value of 8% is significant.">
</opt>
<opt text="None of the above statements is true." correct="true" > A p-value can only be considered as significant in comparison to a certain significance level. 
</opt>
</choice>


### 5) When a measurement can be thought of as the average of numerous factors, its distribution tends to go to
<choice id="chap1_theo5">
<opt text="A uniform distribution." >
</opt>
<opt text="A normal distribution." correct="true" >
</opt>
<opt text="We can never know.">
</opt>
<opt text="It depends on the types of numerous factors." >
</opt>
</choice>


### 6) Which of the following statement is true?
<choice id="chap1_theo6">
<opt text="One-sample t-test can be used as long as there is no outlier in the sample." > T-test should be used when the data have no outlier AND are approximately normally distributed. 
</opt>
<opt text="T-test states the hypothesis on the sample mean and Wilcoxon signed rank test states the hypothesis in terms of sample median." > The hypothesis statement is always with respect to a population level quantity.
</opt>
<opt text="Wilcoxon signed rank test is always better than the t-test."> The Wilcoxon signed rank test may lose some power than the t-test if the data have no outlier and are approximately normally distributed.
</opt>
<opt text="T-test is a parametric test whereas Wilcoxon signed rank test is a nonparametric test." correct="true" > 
</opt>
</choice>

</exercise>





