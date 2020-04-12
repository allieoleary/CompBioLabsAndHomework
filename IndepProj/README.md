# How Male Parental Care in Mammals is Correlated with Life History Traits in Species

## Introduction
- Within the data set, there are 111 species that are primates. I will be analyzing all primates. Specifically, I want to know how the behavioral trait "whether males provision the offspring" is correlated to life history traits "litter size", "litters per year" and "female body mass" (West and Capellini 2016). Similar to what the researchers of the original study suggested, when females have help from other members of their species, they may have more time to invest into harvesting resources, maintaining healthy weights and having litters. I would also suggest that when females receive help (specifically from males), that litter size, litters per year and female body mass increase.

## Summary of Data to be Analyzed
### Original Study:
- The original study conducted by Hannah E. R. West and Isabella Capellini wanted to understand why males would invest in offspring, and what the benefits of doing so are. They pose a few reasons like: "when future mating opportunities are scarce, males might do better to care for their current offspring" (West and Capellini 2016). West and Capellini hypothesize "that increased female fecundity and offspring fitness related traits are associated with male care using phylogenetic comparative methods"(West and Capellini 2016). Again, the hypothesis is analyzing life history traits but the authors are also curious about why males would invest in thier offspring, if there are costs to doing so or when it would be beneficial.

### Methods:
- Given previously available data, the researchers assembled a data set comprised of 529 mammals that had information for two or more of the life history traits they were looking at. Because there was some variation between datasets they were working with, they created a code for male behaviors "with 1 indicating the presence and 0 the absence of the trait" and normalized the distribution. Life history data was collected (for the same species as was collected above) with information about things like "female adult mass" and "litter size" (West and Capellini 2016). The researchers made specific definitions for male care behaviors, as to apply to all of the species. They address any confounding variables and create strategies to minimize distractions from what they are trying to discover.

### Type of data provided:
- The data provided includes an excel document (101.68 kB) that is 21 columns wide and 530 rows long (a header and 529 species). Columns include Order, Species, eight behavioral traits, ten life history traits and a citation count. Behavioral and life history traits have abbreviations that are defined in the key so that headers are not too long, which is helpful for appearance but might get confusing if I am trying to remember which one is which (in which case, I will refer to the key). All species include an underscore in place of a space, which will be helpful when coding. There is a README file associated with the data which is helpful in understanding what I am working with.
- I can only detect a few "problems" with the data. First, there are many species in which not all behavioral and life history traits are filled out (in which case, an NA is present). Second, the size of the data worries me as there are 529 species to analyze (which is part of the reason why I am narrowing down my obserservations to only primates). Also, from what I can see, there are far more "zero's" present than "one's" in regard to male behavioral traits which may make results unsubstantial in regards to differences between males who care for their offsping vs. those who don't if I choose species/traits that don't have much variation between one another.

## Detailed Description of Analysis to be Done and Challenges Involved
- To start, I will need to remove all species from my data set that are not primates. Before this, I will need to parse out the data dependent on what order the species fall into, so I can then delete them.
- I will then remove all columns other than "Species", "whether males provision the offspring", "litter size", "litters per year" and "female body mass" (West and Capellini 2016). Here, I should end up with a data set that is 5 columns wide and 112 rows long (with 111 species of primates).
- As a whole, I will analyze the correlation between "whether males provision the offspring" and "litter size", "whether males provision the offspring" and "litters per year" and "whether males provision the offspring" and "female body mass". 
- For each of these analyses, I will remove species that do not have information (or have an NA present where I need information to analyze). Here, the data set may shrink depending on what life history trait I am analyzing.
- I will create graphs (most likely, scatter plots) with male provision on the x-axis (independent variable) and the corresponding life history trait on the y-axis.



### References

West H, Capellini I (2016) Male care and life history traits in mammals. Dryad Digital Repository.
[(source)](https://datadryad.org/stash/dataset/doi:10.5061/dryad.j909k)

West H, Capellini I (2016) Male care and life history traits in mammals. Nat Commun 7, 11854.
[(original)](https://www.nature.com/articles/ncomms11854)




