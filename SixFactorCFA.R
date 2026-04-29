file <- file.choose() # Choose file for analysis
data2 <- read.csv(file) # Imports data
#header <- data2[1,]
#header

#defines the model
m6f <- 'f1 =~ Question.4 + Question.5 + Question.7 + Question.24
        f2 =~ Question.3 + Question.6 + Question.8 + Question.16 + Question.17
        f3 =~ Question.23 + Question.26
	  f4 =~ Question.13 + Question.16 + Question.21 + Question.25 + Question.27
	  f5 =~ Question.19 + Question.20
	  f6 =~ Question.10 + Question.11 + Question.15 '

library(lavaan)

# runs a CFA using the cfa() function in lavaan
fit2 <- cfa(m6f, data=data2, std.lv=TRUE)

library(knitr)
options(knitr.kable.NA = '')

#RMSEA <0.05
#TLI (Tucker-Lewis index): Similar to CFI, but it penalizes overly complex models...
#(making it more conservative than CFI). Measures whether the model fits the data...
#better than a more restricted baseline model. Higher is better, with okay fit > .9
#CFI (Comparative fit index): Measures whether the model fits the data better than...
#a more restricted baseline model. Higher is better, with okay fit > .9

summary(fit2, fit.measures=TRUE, standardized=TRUE)

# Gives a plot of the fit
library(semPlot)

semPaths(fit2, nCharNodes = 0, style = "lisrel")
