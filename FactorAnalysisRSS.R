file <- file.choose() # Choose file for analysis
df.1 <- read.csv(file) # Imports data
head(df.1)
nrow(df.1)

df.2 <- sapply(df.1, as.factor)
head(df.2)
nrow(df.2)

library(polycor)
het.mat <- hetcor(df.2)$correlation
het.mat

fa.1 <- factanal(covmat = het.mat, factors =6, rotation = "varimax")
fa.1

library(psych)
fa.2 <- fa(r = het.mat, nfactors = 6, n.obs = nrow(df.2), rotate = "oblimin", fm="minres")
print(fa.2)

fa.diagram(fa.2)
