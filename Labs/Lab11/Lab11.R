# Allison O'Leary, Lab11, 04.03.2020
setwd("/Users/allieoleary/Desktop/EBIO4420/CompBioLabsAndHomework/Labs/Lab11/") # setting working directory 


#### Part I: Getting Set Up ####
#Q3
MainData <- read.csv("GlobalWoodDensityDatabase.csv", stringsAsFactors = F) # Uploading Data
colnames(MainData)[4] <- "WoodDensity" # renaming the fourth column
colnames(MainData)[6] <- "ReferenceNumber" # renaming the sixth column to remove the period it contains
nrow(MainData) # checking how many rows there are originally 

#### Part II: Working With Density Data ####
#Q4
#a
NAPosition <- which(is.na(MainData$WoodDensity)) # finding and assinging a variable to the row that is missing data/has and NA
#b
MainData <- MainData[-NAPosition, ] # removing the NA row
nrow(MainData) # ensuring that I have one less row than before

#Q5
BinomFamilyMean <- MainData %>% group_by(Binomial, Family) %>% summarise(mean(WoodDensity))
colnames(BinomFamilyMean)[3] <- "WoodDensityMean"

#6
#a
FamilyMean <- BinomFamilyMean %>% group_by(Family) %>% summarise(mean(WoodDensityMean))
colnames(FamilyMean)[2] <- "WoodDensityMeanFam"
#b
AscendingFamilyMean <- FamilyMean %>% arrange(WoodDensityMeanFam)
#c
LastEight <- nrow(AscendingFamilyMean)
LargestEight <- AscendingFamilyMean$Family[(LastEight-7):LastEight]
SmallestEight <- AscendingFamilyMean$Family[1:8]

