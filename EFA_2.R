## EFA
# https://www.youtube.com/watch?v=DUTuUZ5Q5fc

f <- file.choose() # Choose file for analysis
myDataOG <- read.csv(f) # Imports data
myData = myDataOG[,c(-1)]
View(myData) #Views Data

## data screen
nomissing = na.omit(myData)
#final = nomissing[,-ncol(nomissing)] #leaving a spot blank means to include all
final = nomissing

## EFA
## number of factors
## Parallel analysis

library(psych)
library(GPArotation) # did it load?

parallel = fa.parallel(final, fm="ml", fa="fa") # Looks for point of inflection
##scree is 2
##parallel is 5
##eigenvalues (kaiser)
parallel$fa.values
##over 1 = 2
##over .7 = 5

#simple structure
fivefactor = fa(final, nfactors = 6, rotate = "oblimin", fm = "ml")
fivefactor # gives loadings
CFI = 1-((fivefactor$STATISTIC - fivefactor$dof)/(fivefactor$null.chisq - fivefactor$null.dof))
CFI
#RMSR = 0.06
#RMSEA = 0.032 adequate adequate <.10
#TLI = 0.802 #not good want >.9
#CFI = 0.87 #not good want >.9

## Gets rid of loadings less than .3
fivefactor2 = fa(final[,-c(4,5,7,9,10,12,13,15,17,19,24,26,27,31)], nfactors = 5, rotate = "oblimin", fm = "ml")
fivefactor2
CFI2 = 1-((fivefactor2$STATISTIC - fivefactor2$dof)/(fivefactor2$null.chisq - fivefactor2$null.dof))
CFI2
## Simple enough
#RMSR = 0.04
#RMSEA = 0.037 adequate <.10
#TLI = 0.907 #good want >.9
#CFI = 0.96 #good want >.9

##reliability

alpha(final[, c(28,29)])
#.81 raw_alpha
alpha(final[, c(2,3)])
#.79 alpha
alpha(final[, c(14,16,25)])
#.41 alpha
alpha(final[, c(1,6,18,20,23,30)])
#.42 alpha
alpha(final[, c(8,11,21,22)])
.12 alpha

## name the factors
# factor 1: 
# factor 2: 
# factor 3: 
# factor 4: 
# factor 5: 






