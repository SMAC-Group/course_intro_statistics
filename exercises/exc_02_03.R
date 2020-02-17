
#load libraries
library(plot.matrix)
#https://www.laurentluce.com/posts/solving-mazes-using-python-simple-recursivity-and-a-search/

#define maze
maze =       
c(c(rep(1,7)),
  c(1,0,0,0,1,0,1),
  c(1,0,1,0,1,0,1),
  c(1,0,1,0,1,0,2),
  c(0,0,1,0,1,0,1),
  c(1,0,1,0,0,0,1),
  c(rep(1,7)))

matmaze = matrix(maze, ncol=7, byrow = T)
colnames(matmaze)=(seq(7))
rownames(matmaze)=rev(seq(7))

plot(matmaze, col=c("white", "black"))
points(1,3)
starting_pos = c(1,3)
actual_position=starting_pos
points(x=starting_pos[1], y=starting_pos[2])
actual_pos=c(4,5)


matmaze= matrix(seq(49), ncol=7)

matmaze
matmaze["1",3]
matmaze[1,5]
matmaze[xpos, ypos]
matmaze[xpos, 3]


matmaze
actual_position=c(7,4)


mysearch = function(actual_position, matmaze){
  xpos = as.character(actual_position[1])
  ypos = as.character(actual_position[2])
  if(matmaze[ypos,xpos] == 2){
    print(paste("Found exit at ", c(xpos,ypos)))
    return(TRUE)
  }else if(matmaze[xpos,ypos]==1){
    print(paste("Wall at ", c(xpos,ypos)))
    return(FALSE)
  }else if(matmaze[xpos,ypos]==2){
    print(paste("Wall at ", c(xpos,ypos)))
    return(FALSE)
  }
  print(paste("Visiting ", c(xpos,ypos)))
  if((xpos < dim(matmaze)[1]-1 & mysearch(xpos+1,ypos)) |
     (ypos > 0 & mysearch(xpos, ypos-1)) |
     (xpos > 0 & mysearch(xpos-1, ypos)) |
     (ypos < dim(matmaze)[1]-1 & mysearch(xpos, ypos+1))
  ){return(True)}
  {return(False)}
}

mysearch(c(1,4), matmaze = matmaze)
  
  if ((x < len(grid)-1 and search(x+1, y))
      19
      or (y > 0 and search(x, y-1))
      20
      or (x > 0 and search(x-1, y))
      21
      or (y < len(grid)-1 and search(x, y+1))):
    22
  return True
  23
  
  24
  return False
  #explore neighbor
  
}




new_pos = function(actual_pos, matmaze){
  
  #if space in front
  if(matmaze[, actual_pos[1]+1 ] == 0){
    return(c(actual_pos[1]+1, actual_pos[2]))
    #space on right
  }else if(matmaze[8-actual_pos[2]+1, actual_pos[1] ] == 0){
  return(c(actual_pos[1], actual_pos[2]-1))
    #space on left
  }else if(matmaze[8-actual_pos[2]-1, actual_pos[1] ] == 0){
    return(c(actual_pos[1], actual_pos[2]+1))
  }
    #left

}
new_pos(c(2,4), matmaze =  matmaze)

plot(matmaze)
matmaze[3,]

matmaze[1-2,2]

plot(matmaze)
new_pos(c(1,3), matmaze)
points(x=1,y=3, col = "blue")

plot(matmaze, col=c("white", "black"))
myposition = starting_pos
for(i in seq(20)){
  
  print(paste("Iteration ",i ))
  points(x = myposition[1], y = myposition[2], col = "red")
  next_position = new_pos(actual_pos = myposition, matmaze)
  myposition = next_position
  
}

new_pos(c(4,5), matmaze = matmaze)
