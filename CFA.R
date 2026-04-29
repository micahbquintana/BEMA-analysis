##CFA

file <- file.choose() # Choose file for analysis
myData <- read.csv(file) # Imports data

final = myData[,-c(1)]
library("lavaan")
library("semPlot")

##example 1 - one latent variable
## enter the correlation matrix
wisc4.cor = lav_matrix_lower2full(c(1,
						0.72,1,
						0.64,0.63,1,
						0.51,0.48,0.37,1,
						0.37,0.38,0.38,0.38,1))

#enter the SDs
wisc4.sd = c(3.01,3.03,2.99,2.89,2.89)

# name the variables

colnames(wisc4.cor) = rownames(wisc4.cor) = 
	c("Information","Similarities","Word.Reasoning",
	"Matrix.Reasoning","Picture.Concepts")

names(wisc4.sd) = 
	c("Information","Similarities","Word.Reasoning",
	"Matrix.Reasoning","Picture.Concepts")

#convert correlations and SDs to covariances
wisc4.cov = cor2cov(wisc4.cor,wisc4.sd)

#Define the model
wisc4.model =
'g =~ a*Information + b*Similarities + c*Word.Reasoning + d*Matrix.Reasoning + e*Picture.Concepts'

# fit model
wisc4.fit = cfa(model = wisc4.model,
		   sample.cov = wisc4.cor,
		   sample.nobs = 550,
		   std.lv = FALSE)

# output
summary(wisc4.fit, standardized = TRUE, rsquare = TRUE, fit.measures = TRUE)
#std.all tells what items are loading correctly should be >.3