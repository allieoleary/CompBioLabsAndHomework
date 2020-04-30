# Allison O'Leary, Independent Project
setwd("/Users/allieoleary/Desktop/EBIO4420/CompBioLabsAndHomework/IndepProj/") # setting working directory 


OriginalData <- read.csv("OriginalData.csv")  # uploading data 


#### Viewing Data ####
OrdersAll <- levels(OriginalData$Order)       # there are 21 different orders of mammals within the data set
SpeciesAll <- levels(OriginalData$Species)    # there are 529 different species within the orders present/data
head(OriginalData)                            # viewing head of data, there are some NA's present
tail(OriginalData)                            # viewing tail of data, there are some NA's present

 

#### Changing NA's to 0's ####
isna <- is.na(OriginalData)                   # creating a T/F vector of the NA's present in the data
nomagicnumbers <- 0                           # creating a variable equal to zero to avoid magic numbers
OriginalData[isna] <- nomagicnumbers          # replacing using indexing all of the NA's with zeros 



#### Removing Unnecessary Columns ####
DataWColumnRemoval = subset(OriginalData, select = -c(MCpf, MCc, MCg, MCh, AlloAll, SM, LT, GT, IBI, BMn, BMw, BMin, ML, NoC))                                                                      # removing the columns that I no longer want to work with
colnames(DataWColumnRemoval)[3] <- "MaleCare"      # renaming columns
colnames(DataWColumnRemoval)[4] <- "MaleProvision"  # renaming columns
colnames(DataWColumnRemoval)[5] <- "FemaleBodyMass" # renaming columns
colnames(DataWColumnRemoval)[6] <- "LitterSize"     # renaming columns
colnames(DataWColumnRemoval)[7] <- "LittersPerYear" # renaming columns



#### Deciding What Orders to Keep ####
require(dplyr)                                      # tidy verse package install 

OrderOnesSpeciesCounts <- DataWColumnRemoval %>%  
  group_by(Order) %>%
  summarize( NumOfOnes = sum(MaleCare),
             NumOfSpecies = n() )                   # viewing how many species & "1"'s there are present for each of the orders
                                                    # orders w/ less than one "1" and/or orders with less than 6 species will not be looked at
View(OrderOnesSpeciesCounts)                        # KEEPING: Carnivora, Primates and Rodentia

## Note: Originally, I subset all of the orders into their own vectors. I decided to only graph the orders that had both "1" and "0" for male care: which were primates, carnivora, and rodentia. I also deleted any of the orders that had less than 4 species present, as I did not feel that was sufficient amounts data to graph. It took a LONG time. For the future I have found that I can use tidyverse piping to be more efficient


#### Creating Vectors with only one Order Present ####
Carnivora <- subset(DataWColumnRemoval, Order=="Carnivora")   # subsetting carnivara data
Primates <- subset(DataWColumnRemoval, Order=="Primates")     # subsetting primates data
Rodentia <- subset(DataWColumnRemoval, Order=="Rodentia")     # subsetting rodentia data 



#### Making Graphs ####
library(ggplot2)                                              # importing ggplot to make box plots

## Creating to use in boxplots
my_theme <- theme(plot.caption=element_text(size=20, vjust = 0.55,
                    hjust = 0.99, colour = "black", family = "Eurostile"),
                  plot.background = element_rect(fill = "#DCDCDC"),
                  panel.background = element_rect(colour = "#DCDCDC"),
                  axis.text = element_text(colour = "black", size = 10))
                                                        # creating style for the background on the boxplot
  # credit: https://stackoverflow.com/questions/57946350/error-dont-know-how-to-add-rhs-to-a-theme-object-when-saving-theme-formattin



#### Carnivora Graphs #####
## Carnivora - Male Care vs. Litter Size
Carnivora$MaleCare <- as.factor(Carnivora$MaleCare)     # making Male care a factor, so that it shows properly
Carnivora$MaleCare <- as.character(Carnivora$MaleCare)  # ^ making Male Care a character also works
  
CarnivoraLSMC <- ggplot( data = Carnivora ) + 
  geom_boxplot( 
    mapping = aes( x = MaleCare , y = LitterSize, group = MaleCare, colour=MaleCare)) + 
  theme(axis.ticks.x = element_blank(),                                                   # removing X axis ticks
        axis.text.x = element_blank()) +                                                  # removing X axis num's
  labs(title="Litter Size Dependent on Male Care in Order Carnivora", y = "Litter Size")  # adding label/title
  CarnivoraLSMC + my_theme                                                                # adding in my theme

## Carnivora - Male Care vs. Litters Per Year
CarnivoraLPYMC <- ggplot( data = Carnivora ) + 
  geom_boxplot( 
    mapping = aes( x = MaleCare , y = LittersPerYear, group = MaleCare, colour=MaleCare)) + 
  theme(axis.ticks.x = element_blank(),                                                   # removing X axis ticks
        axis.text.x = element_blank()) +                                                  # removing X axis num's
  labs(title="Litters per Year Dependent on Male Care in Order Carnivora", y = "Litters Per Year")       
                                                                                          # adding label/title
  CarnivoraLPYMC + my_theme                                                               # adding in my theme  
  
