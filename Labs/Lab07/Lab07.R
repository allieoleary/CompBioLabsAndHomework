# Allie O'Leary, Lab07, 02/28/20
setwd("Desktop/EBIO4420/CompBioLabsAndHomework/Labs/Lab07/")

#### Part One, Writing Your Own Functions #### 


#Q1

TriangleArea <- function(b, h) {
  area <- 0.5 * b * h
  return ( area )
} # function that calculated and returns the area of a triangle with base and height
TriangleArea(10, 9) # CALLING the function with a base = 10, and height = 9, [45]


#Q2

#PartA
myAbs <- function(number) {
  if (number < 0) {
    return(number * -1)
  } else {
    return(number)
  }
} # function that calculates and returns the absolute values of a number
myAbs(5) # CALLING the function with the number 5, [5]
myAbs(-2.3)  # CALLING the function with the number -2.3, [2.3]

#PartB
myAbs <- function(number) {
  new <- rep(0, length(number))
  for (i in 1:length(number)) {
    if (number[i] < 0) {
      new[i] <- number[i] * -1
    } else {
      new[i] <- number[i]
    }
  }
  return(new)
}  # function that calculates and returns the absolute values of a vector of numbers
myAbs(c(1.1, 2, 0, -4.3, 9, 12)) # CALLING the function with the numbers 1.1, 2, 0, -4.3, 9, 12, [1.1  2.0  0.0  4.3  9.0 12.0]


#Q3

FibFunction <- function(n, start) {
  fibzeros <-  rep(0, n)
  fibzeros[1] <- start
  fibzeros[2] <- 1
  range(3:n)
  for (i in 3:n) {
    fibzeros[i] <- 0 + fibzeros[i-2] + fibzeros[i-1]
  }
  return(fibzeros)
}  # function that calculates and returns the fibonacci sequence for n amount of integers
FibFunction(10, 0)
FibFunction(10, 1)  


#Q4

#PartA
SquareofDifference <- function(x , y) {
  calculated <- (x - y)^2
  return ( calculated )
} # function that calculates and returns the square of the difference between x and y
SquareofDifference(3, 5) # CALLING the function with the numbers 3 and 5, [4]
SquareofDifference(c(2, 4, 6), 4) # CALLING the function with the numbers c(2, 4, 6) and 4, [4 0 4]

#PartB
MeanFunction <- function(n) {
  total <- sum(n)
  myMean <- total/length(n)
  return( myMean )
} # function that calculates and returns the mean of the vector n
MeanFunction(c(5, 15, 18)) # CALLING the function with the numbers c(5, 15, 18), [12.66667]
DataLab07 <- read.csv("DataForLab07.csv") # importing the data for testing my MeanFunction
MeanFunction(DataLab07$x) # CALLING the function with the DataLab07 numbers, [108.9457]

#PartC
SumOfSquares <- function(n) {
  total <- sum(n)
  myMean <- total/length(n)
  subtract <- (n - myMean)^2
  summation <- sum(subtract)
  return(summation)
}  # function that calculates and returns the sum of squares of the vector n
SumOfSquares(DataLab07$x) # CALLING the function with the DataLab07 numbers, [179442.4]
