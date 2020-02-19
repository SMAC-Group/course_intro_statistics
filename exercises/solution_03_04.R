computeVolumeCylinder = function(radius, height){
  #Compute the volume of a cylinder
  area = pi * radius^2
  volume = area * height
  return(volume)
}

computeVolumeCylinder(radius = 3, height = 15.5)