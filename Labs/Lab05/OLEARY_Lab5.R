#Allie O'Leary, Lab 05, 02/14/2020

setwd("/Users/allieoleary/Desktop/EBIO4420/CompBioLabsAndHomework/Labs/Lab05/") #setting working directory

####Part One, Practice some simple conditionals####

#P1Q1
x <- 1 #assigning random number to variable x
if (x > 5) {
  print("x is greater than 5")
} else {
  print("x is smaller than 5")
} #an if statement that will print if x is smaller than or greater than 5

#P1Q2
library(readr) 
exampledata <- read_csv("Desktop/EBIO4420/CompBioLabsAndHomework/Labs/Lab05/exampledata.csv") #importing the example data for lab 5
exampledata <- exampledata[[1]] #taking out the first object from the data frame 

  #PartA
for (i in 1:length(exampledata)) {
  if(exampledata[i] < 0) {
    exampledata[i] <- NA
  }
} #writing a for loop that changes every negative value to be equal to NA

  #PartB
isna <- is.na(exampledata) #creating a vector that contains the TRUES and FALSES for the is.na function 
exampledata[isna] <- NaN #indexing the is.na in the original data and renaming all those positions to Nan

  #PartC
isnan <- is.nan(exampledata) #creating a vector that contains TRUES and FALSEs for the is.nan function
newnegnums <- 0 #avioding magic numbers, 0 is our current number for all of the negative values in the csv
exampledata[isnan] <- newnegnums #indexing the is.nan in the data and renaming those to 0, or newnegnums

  #PartD
sum(exampledata >= 50 & exampledata <= 100) #this prints the number of TRUEs to the commands I am giving about

  #PartE
FiftyToOneHundred <- subset(exampledata, exampledata >= 50 & exampledata <= 100) #subsetting the data to contain only values of 50 to 100 (those numbers included)

  #PartF
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv") #CSV made from vector FiftyToOneHundred saved to my working directory

#P1Q3
library(readr) 
CO2 <- read_csv("Desktop/EBIO4420/CompBioLabsAndHomework/Labs/Lab05/CO2Data.csv") #importing the CO2 data for lab 5

  #PartA
GasNonZeroFirstYr <- CO2$Year[CO2$Gas > 0][1] #Indexing with logical operators to find the first year that Gas emissions were more than 0 (1885)

  #PartB
TotalEmmisTwoThreeMilYrs <- CO2$Year[CO2$Total >= 200 & CO2$Total <= 300] #Indexing with logical operators to find the years that Total emissions were anywhere from 200-300 (1879 through 1887)


####Part Two, Loops + Conditionals + Biology####

  #P2First
totalGenerations <- 1000
initPrey <- 100 #initial prey abundance at time t = 1
initPred <- 10 #initial predator abundance at time t = 1
a <- 0.01 #attack rate
r <- 0.2 #growth rate of prey
m <- 0.05 #mortality rate of predators
k <- 0.1 #conversion constant of prey into predators

  #P2Second
time <- 1:totalGenerations #total time of the model 
n <- 1:totalGenerations #vector of prey for loop
n[1] <- initPrey #setting initial prey in the vector
p <- 1:totalGenerations #vector of predators for loop
p[1] <- initPred #setting initial predator for loop

  #P3ThirdFourth
for (i in 2:totalGenerations) {
  n[i] <- n[i-1] + (r * n[i-1] - (a * n[i-1] * p[i-1]))
  if(n[i] < 0) {
   n[i] <- 0 
  }
  p[i] <- p[i-1] + (k * a * n[i-1] * p[i-1]) - (m * p[i-1])
  if(p[i] < 0) {
    p[i] <- 0
  }
} #loop for the model with both predator and prey abundance equations, if statements making sure that populations do not become less than 0, as that is impossible

  #P3Fifth
plot(time, n, 
     type = "l",
     col = "green",
     ylab = "Population Abundances",
     xlab = "Time (Generations)",
     main = "Lotka-Volterra Model Over Generation Time"
     ) #ploting initial lines for model
lines(p,
      col = "red") #adding predator line
legend("topright", 
       legend = c("Prey Abundance", "Predator Abundance"),
       col = c("green", "red"),
       lwd = 1
       ) # adding a legend 

  #P3Sixth
TimeStep <- time #renaming our time vector
PreyAbundance <- n #renaming our prey abundance
PredatorAbundance <- p #renaming our predator abundance
MyResults <- cbind(TimeStep, PreyAbundance, PredatorAbundance) #putting these things into a matrix
write.csv(x = MyResults, file = "PredPreyResults.csv") #adding a csv file to my lab 05 folder (working directory)
