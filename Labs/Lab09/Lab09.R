# Allison O'Leary, Lab 09, 03/13/2020
setwd("/Users/allieoleary/Desktop/EBIO4420/CompBioLabsAndHomework/Labs/Lab09/")

####Problem One####
camData <- read.csv("CusackEditedDATA.csv", stringsAsFactors = F, header = T) # Importing the CSV file into script

smallVec <- camData$DateTime[1:7] # Creating a smaller offset of data to work with in using the strptime command

strptime(smallVec, "%d/%m/%Y %H:%M") # formatting the dates and times into readable views 

Test <- strptime(smallVec, "%d/%m/%Y %H:%M") # setting up vector to understand the information we have just created

str(Test) # what kind of data have we just created?

CorrectDateTime <- strptime(camData$DateTime, "%d/%m/%Y %H:%M") # appling our command to the whole data set

camData$DateTime <- CorrectDateTime # rewriting the correct DateTime over the old 

as.POSIXlt(camData$DateTime)

