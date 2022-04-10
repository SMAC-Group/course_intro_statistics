library(idar)
data(covid)
mod = glm(icu ~ sex + ldh, data = covid, family = binomial())
ldh_to_predict = min(covid$ldh):max(covid$ldh)
pred_men = predict(mod, 
                   data.frame(sex = rep("men", length(ldh_to_predict)),
                              ldh = _________), 
                   type = "response")
pred_women = predict(mod, 
                     data.frame(sex = rep("_____", length(ldh_to_predict)), 
                                ldh = _______),
                     type = "response")

plot(covid$ldh, covid$icu, 
     xlab = "Lactate dehydrogenase (U/L)", 
     ylab = "Predicted probability of ICU admission")
grid()
lines(ldh_to_predict, pred_men, col = "#F8766D")
lines(ldh_to_predict, ___________, col = "#00BFC4")
legend("bottomright", c("Men", "Women"), 
       col = c("#F8766D", "#00BFC4"), lwd = 1)