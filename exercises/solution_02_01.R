tofind = sample(x = 1:20, size = 1)
print("Guess a integer between 1 and 20, you've got 5 trials")

for(i in seq(5)){
  # print trial
  print(paste("Trial: ", i))
  # user enter guess
  myguess = as.integer(readline(prompt="Enter an integer between 0 and 50: "))
  # if guess is correct
  if(myguess == tofind){
    print(paste("You are right! The number was: " , tofind ))
    break()
  }else if(myguess != tofind & i == 5){
    print(paste("You lost! The number to guess was: ", tofind))
  }else if(myguess < tofind){
    print("Too small. Try a larger number")
  }else if(myguess > tofind){
    print("Too large. Try a smaller number")
  }
}