## Carnivora - Male Care vs. Female Body Mass
CarnivoraFBMMC <- ggplot( data = Carnivora ) + 
  geom_boxplot( 
    mapping = aes( x = MaleCare , y = FemaleBodyMass, group = MaleCare, colour=MaleCare)) + 
  theme(axis.ticks.x = element_blank(),                                                   # removing X axis ticks
        axis.text.x = element_blank()) +                                                  # removing X axis num's
  labs(title="Female Body Mass Dependent on Male Care in Order Carnivora", y = "Female Body Mass (g)")       
                                                                                          # adding label/title
  CarnivoraFBMMC + my_theme                                                               # adding in my theme    

  
  
##### Primates Graphs ####    
## Primates - Male Care vs. Litter Size 
Primates$MaleCare <- as.factor(Primates$MaleCare)     # making Male care a factor, so that it shows properly  

PrimatesLSMC <- ggplot( data = Primates ) + 
    geom_boxplot( 
      mapping = aes( x = MaleCare , y = LitterSize, group = MaleCare, colour=MaleCare)) + 
    theme(axis.ticks.x = element_blank(),                                                 # removing X axis ticks
          axis.text.x = element_blank()) +                                                # removing X axis num's
    labs(title="Litter Size Dependent on Male Care in Order Primates", y = "Litter Size") # adding label/title
  PrimatesLSMC + my_theme                                                                 # adding in my theme

## Primates - Male Care vs. Litters Per Year
PrimatesLPYMC <- ggplot( data = Primates ) + 
  geom_boxplot( 
    mapping = aes( x = MaleCare , y = LittersPerYear, group = MaleCare, colour=MaleCare)) + 
  theme(axis.ticks.x = element_blank(),                                                   # removing X axis ticks
        axis.text.x = element_blank()) +                                                  # removing X axis num's
  labs(title="Litters per Year Dependent on Male Care in Order Primates", y = "Litters Per Year")       
                                                                                          # adding label/title
  PrimatesLPYMC + my_theme                                                                # adding in my theme    
  
## Primates - Male Care vs. Female Body Mass
PrimatesFBMMC <- ggplot( data = Primates ) + 
  geom_boxplot( 
    mapping = aes( x = MaleCare , y = FemaleBodyMass, group = MaleCare, colour=MaleCare)) + 
  theme(axis.ticks.x = element_blank(),                                                   # removing X axis ticks
        axis.text.x = element_blank()) +                                                  # removing X axis num's
  labs(title="Female Body Mass Dependent on Male Care in Order Primates", y = "Female Body Mass (g)")       
                                                                                          # adding label/title
  PrimatesFBMMC + my_theme                                                                # adding in my theme   

    

#### Rodentia Graphs #####    
## Rodentia - Male Care vs. Litter Size  
Rodentia$MaleCare <- as.factor(Rodentia$MaleCare)     # making Male care a factor, so that it shows properly  
  
RodentiaLSMC <- ggplot( data = Rodentia ) + 
    geom_boxplot( 
      mapping = aes( x = MaleCare , y = LitterSize, group = MaleCare, colour=MaleCare)) + 
    theme(axis.ticks.x = element_blank(),                                                 # removing X axis ticks
          axis.text.x = element_blank()) +                                                # removing X axis num's
    labs(title="Litter Size Dependent on Male Care in Order Rodentia", y = "Litter Size")       # adding label/title
  RodentiaLSMC + my_theme                                                                 # adding in my theme
  
## Rodentia - Male Care vs. Litters Per Year
RodentiaLPYMC <- ggplot( data = Rodentia ) + 
  geom_boxplot( 
    mapping = aes( x = MaleCare , y = LittersPerYear, group = MaleCare, colour=MaleCare)) + 
  theme(axis.ticks.x = element_blank(),                                                   # removing X axis ticks
        axis.text.x = element_blank()) +                                                  # removing X axis num's
  labs(title="Litters per Year Dependent on Male Care in Order Rodentia", y = "Litters Per Year")       
                                                                                          # adding label/title
  RodentiaLPYMC + my_theme                                                                # adding in my theme  
  
## Rodentia - Male Care vs. Female Body Mass
RodentiaFBMMC <- ggplot( data = Rodentia ) + 
  geom_boxplot( 
    mapping = aes( x = MaleCare , y = FemaleBodyMass, group = MaleCare, colour=MaleCare)) + 
  theme(axis.ticks.x = element_blank(),                                                   # removing X axis ticks
        axis.text.x = element_blank()) +                                                  # removing X axis num's
  labs(title="Female Body Mass Dependent on Male Care in Order Rodentia", y = "Female Body Mass (g)")       
                                                                                          # adding label/title
  RodentiaFBMMC + my_theme                                                                # adding in my theme  
  

#### Printing out averages - Do Not Need Anymore, Keeping to show work ####
#CarnivoraMaleDoesCare <- subset(Carnivora, MaleCare=="1")
#MeanCarnivoraDoes <- mean(CarnivoraMaleDoesCare[["LitterSize"]]) # 4.011500, so that I can compare against boxplot
#CarnivoraMaleDoesntCare <- subset(Carnivora, MaleCare=="0")
#MeanCarnivoraDoesnt <- mean(CarnivoraMaleDoesntCare[["LitterSize"]]) # 2.299507, so that I can compare against boxplot 

## I was orignially going to use this code to help me in my graphs, but found an easier way. Still helped me along in my thought process.