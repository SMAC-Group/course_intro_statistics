# load data and libraries
library(palmerpenguins)
library(dplyr)

# load data
df = palmerpenguins::penguins

# Represent graphically
boxplot(___ ~ df$species)

# test that the bill length have the same location between species
kruskal.test(bill_length_mm ~ ___, data =___)

# perform a test for each combination of 2 species
df_results = data.frame("specie_1"=NA, "specie_2"=NA, "p_value"=NA, "mean_specie_1"=NA, "mean_specie_2"=NA)
all_combination_of_2 = combn(unique(df$species), 2)

# for loop to test all combination
for(i in seq(dim(___)[2])){
  
  species_combi_i = all_combination_of_2[,i]
  vec_specie_1  = df %>% filter(species %in% species_combi_i[1]) %>% pull(bill_length_mm) %>% na.omit()
  vec_specie_2 = df %>% filter(species %in%  ___) %>% pull(bill_length_mm) %>% na.omit()
  df_results[i, "specie_1"] = ___ %>% as.character()
  df_results[i, "specie_2"] = species_combi_i[2]  %>% as.character()
  df_results[i, "mean_specie_1"] = ___(vec_specie_1)
  df_results[i, "mean_specie_2"] =  mean(vec_specie_2)
  res_test = ___(x = vec_specie_1, y = vec_specie_2)
  df_results[i, "p_value"] = ___$p.value
}

# correct p value
df_results$p_value_corrected = ___(df_results$p_value, method = "BH")
df_results
