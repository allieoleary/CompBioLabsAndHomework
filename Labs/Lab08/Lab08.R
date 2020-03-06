# Allie O'Leary, Lab 08, 03/06/2020

setwd("/Users/allieoleary/Desktop/EBIO4420/CompBioLabsAndHomework/Labs/Lab08/")

LogisticGrowthFunction <- function(r, K, time, abundance) {

  for (i in (2:time)) {
    abundance[i] <- abundance[i - 1] + (r * abundance[i-1] * (K - abundance[i-1])/K)
    if(abundance[i] < 0) {
      abundance[i] <- 0
    }
  } #for loop evaluating the abundance of the population at time 12
  print(abundance)
  
  
  plot(1:time, abundance,
       main = "Population Abundance Over Time",
       ylab = "Abundance",
       xlab = "Time",
       col = "blue"
  ) #making the graph for abundance vs. time according to the dicrete-time logistic growth equation
  
  return(cbind(1:time, abundance))
  
}


GenTime <- LogisticGrowthFunction(0.8, 10000, 12, 2500)
LogisticGrowthFunction(1.0, 20, 12, 300)


write.csv(x = GenTime,
          file = "GenTime.csv") #adding a csv file to my lab 05 folder (working directory)
