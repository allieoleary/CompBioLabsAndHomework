#lab step #3: This is variable for the number of bags of chips I start with
bagsofchipsstart <- 5 
#lab step # 3: This is the variable for the number of guests I have coming
#lab step # 4: adding #
guestscoming <- 8
#lab step # 5: This is the varaible for the number of bags I expect each guest to each
amountoneguesteat <- 0.4
#lab step # 6: adding comment to #5
#lab step # 7: calculating the amount of left over chips, including what I eat 
leftoverchips <- bagsofchipsstart - ((guestscoming + 1) * amountoneguesteat)
#lab step # 8: making four vectors, one for each person, with their rankings of movies, in order from episode I to IX, respectively 
selfranking <- c(7, 9, 8, 1, 2, 3, 4, 6, 5)
pennyranking <- c(5, 9, 8, 3, 1, 2, 4, 7, 6)
lennyranking <- c(6, 5, 4, 9, 8, 7, 3, 2, 1)
stewieranking <- c(1, 9, 5, 6, 8, 7, 2, 3, 4)
# practice, accessing 8th element in selfranking
selfranking[8]
#lab step # 9: indexing penny's ranking of episode IV
PennyIV <- pennyranking[4]
#lab step # 9: indexing Lenny's ranking of epidose IV
LennyIV <- lennyranking[4]
#lab step #10: concatenate all 4 sets of rankings into data object
allrankings <- cbind(selfranking, lennyranking, pennyranking, stewieranking)
#lab step # 11: interpreting structure
str(PennyIV) #the one number, num, in the variable stored as PennyIV is 3. So, the the fifth episode is ranked 3rd for Penny.
str(pennyranking) #there are 9 numbers in this stored vector and output right of the number of variables in the vector
str(allrankings) #the first line tells us that our data contains a vector of 9 and a vector of 4. list of two tells you that the vector has two parts, which follow. the first part is void and the second part tells us which vectors are included 
#lab step # 12: 
allrankingsdataframe1 <- data.frame(selfranking, lennyranking, pennyranking, stewieranking) #making data frrame with 4 vectors
View(allrankingsdataframe1) #viewing data frame
allrankingsdataframe2 <- as.data.frame(allrankings) 
dim(allrankings)
dim(allrankingsdataframe1)
str(allrankings)
str(allrankingsdataframe1)
typeof(allrankings)
typeof(allrankingsdataframe1) #lab step #13: cbind made a matrix which contains only one type of data. data.frame turned our matrix into a table which has more than one type of data.
#lab step # 14: 
episodesinorder <- c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX") #a vector with the episode numbers in order 
#lab step # 15:
row.names(allrankingsdataframe1) <- episodesinorder #adding the episode titles to the rows in allrankingsdataframe1
#lab step # 16:
View(allrankings) #using this data set for question 16
allrankings[3,] #eval row three from allrankings
#lab step # 17:
allrankingsdataframe1[,4] #eval fourth column from allrankingsdataframe1
#lab step # 18:
allrankingsdataframe1[5,1] #my ranking for episode V
#lab step # 19:
allrankingsdataframe1[2,3] #pennys ranking for episode II
#lab step # 20:
allrankingsdataframe1[4:6,] #the rankings for everyone from episode IV to VI
#lab step # 21:
allrankingsdataframe1[c(2,5,7),] #the rankings for everyone for episodes II, V, VII
#lab step # 22:
allrankingsdataframe1[c(4, 6), c(3, 4)] #penny and stewie episode IV and VI rankings
#lab step # 23:
allrankingsdataframe1[c(2, 5), 2] <- allrankingsdataframe1[c(5, 2), 2] #swapping Lennys episode II and V rankings
#lab step # 24:
allrankingsdataframe1["I", "lennyranking"] #using quotes for writing to access specific ratings
allrankings[1, "lennyranking"] #using quotes for writing to access specific ratings
#lab step # 25:
allrankingsdataframe1[c("II", "V"), "lennyranking"] <- allrankingsdataframe1[c("V", "II"), "lennyranking"] #undoing lab step 23 with words
#lab step # 26:
allrankingsdataframe1$lennyranking[c(2,5)] <- allrankingsdataframe1$lennyranking[c(5,2)] #redoing lab step 23 with $