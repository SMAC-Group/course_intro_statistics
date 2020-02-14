library(plot.matrix)
maze =       
c(c(rep(1,7)),
  c(1,0,0,0,1,0,1),
  c(1,0,1,0,1,0,1),
  c(1,0,1,0,1,0,0),
  c(0,0,1,0,1,0,1),
  c(1,0,1,0,0,0,1),
  c(rep(1,7)))

matmaze = matrix(maze, ncol=7, byrow = T, )
plot(matmaze, col=c("white", "black"))
points(2,3)

starting_pos = c(1,3)

plot(matmaze, col=c("white", "black"))
starting_pos = c(1,3)
points(x=starting_pos[1], y=starting_pos[2])
actual_pos=c(2,3)
new_pos = function(actual_pos, maze){
  #if space in front
  if(matmaze[8-actual_pos[2], actual_pos[1]+1 ] == 0){
    return(c(actual_pos[1]+1, actual_pos[2]))
    #space on right
  }else if(matmaze[8-actual_pos[2]+1, actual_pos[1] ] == 0){
    return(c(actual_pos[1]+1, actual_pos[2]))
  }
}
new_pos(c(2,3), maze = matmaze)

plot(matmaze)
matmaze[3,]

matmaze[1-2,2]

plot(matmaze)
new_pos(c(1,3), matmaze)
points(x=1,y=3, col = "blue")

plot(matmaze, col=c("white", "black"))
myposition = starting_pos
for(i in seq(5)){
  
  print(paste("Iteration ",i ))
  points(x = myposition[1], y = myposition[2], col = "red")
  next_position = new_pos(actual_pos = myposition, matmaze)
  myposition = next_position
  
}
