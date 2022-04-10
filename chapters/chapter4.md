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

Not slides

</exercise>



<exercise id = "8" title ="Exercise: ICU admission of COVID-19 patients - Part II">


Not slides



</exercise>
