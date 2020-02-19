---
title: 'Chapter 3: Functions'
description:
  'Write your own functions'
prev: /chapter2
next: null
type: chapter
id: 3
---

<exercise id="1" title="Functions" type = "slides">

<slides source="chapter3_01">
</slides>


</exercise>

<exercise id="2" title="Functions: Exercises" type = "slides">

### 1) Write a function that can compute the volume of a cylinder.

<div style="text-align:center">
<img src="cylinder2.png" alt="" width="15%">
</div>

<codeblock id="03_04">
Trx to replicate the execution of steps presented in the flow-chart using a `while` loop.
</codeblock>

### 2) Find the GCD of two numbers

In this exercise you will implement a function that finds the greatest common divisor (GCD) of two numbers, the largest number that divides both of them without leaving a remainder by executing the Euclidean algorithm. One can find
further details about the Euclidean algorithm [here](https://en.wikipedia.org/wiki/Euclidean_algorithm). The Figure below presents a flow-chart of the algorithm.

<div style="text-align:center">
<img src="euclidean_flow_chart.png" alt="EUclidean algorithm flow-chart" width="25%">
</div>

<codeblock id="03_02">
Trx to replicate the execution of steps presented in the flow-chart using a `while` loop.
</codeblock>



### 3) Fibonacci Sequence 

In this exercise, you will implement a function that returns the \\(n\\) number of the Fibonacci sequence noted  \\(\mathcal{F}\_{n}\\). You can read about the Fibonacci sequence [here](https://en.wikipedia.org/wiki/Fibonacci_number). 

<iframe src="https://giphy.com/embed/1Qj94sCeIEBtC" width="350" " frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/physics-1Qj94sCeIEBtC"></a></p>

<codeblock id="03_01">
This is a great example to use a recursive function.
</codeblock>

### 4) Bootstrap application for confidence interval of a statistic. (😱)

Imagine that you are interested in a statistic \\(T\_n\\) that is any function of the data (i.e. \\(T\_n = g(X\_1, ..., X\_n\\)) and that you want to estimate the standard error for the point estimate \\(\hat{T}\_n\\) . Let's consider that we are interested in estimating the median of a given population. That is, \\(T\_n\\) = \\(\mathcal{F}\_{0.5}\\), where \\(\mathcal{F}\\) is the unknown true cumulative distribution of\\(X\_i\\).

One could compute a bootstrap estimate of the variance of \\(T\_n\\) as such:

For \\(1,2,3, ..., B\\) iterations
- Draw \\(X\_{i}^\star,..., X\_i^\star \sim \widehat{F}_{n}\\) of the sample
- Compute \\(T\_{n}^{\star}=g\left(X\_{1}^{\star}, \ldots, X\_{n}^{\star}\right)\\)

Let 
<body>
<p><math display="block" xmlns="http://www.w3.org/1998/Math/MathML"><semantics><mrow><msub><mi>v</mi><mstyle mathvariant="normal"><mi>b</mi><mi>o</mi><mi>o</mi><mi>t</mi></mstyle></msub><mo>=</mo><mfrac><mn>1</mn><mi>B</mi></mfrac><munderover><mo>∑</mo><mrow><mi>b</mi><mo>=</mo><mn>1</mn></mrow><mi>B</mi></munderover><msup><mrow><mo stretchy="true" form="prefix">(</mo><msubsup><mi>T</mi><mrow><mi>n</mi><mo>,</mo><mi>b</mi></mrow><mo>*</mo></msubsup><mo>−</mo><mfrac><mn>1</mn><mi>B</mi></mfrac><munderover><mo>∑</mo><mrow><mi>r</mi><mo>=</mo><mn>1</mn></mrow><mi>B</mi></munderover><msubsup><mi>T</mi><mrow><mi>n</mi><mo>,</mo><mi>r</mi></mrow><mo>*</mo></msubsup><mo stretchy="true" form="postfix">)</mo></mrow><mn>2</mn></msup></mrow><annotation encoding="application/x-tex">v_{\mathrm{boot}}=\frac{1}{B} \sum_{b=1}^{B}\left(T_{n, b}^{*}-\frac{1}{B} \sum_{r=1}^{B} T_{n, r}^{*}\right)^{2}</annotation></semantics></math></p>
</body>

be the bootstrap estimate of the variance of \\(\hat{T}\_n\\) 

One could then compute confidence interval \\( C\_n \\) for \\(\hat{T}\_n\\) with different methods such as
- The Normal interval \\( C\_n \\) =  \\( T\_{n} \pm z\_{\alpha/2}\hat{se}\_{boot} \\) where \\(\hat{se}\_{boot} = \sqrt{\upsilon\_{boot}} \\) 
- The Percentile interval \\( C\_n \\) = (\\( \theta\_{\alpha/2}^\star \\)) , \\( \theta\_{1-\alpha/2}^\star \\))


Complete this code to obtain a function that, given a vector of observations, compute the bootstrap estimate of the variance of the median and return a list with the following elements:

- The vector of boostrapped median
- The number of bootstrap iterations, an input of the function
- The bootstrap estimate of the variance
- The bootstrap estimate of the standard error
- The Normal interval for the median
- The percentile interval for the median

<codeblock id="03_03">
One can find further information regarding the bootstrap here : https://en.wikipedia.org/wiki/Bootstrapping_(statistics)
</codeblock>





</exercise>