---
title: 'Semaine 1: Notions de base'
description:
  ''
prev: null
next: /chapter2
type: chapter
id: 1
---




<exercise id="1" title="Slides xaringan externe">


You can view the slides directly in the browser below. To download the slides, please check [here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture1.html#1) for the .html version or [here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture1.pdf) for the .pdf version. 

<iframe src="https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture1.html#1" width="710" height="530">
</iframe>


</exercise>



<exercise id="2" title="Slides pdf interne">


You can view the slides directly in the browser below. To download the slides, please check [here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture1.html#1) for the .html version or [here](https://raw.githack.com/stephaneguerrier/data_analytics/master/Lecture1.pdf) for the .pdf version. 
<iframe src="Lecture1.pdf" width="710" height="530">
</iframe>






</exercise>








<exercise id = "3" title ="Exemple QCM">

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

### 7) Which hypotheses should you consider to assess the validity of the previously mentioned claim:


<choice id="chap2_icu1">
<opt text="We should use A."> No, we would use A to test if there is a difference. </opt>
<opt text="We should use B."> No, we would use B to test if the mean is higher for ICU patients compared to non-ICU patients. </opt>
<opt text="We should use C." correct = "true"> Well done! 😄  </opt>
<opt text="We should use D."> No, there is a problem with these hypotheses. </opt>
<opt text="Both C and D are correct and can used."> No, there is a problem with D. </opt>
<opt text="None of them are correct."> No, one of them seems to be OK here! </opt>
</choice>



</exercise>







<exercise id="4" title="Exemple de contenus">

## Emoji

 😉 

## Math inline

<p><strong> </strong><span class="math inline">\(H_0\)</span>: <span
class="math inline">\(\mu_I = \mu_N\)</span>, <span
class="math inline">\(H_a\)</span>: <span class="math inline">\(\mu_I > \mu_N\)</span></p>


## Math equation
<p><span class="math display">\[\text{Concentration}_i = \beta_0 +
\beta_1 \text{Time}_i + \varepsilon_i\]</span></p>

## Inline Code

This course will make use of `R`, which is a programming language for statistical computing and graphics supported by the R Core Team and the [R Foundation for Statistical Computing](https://www.r-project.org/). `R` is widely used by data scientists, data miners and statisticians for data analysis and for developing statistical software. 

## Inline hyperlink

You can download the `idarps` package directly from [Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/) by executing the following `R` command:


##  Code chunk 
```R
install.packages("idarps")
```

```out
...
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (devtools)
```

## GIF
Below is a GIF which illustrates the installation of the `idarps` package:

<center>

![](gif_idarps.gif)

</center>


# Image
<center>
<img src="hex_rmd.png" width = 20%>
</center>


# Iframe
 <iframe src="https://dal-unige.shinyapps.io/rmd_app/" title="RMarkdown playground" height="800" width="770"  ></iframe> 
 




</exercise>





<exercise id="5" title="Exemple extra slides local">


<slides source="chapter1_diet">
</slides>
</exercise>




