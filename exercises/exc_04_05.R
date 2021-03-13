library(tidyr)

df = data.frame(id = c("01", "02", "03", "04", "05"),
                treatment_control = c(1,0,1,1,0),
                measure_1 = c(.21,.45, .6, .71, .11),
                measure_2 = c(.43, .72, .5, .41, .52),
                measure_3 = c(.52, .87, .42, .14, .23),
                measure_4 = c(.61, .97, .61, .26, .85)
)

df

# pivot data
___(df, cols = -c("id", ___),
             ___ = "measurement",
             values_to = ___)
