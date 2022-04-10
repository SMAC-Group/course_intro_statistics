p_1 = plot_ly(x = poll_to_predict, y = cigs_to_predict, z = predicted_prob) %>% add_surface()
library(htmlwidgets)
saveWidget(p_1, "p_1.html", selfcontained = T, libdir = "lib")
fig = plot_ly(x = poll_to_predict, y = cigs_to_predict, z = predicted_prob) %>% add_surface(
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
fig = fig %>% layout(scene = list(xaxis = list(title = "Pollution index"),
                                  yaxis = list(title = "Daily number of cigarettes"),
                                  zaxis = list(title = "Predicted probability of Bronchitis")))
fig = fig %>% colorbar(title = "Estimated \n probability")
fig
p_2 = fig
saveWidget(p_2, "p_2.html", selfcontained = T, libdir = "lib")
