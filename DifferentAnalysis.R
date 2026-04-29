# Pricipal Components Analysis
# entering raw data and extracting PCs
# from the correlation matrix

library(psych)
library(sem)

mydata <- read.csv(file.choose(),header=TRUE)


# Principal Factor Analysis

fit <- princomp(mydata, cor=TRUE)
summary(fit) # print variance accounted for
loadings(fit) # pc loadings
plot(fit,type="lines") # scree plot
fit$scores # the principal components
#biplot(fit) #this is very ugly

# Varimax Rotated Principal Components
# retaining 12 components
fit <- principal(mydata, nfactors=12, rotate="varimax")
fit # print results


# Exploratory Factor Analysis

# Maximum Likelihood Factor Analysis
# entering raw data and extracting 3 factors,
# with varimax rotation
fit <- factanal(mydata, 12, rotation="varimax")
print(fit, digits=11, cutoff=.3, sort=TRUE)
# plot factor 1 by factor 2
load <- fit$loadings[,1:11]
plot(load,type="n") # set up plot
text(load,labels=names(mydata),cex=.7) # add variable names

mydata.cov <- cov(mydata)
model.mydata <- specify.model()
