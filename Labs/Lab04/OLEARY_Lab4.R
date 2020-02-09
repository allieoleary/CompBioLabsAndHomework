#Allie O'Leary, Lab 4, 02/07/2020


####Part One, Practicing writing "for loops"####

#P1Q1
for (i in seq(1,10)) {
  print("hi")
  } #this is a for loop that prints "hi" 10 times in my console

#P1Q2
timweeks <- 1:8 #we want to know how much money Tim will have in 8 weeks
piggybank <- 10 #this is the starting amount, in dollars, that Tim has which will be updated throughout the weeks
allowance <- 5 #this is Tim's allowance, in dollars, every week
packsbought <- 2 #this is the number of packs of gum Tim buys, per week
packcost <- 1.34 #this is the amount each pack of gum costs, in dollars
for (i in seq(timweeks)) {
  piggybank <- ((piggybank + allowance) - (packsbought * packcost))
  print(piggybank)
} #this is the for loop that will readjust the amount of money that Tim has in his piggy bank

#P1Q3
populationsize <- 2000 #this is the number of individuals in the population for P1Q3
populationshrink <- .05 #this is how much the population shrinks by each year
populationyears <- 1:7 #this is the number of years in which we want to know the population size
for (i in seq(populationyears)) {
  populationsize <- populationsize - (populationsize * populationshrink)
  print(populationsize)
} #for loop evaluating the population size after 7 years when it decreases by 5% each year

#P1Q4
n <- 2500 #abundance of population at time 1, current time step
K <- 10000 #environmental carrying capacity for the population
r <- 0.8 #intrinsic growth rate for this population 
timesteprange <- 2:12 #we want to know the abundance at time 12, after given abundance at time 1
for (i in (timesteprange)) {
  n[i] <- n[i - 1] + (r * n[i-1] * (K - n[i-1])/K)
  print(n[i])
} #for loop evaluating the abundance of the population at time 12


####Part Two, Adding practicing storing the data produced from loops in arrays####

#P2Q5
#PartA
zero <- rep(0, 18) #making a vector of 18 zeros
#PartB
for (i in 1:18) {
  zero[i] <- (i * 3)
} #for loop that is replacing each position with 3 times its position number
print(zero) #printing the new results from the for loop
#PartC
zero <- rep(0, 18) #"resetting" vector to 0's
for (i in 1:18) {
  zero[1] <- 1
} #changing the first number in the vector to 1, instead of 0
print(zero) #printing the new results for the for loop
#PartD
for (i in 2:18) {
  zero[i] <- 1 + (2 * zero[i-1])
} #for loop changing the vector to be one plus twice the previous entry
print(zero) #printing the new vector

#P2Q6
fibzeros <-  rep(0, 20) #making a vector of 20 zeros for the fibonacci sequence 
fibzeros[2] <- 1 #changing the second number in vector to 1 to start the sequence 
print(fibzeros) #printing the new vector 
for (i in 3:20) {
  fibzeros[i] <- 0 + fibzeros[i-2] + fibzeros[i-1]
}
print(fibzeros)

#P2Q7
abundance <- 2500 #abundance of population at time 1, current time step
K <- 10000 #environmental carrying capacity for the population
r <- 0.8 #intrinsic growth rate for this population 
time <- 2:12 #we want to know the abundance at time 12, after given abundance at time 1
for (i in (time)) {
  abundance[i] <- abundance[i - 1] + (r * abundance[i-1] * (K - abundance[i-1])/K)
  print(abundance[i])
} #for loop evaluating the abundance of the population at time 12
time <- c(1:12) #resetting the time vector to include time one, because it needs to have an equal number of integers as the abundance vector does
plot(time, abundance,
     main = "Population Abundance Over Time",
     ylab = "Abundance",
     xlab = "Time",
     col = "blue"
     ) #making the graph for abundance vs. time according to the dizcrete-time logistic growth equation

