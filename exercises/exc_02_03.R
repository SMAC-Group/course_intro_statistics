# load libraries
library(plot.matrix)

# define maze
maze =
  c(c(1,1,1,1,1,1,1,1,1,0,1),
    c(1,0,0,0,1,0,0,0,1,0,1),
    c(1,0,1,0,1,0,1,0,1,0,1),
    c(1,0,1,0,0,0,1,0,1,0,1),
    c(1,0,1,1,1,1,1,0,1,0,1),
    c(1,0,0,0,0,0,1,0,0,0,1),
    c(1,1,1,0,1,0,1,1,1,1,1),
    c(1,0,0,0,1,0,0,0,1,0,1),
    c(1,0,1,1,1,1,1,1,1,0,1),
    c(1,0,0,0,0,0,0,0,0,0,1),
    c(1,0,1,1,1,1,1,1,1,1,1)
  )

# define as matrix
matmaze = matrix(maze, ncol= sqrt(length(maze)) , byrow = T)

# define rownames and colnames
colnames(matmaze)=(seq(sqrt(length(maze))))
rownames(matmaze)=rev(seq(sqrt(length(maze))))

# define search fct

search_new_pos = function(actual_pos, actual_dir){
  # define possible direction
  # going right on the map
  if(all(actual_dir == c(1,0))){
    go_right = c(0,-1)
    go_left = c(0,1)
    turn_back = c(-1,0)
    # going left on the map
  }else if(___){
    go_right = c(0,1)
    go_left = c(0,-1)
    turn_back = c(1,0)
    # going up on the map
  }else if(all(actual_dir == c(0,1))){
    go_right = c(1,0)
    go_left = c(-1,0)
    turn_back = c(0,-1)
    # going down on the map
  }else if(___){
    go_right = c(-1,0)
    go_left = c(1,0)
    turn_back = c(0,1)
  }
  
  # Evaluate in front, left and right
  
  # position to evaluate in front
  new_pos_to_evaluate_front = actual_pos+actual_dir
  x_new_pos_front = as.character(new_pos_to_evaluate_front[2])
  y_new_pos_front = as.character(new_pos_to_evaluate_front[1])
  
  # position to evaluate to the right
  new_pos_to_evaluate_right = actual_pos+go_right
  x_new_pos_right = as.character(new_pos_to_evaluate_right[2])
  y_new_pos_right = as.character(new_pos_to_evaluate_right[1])
  
  # position to evaluate to the left
  new_pos_to_evaluate_left = actual_pos+go_left
  x_new_pos_left = as.character(new_pos_to_evaluate_left[2])
  y_new_pos_left = as.character(new_pos_to_evaluate_left[1])
  
    # evaluate position in front
  if(___){
    new_pos = new_pos_to_evaluate_front
    actual_dir = actual_dir
    # evaluate position right
  }else if(___){
    new_pos = new_pos_to_evaluate_right
    actual_dir = go_right
    # evaluate position left
  }else if(___){
    new_pos = new_pos_to_evaluate_left
    actual_dir = go_left
    # else turn back
  }else{
    new_pos = actual_pos+turn_back
    actual_dir = -actual_dir
  }
  out = list(new_pos, actual_dir)
  return(out)
}

# plot maze and define starting and final position
plot(matmaze, col=c("white", "black"), key=NULL, main ="Maze")

# define starting and final position
starting_pos = c(2,1)
final_pos = c(10,11)

# plot starting and final position
points(x=starting_pos[1], y=starting_pos[2], col = "darkgreen", pch = 16, cex = 5)
points(x=final_pos[1], y=final_pos[2], col = "red", pch = 16, cex = 5)

# define initial position, initial dir, iteration number and time_delay
actual_pos = starting_pos
actual_dir = c(0,1)
iteration = 1
time_delay=.01

# launch search and continue search while actual position is not equal to final position
while(___){
  res = search_new_pos(actual_pos = actual_pos, actual_dir = actual_dir)
  actual_pos = res[[1]]
  actual_dir = res[[2]]
  text(x = actual_pos[1], y = actual_pos[2], labels = iteration, cex = 2, col ="blue4")
  Sys.sleep(time_delay)
  iteration = iteration+1
}

