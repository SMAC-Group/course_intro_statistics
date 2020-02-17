for(i in seq_along(letters)){
  if(i %% 2 == 0){
    myletter = letters[i]
  }else{myletter = LETTERS[i]}
  print(myletter)
}