# load data and libraries
library(palmerpenguins)
library(dplyr)

# load data
df = palmerpenguins::penguins

# Represent graphically
boxplot(df$bill_length_mm ~ df$species)

# test that the bill length have the same location between species
kruskal.test(bill_length_mm ~ species, data =df)

# perform a test for each combination of 2 species
df_results = data.frame("specie_1"=NA, "specie_2"=NA, "p_value"=NA, "mean_specie_1"=NA, "mean_specie_2"=NA)
all_combination_of_2 = combn(unique(df$species), 2)

# for loop to test all combination
for(i in seq(dim(all_combination_of_2)[2])){
  
  species_combi_i = all_combination_of_2[,i]
  vec_specie_1  = df %>% filter(species %in% species_combi_i[1]) %>% pull(bill_length_mm) %>% na.omit()
  vec_specie_2 = df %>% filter(species %in% species_combi_i[2]) %>% pull(bill_length_mm) %>% na.omit()
  df_results[i, "specie_1"] = species_combi_i[1] %>% as.character()
  df_results[i, "specie_2"] = species_combi_i[2]  %>% as.character()
  df_results[i, "mean_specie_1"] = mean(vec_specie_1)
  df_results[i, "mean_specie_2"] =  mean(vec_specie_2)
  res_test = wilcox.test(x = vec_specie_1, y = vec_specie_2)
  df_results[i, "p_value"] = res_test$p.value
}

# correct p value
df_results$p_value_corrected = p.adjust(df_results$p_value, method = "BH")
df_results
