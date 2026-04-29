# This is the intro into Factor Analysis

# This is the library that the functions for factor analysis comes from
library(psych)
library(psychTools)
library("Hmisc")
library(corrplot)

f <- file.choose() # Choose file for analysis
myData <- read.csv(f) # Imports data
data(myData) # Sets the file as data

describe(myData) # Gives some statistics on the data
pairs.panels(myData,pch='.') # Gives correlation numbers as well as a "heat" plot

myData.cor = cor(myData) # Gives the correlation data into a variable
cor.plot(myData) # Creates a correlation plot

myData.rcorr = rcorr(as.matrix(myData)) # Matrix of p-values of the correlation matrix
myData.rcorr # Displays the matrix

myData.coeff = myData.rcorr$r # Converts to a useable data structure
myData.p = myData.rcorr$P

corrplot(myData.cor) # is also a plot of the correlations between each problem

palette = colorRampPalette(c("green", "white", "red")) (20) # Creates a heat map
heatmap(x = myData.cor, col = palette, symm = TRUE)