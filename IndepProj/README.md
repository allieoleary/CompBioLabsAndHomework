# How Male Parental Care in Primates is Correlated with Life History Traits in Species
## Biological question
When females have help from males in their species, do they have more time to invest into harvesting resources, maintaining healthy weights, and having litters?

## Context
-  Mammals care for their offspring in many different ways. In some mammalian species, only mothers care for the offspring. In other species, only males or males and females both contribute. Caring for offspring does come at a cost as any sort of child is time and energy consuming. According to the authors of the orginial study, "whether a species has male care (1) or not (0), defined as any of the following care behaviours; carrying, provisioning reproducing females, provisioning the offspring, grooming, huddling" (Capellini and West). When male care does occur, what are the benefits to the mother and the offspring? This question is what drove the work that I have done. Similar to what the researchers of the original study suggested, when females have help from other members of their species, they may have more time to invest into harvesting resources, maintaining healthy weights and having litters. I also suggested that when females receive help from males, that litter size, litters per year and female body mass increase no matter the order.

## Methods
### Original Data
#### The source of the data I used:
- Within the original data set that I was working with, there were 21 orders of animals and 529 different species. I originally planned on working with only primates but after further analysis, decided to include rodents and carnivores as well, as they also had sufficient data available. Specifically, I wanted to know how the behavioral trait "whether males care for their offspring" is correlated to life history traits "litter size", "litters per year" and "female body mass" (West and Capellini 2016). 
- The data provided includes an excel document (101.68 kB) that is 21 columns wide and 530 rows long (a header and 529 species). Columns include Order, Species, eight behavioral traits, ten life history traits and a citation count. Behavioral and life history traits have abbreviations that are defined in the key so that headers are not too long, which is helpful for appearance. All species include an underscore inbetween words in place of a space, which was helpful for coding. There is a README file associated with the data which was helpful in understanding what I was working with.
- The data that the original authors was collected via a meta-analysis. This means they drew from many sources that analysed life history and behavioral traits in the species that were being observed. They include a column of information that indicates how many sources were pulled from to complete a row of information for one species.
#### What the original authors did with the data:
- With the original data, the authors used phylogenetic comparative methods to begin understanding how different male care behaviors affect life history traits such as lactation periods, weaning mass, female fecundity and more. To begin, West and Capellini defined the variables that they planned to use in thier analysis (i.e. behavioral traits and life history traits). After this, they identified species that had enough data available to work with and used a meta-analysis to analyse the species based on the defined traits.
- After definitions were put in place and applied to all of the species the authors used Phylogenetic Generalized Least Squares (PGLS), which anaylyses continuous and comparative data. They also used the 'caper' package in R to conduct thier phylogenetic analsysis.

#### Original Data Links: 
###### West H, Capellini I (2016) Male care and life history traits in mammals. Dryad Digital Repository.
[(source)](https://datadryad.org/stash/dataset/doi:10.5061/dryad.j909k)

###### West H, Capellini I (2016) Male care and life history traits in mammals. Nat Commun 7, 11854.
[(original)](https://www.nature.com/articles/ncomms11854)


### My Methods
- In my analysis, I began by cleaning up any inconsistencies I saw in the data, and removing any information that was not relevant to the question I was asking.
- I removed all "NA's" and replaced them with "0's" as NA's would give me error messages down the line.
- I renamed column headers so that the data sheet was more straight-forward as I was looking at it.
- I then used code to sift through the data and determine which orders to keep, and which to discard. If the order did not contain at least two "1s" for "Male Care" and/or six species were discarded. That narrowed down the orders to only primates, carnivores, and rodents.
- Once I had these species determined, I subset them into thier own data frames.
- From here, I used ggplot2 to make boxplots. I compared Male Care vs. Litter Size, Litters per Year, and Female Body Mass for each order (resulting in 9 graphs)


## My Results and Conclusion
In my hypothesis, litters per year increasing with male care seems to hold true for all of the orders that were analyzed. I beleive that the extra help that the mothers receive increases their ability to invest in having more offspring. Though there is a wide variation, this is due to orders holding a wide variety of species.
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/LyPCarnivora.jpeg)
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/LpYPrimates.jpeg)
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/LpYRodentia.jpeg)


Litter size in both Carnivora and Primates shows a significant increase when male care is present. In Rodentia, however, litter size is very similar when male care is and is not present. It could be presumed that litter size is affected by male care, however, it may be influenced by other variables as well.
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/LSCarnivora.jpeg)
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/LSPrimates.jpeg)
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/LSRodentia.jpeg)



The claim in my hypothesis that female body mass (g) would increase when male care was present cannot be accepted. In both Carnivores and Primates, female body mass (g) was larger when male care was not present. For Rodents, female body mass was similar when male care was or was not present. Though I was not correct in my hypothesis, this still tells us much about the nature of these orders. I would suggest that female body mass is simply reliant on other external variables. 
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/FBMCarnivora.jpeg)
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/FBMPrimates.jpeg)
>![](https://github.com/allieoleary/CompBioLabsAndHomework/blob/master/IndepProj/Images/FBMRodentia.jpeg)



## References Cited
West H, Capellini I (2016) Male care and life history traits in mammals. Dryad Digital Repository.
[(source)](https://datadryad.org/stash/dataset/doi:10.5061/dryad.j909k)

West H, Capellini I (2016) Male care and life history traits in mammals. Nat Commun 7, 11854.
[(original)](https://www.nature.com/articles/ncomms11854)

