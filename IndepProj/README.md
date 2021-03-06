# How Male Parental Care in Mammals is Correlated with Life History Traits Among Various Orders

## Biological question
When females have help from males in their respective orders, do they have more time to invest into harvesting resources, maintaining healthy weights, and having litters?

## Hypothesis 
If females receive help from males in caring for offspring, litter size, litters per year and female body mass will increase due to females having additional time to invest into harvesting resources, maintaining healthy weights and having litters.

## Context
-  Mammals care for their offspring in many different ways. In some mammalian species, only mothers care for the offspring. In other species, only males or males and females both contribute. Caring for offspring does come at a cost, as any sort of child is time and energy consuming. According to the authors of the original study, "whether a species has male care (1) or not (0) [is] defined as any of the following care behaviors; carrying, provisioning reproducing females, provisioning the offspring, grooming, [or] huddling" (Capellini and West). When male care does occur, what are the benefits to the mother and the offspring? This question is what drove the analysis done here. Similar to what the researchers of the original study suggested, when females have help from other members of their species, they may have more time to invest into harvesting resources, maintaining healthy weights and having litters. More so, when females receive help from males, litter size, litters per year and female body mass increase no matter the order.

## Methods
### Original Data
#### The source of the data used:
- Within the original data set, there are 21 orders of animals and 529 different species. I originally planned on working with only the order Primates but after further analysis, decided to include Rodentia and Carnivora, as they also had sufficient data available. Specifically, I wanted to know how the behavioral trait "whether males care for their offspring" is correlated with life history traits "litter size", "litters per year" and "female body mass" (West and Capellini 2016). 
- The data provided includes an excel document (101.68 kB) that is 21 columns wide and 530 rows long (a header and 529 species). Columns include Order, Species, eight behavioral traits, ten life history traits and a citation count. Behavioral and life history traits have abbreviations that are defined in a key so that headers are not too long, which is helpful for appearance. All species include an underscore in place of a space in between words, which was helpful for coding. There is a README file associated with the data which was useful in understanding what is being analyzed.
- The data from the original authors was collected via a meta-analysis. This means they drew from many sources that analyzed life history and behavioral traits in the species that were being observed. They include a column of information that indicates how many sources were pulled from to complete a row of information for one species.
#### What the original authors did with the data:
- With the original data, the authors used phylogenetic comparative methods to begin understanding how different male care behaviors affect life history traits such as lactation periods, weaning mass, female fecundity, and more. To begin, West and Capellini defined the variables that they planned to use in their analysis (i.e. behavioral traits and life history traits). After this, they identified species that had enough data available to work with and used a meta-analysis to analyze the species based on the defined traits.
- After definitions were put in place and applied to all of the species, the authors used Phylogenetic Generalized Least Squares (PGLS), which analyzes continuous and comparative data. They also used the 'caper' package in R to conduct their phylogenetic analysis.

#### Original Data Links: 
###### West H, Capellini I (2016) Male care and life history traits in mammals. Dryad Digital Repository.
[(source)](https://datadryad.org/stash/dataset/doi:10.5061/dryad.j909k)

###### West H, Capellini I (2016) Male care and life history traits in mammals. Nat Commun 7, 11854.
[(original)](https://www.nature.com/articles/ncomms11854)


### My Methods
- In my analysis, I began by cleaning up any inconsistencies I saw in the data and removing any information that was not relevant to the question I was asking.
- I removed all "NA's" and replaced them with "0's", as NA's could give me error messages down the line.
- For the purpose of this analysis, it can be assumed that unavailable data is equivalent to zero. 
- I renamed column headers so that the data sheet was more straight-forward as I was looking at it.
- I then used code to sift through the data and determine which orders to keep, and which to discard. If the order did not contain at least two "1s" (at least two species with male care) for "Male Care" and/or six species, it was discarded. That narrowed down the orders to only Primates, Carnivora, and Rodentia.
- Once I had these orders determined, I subset them into their own data frames.
- From here, I used ggplot2 to make boxplots. I compared Male Care vs. Litter Size, Litters per Year, and Female Body Mass for each order (resulting in 9 graphs).


## Results
Litters per year increased with male care for all of the orders that were analyzed. This is consistent with the original hypothesis.  It seems likely that the extra help that the mothers receive increases their ability to invest in having more offspring. Though there is a large range of litters per year among the orders, this is due to the orders having a wide variety of different species.
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/LyPCarnivora.jpeg)
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/LpYPrimates.jpeg)
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/LpYRodentia.jpeg)


Litter size in both Carnivora and Primates shows a significant increase when male care is present. In Rodentia, however, litter size seems to be independent of male presence. It could be presumed that litter size is affected by male care, however, it may be influenced by other variables as well.
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/LSCarnivora.jpeg)
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/LSPrimates.jpeg)
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/LSRodentia.jpeg)



The claim in my hypothesis that female body mass (g) would increase when male care was present cannot be accepted. In both Carnivora and Primates, female body mass (g) was larger when male care was not present. For Rodentia, female body mass was similar when male care was or was not present. Though I was not correct in my hypothesis, this still tells us much about the nature of these orders. I would suggest that female body mass is simply reliant on other external variables. 
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/FBMCarnivora.jpeg)
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/FBMPrimates.jpeg)
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/FBMRodentia.jpeg)

## Conclusion
The results found supported pieces of the hypothesis, but not in full. With this being said, there are many variables that could explain the contradictions within the posed hypothesis. It is possible that any results that were collected were not totally accurate due to varying sample size between orders (Carnivora, n=91; Primates, n=111; Rodentia, n=136). In addition to varying sample sizes, the occurrences of males caring were far less than the occurrences of males not carrying in all orders. 
The authors of the original study make mention of the Load-Lightening hypothesis that is posed by Humphrey Crick. According to the hypothesis, when parental care increases in individuals other than the mother, the mother then has more time to invest into in “increasing [her] reproductive output” (West and Capellini 2016; Crick 1992). This hypothesis supports the results that I found which shows that both Litter Size and Litters per Year have a positive correlation with male care. 

One thing that could be approved upon is that each boxplot for female body size seemed to have at least one outlier that was much larger than the average. This skewed the y-axis on each boxplot and made the data seem less significant than it truly was. In the future, I could analyze species individually or broaden my analysis to include orders from outside data sets. I would be interested in how the results would vary when it became more or less specific, for example, orders analyzed together as a class or species analyzed individually. 

## References Cited
Crick, Humphrey (1992) Load‐lightening in cooperatively breeding birds and the cost of reproduction. Wiley Online Library. 
[(link to publication)](https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1474-919X.1992.tb07230.x)

West H, Capellini I (2016) Male care and life history traits in mammals. Dryad Digital Repository.
[(source)](https://datadryad.org/stash/dataset/doi:10.5061/dryad.j909k)

West H, Capellini I (2016) Male care and life history traits in mammals. Nat Commun 7, 11854.
[(original)](https://www.nature.com/articles/ncomms11854)