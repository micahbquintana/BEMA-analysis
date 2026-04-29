f <- file.choose() # Choose file for analysis
myData <- read.csv(f) # Imports data

## Runs Principle Component Analysis on the data
#pc <- princomp(myData, cor=TRUE,score=TRUE)
pc <- princomp(myData)

summary(pc)

## Different ways of looking at the data graphically
plot(pc)
#plot(pc , type="lines")
#biplot(pc)

## gets the attributes associated with the variable
attributes(pc) 
pc$loadings #Looks at the loadings of the data
#pc$scores
