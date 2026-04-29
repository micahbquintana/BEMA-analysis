
file <- file.choose() # Choose file for analysis
data <- read.csv(file) # Imports data

library(psych)

t0 <- tetrachoric(data,y=NULL,smooth=TRUE)$rho
t1 <- cor(data)

library(corrplot)

#par(mfrow=c(1,2))    # set the plotting area into a 1*2 array
corrplot(t0, type = "upper", method="color",diag = FALSE)
#corrplot(t1, type = "upper", method="color",diag = FALSE)

KMO1 = KMO(r = t0)
KMO1

# parallel analysis that produces the scree plot where the number of factors can be extracted
parallel <- fa.parallel(data, fm = 'ml', fa = 'fa')

library(polycor)

fa.1 <- fa(r = t0, nfactors = 5, n.obs = nrow(data), rotate = "none", scores = "Bartlett",  fm="ml")

print(fa.1$loadings, cutoff = 0.15)

print(fa.1)

fa.diagram(fa.1)