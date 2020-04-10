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
BinomFamilyMean <- MainData %>% group_by(Binomial, Family) %>% summarise(mean(WoodDensity)) # piping so that we only have Binomial, family and their wood density means in a graph
colnames(BinomFamilyMean)[3] <- "WoodDensityMean" # renaming the wood density mean column name

#Q6
#a
FamilyMean <- BinomFamilyMean %>% group_by(Family) %>% summarise(mean(WoodDensityMean)) # piping so that we only have family and wood density means
colnames(FamilyMean)[2] <- "WoodDensityMeanFam" # renaming the wood density mean column name 
#b
AscendingFamilyMean <- FamilyMean %>% arrange(WoodDensityMeanFam) # sorting our results from 6a in order of lowest wood density to highest 
#c
LastEight <- nrow(AscendingFamilyMean) # creating a variable to help us section out the largest eight means
LargestEight <- AscendingFamilyMean$Family[(LastEight-7):LastEight] # creating a varable that shows us which 8 familes have the largest densities 
View(LargestEight)
SmallestEight <- AscendingFamilyMean$Family[1:8] # creating a variable that shows us which families have the smallest densities
View(SmallestEight)


#### Part III: Plotting ####
#Q7
library("ggplot2") 
#GraphOne
EightMostDense <- BinomFamilyMean[ BinomFamilyMean$Family %in% LargestEight, ] # subsetting data to work with it and combine data from question 5 and 6
Lp <- ggplot(EightMostDense) + 
  geom_boxplot(aes(y = WoodDensityMean)) # creating the main ggplot for the eight most dense species 
Lp <- Lp + theme(
  axis.ticks.x = element_blank(),
  axis.text.x = element_blank()) # removing x axis ticks and numbers 
Lp <- Lp + facet_wrap( ~ Family, scales="fixed", nrow = 2) # editing how the families apear: separate, one scale, two rows 
Lp <- Lp + ylab("Density (g/cm^3)") + ggtitle("Mean Wood Density of Species by Family (Eight Largest)") # adding labels 
Lp 
#GraphTwo
EightLeastDense <- BinomFamilyMean[ BinomFamilyMean$Family %in% SmallestEight, ] # subsetting data to work with it and combine data from question 5 and 6
Sp <- ggplot(EightLeastDense) + 
  geom_boxplot(aes(y = WoodDensityMean)) # creating the main ggplot for the eight least dense species 
Sp <- Sp + theme(
  axis.ticks.x = element_blank(),
  axis.text.x = element_blank()) # removing x axis ticks and numbers 
Sp <- Sp + facet_wrap( ~ Family, scales="fixed", nrow = 2) # editing how the families apear: separate, one scale, two rows 
Sp <- Sp + ylab("Density (g/cm^3)") + ggtitle("Mean Wood Density of Species by Family (Eight Smallest)") # adding labels
Sp 

#Q8
#GraphOne
LpNew <- ggplot(EightMostDense) + 
  geom_boxplot(aes(x = Family, y = WoodDensityMean)) # creating the main ggplot for the eight most dense species 
LpNew <- LpNew + coord_flip() # flipping the coordinates
LpNew <- LpNew + ylim(c(0,1.2)) # changing the limits on the x axis (or the y, as that is what R is thinking of it as)
LpNew <- LpNew + xlab("Families")  + ylab("Density (g/cm^3)") + ggtitle("Mean Wood Density of Species by Family (Eight Largest)") # adding labels 
LpNew
#GraphTwo
SpNew <- ggplot(EightLeastDense) + 
  geom_boxplot(aes(x = Family, y = WoodDensityMean)) # creating the main ggplot for the eight most dense species 
SpNew <- SpNew + coord_flip() # flipping the coordinates
SpNew <- SpNew + ylim(c(0,1.2)) # changing the limits on the x axis (or the y, as that is what R is thinking of it as)
SpNew <- SpNew + xlab("Families")  + ylab("Density (g/cm^3)") + ggtitle("Mean Wood Density of Species by Family (Eight Smallest)") # adding labels 
SpNew

