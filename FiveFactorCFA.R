file <- file.choose() # Choose file for analysis
data <- read.csv(file) # Imports data
#header <- data[1,]
#header

#defines the model
m5f <- 'f1 =~ Question.6 + Question.12 + Question.20 + Question.23 + Question.25 + Question.26
        f2 =~ Question.13 + Question.21 + Question.22 + Question.24
        f3 =~ Question.15 + Question.16
	  f4 =~ Question.1 + Question.2 + Question.3
	  f5 =~ Question.4 + Question.5 + Question.6' 

library(lavaan)

# runs a CFA using the cfa() function in lavaan
fit <- cfa(m5f, data=data, std.lv=FALSE)
#fit <- cfa(m5f, data=data, ordered = TRUE, std.lv=FALSE)

mi <- modindices(fit)
mi <- mi[order(mi["mi"], decreasing = TRUE),]
modIndex <- mi[mi$op == "=~",]
#modIndex
modIndex


library(knitr)
options(knitr.kable.NA = '')

#RMSEA <0.05
#TLI (Tucker-Lewis index): Similar to CFI, but it penalizes overly complex models...
#(making it more conservative than CFI). Measures whether the model fits the data...
#better than a more restricted baseline model. Higher is better, with okay fit > .9
#CFI (Comparative fit index): Measures whether the model fits the data better than...
#a more restricted baseline model. Higher is better, with okay fit > .9

summary(fit, fit.measures=TRUE, standardized=TRUE)

# Gives a plot of the fit
#library(semPlot)

#semPaths(fit, nCharNodes = 0, style = "lisrel", rotation = 2)