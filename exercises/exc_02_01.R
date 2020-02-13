tofind = ___
print("Guess a integer between 1 and 20, you've got 5 trials")

for(i in ___){
  # print trial
  print(paste("Trial: ", i))
  # user enter guess
  myguess = as.integer(readline(___)
  # if guess is correct
  if(___){
    print(paste("You are right! The number was: " , tofind ))
    break()
  }else if(___){
    print(paste("You lost! The number to guess was: ", tofind))
  }else if(___){
    print("Too small. Try a larger number")
  }___(___){
    print("Too large. Try a smaller number")
  }
}