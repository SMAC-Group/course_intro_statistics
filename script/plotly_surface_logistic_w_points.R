# clean ws
rm(list=ls())

# load libraries
library(plotly)
library(reshape2)
library(htmlwidgets)

# fit model bronchitis
library(idar)
data("bronchitis")
mod2 = glm(bron ~ cigs + poll, data = bronchitis, family = binomial())
summary(mod2)
summary(bronchitis$cigs)

# do matrix of prediction
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

# define colors
mycol = c("#44234c", "#e7e82b")
hcolors=c(mycol)[(bronchitis$bron+1)]
hcolors
# plot scatter plot of observations in bronchitis
fig_1 = plot_ly(bronchitis, 
        x = ~poll, 
        y = ~cigs, 
        z = ~bron,
        text = ~bron, 
        type = "scatter3d", 
        mode = "markers",
        marker = list(color = hcolors))
# add surface of predicted conditional probabilities on scatter plot
fig_2 = fig_1 %>% 
  add_surface(x = poll_to_predict, y = cigs_to_predict, z = predicted_prob) %>% 
  layout(scene = list(xaxis = list(title = "Pollution index"),
                      yaxis = list(title = "Daily number of cigarettes"),
                      zaxis = list(title = "Predicted probability of Bronchitis")))
fig_2 = fig_2 %>% colorbar(title = "Estimated \n probability")
fig_2

saveWidget(fig_2, "static/fig_surface_points_logistic.html", selfcontained = T, libdir = "lib")
