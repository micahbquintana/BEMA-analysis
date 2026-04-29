
file <- file.choose() # Choose file for analysis
data <- read.csv(file) # Imports data
#data <- d[,c(-1)]

library(psych)

t0 <- tetrachoric(data,y=NULL,smooth=TRUE)$rho
t1 <- cor(data)

#t0
#t1

library(corrplot)

#par(mfrow=c(1,2))    # set the plotting area into a 1*2 array
#corrplot(t0, type = "upper", method="color",diag = FALSE)
#corrplot(t1, type = "upper", method="color",diag = FALSE)

KMO1 = KMO(r = t0)
KMO1

# parallel analysis that produces the scree plot
parallel <- fa.parallel(data, fm = 'ml', fa = 'fa')

library(polycor)

fa.1 <- fa(r = t0, nfactors = 5, n.obs = nrow(data), rotate = "none", scores = "Bartlett",  fm="ml")
#fa.2 <- fa(r = d, nfactors = 5, n.obs = nrow(d), rotate = "none", scores = "Bartlett",  fm="ml", cor = "tet")

print(fa.1$loadings, cutoff = 0.15)
#print(fa.2$loadings, cutoff = 0.20) # The same thing
#print(fa.1$communality)

print(fa.1)

fa.diagram(fa.1)