# Exploratory Factor Analysis (EFA)

# This is the library that the functions for factor analysis comes from
#
library(psych)
library(psychTools)
library("Hmisc")
library(corrplot)

# Reads in the data from csv file
#
data <- read.csv(file.choose(),header=TRUE)

# Reads in the header
#
head(data)

# Runs a parallel analysis with minimum resolution and creates a scree plot
# Will output the number of factors that are present
#
parallel <- fa.parallel(data, fm = 'minres', fa = 'fa') 

# Starts the analysis
# nfactors is the number of factors from the parallel analysis above.
#  If there is double loading need to add 1 to nfactor
# using oblique rotation ("oblimin") because we think there is a correlation
#  between the factors
# fm is the factor tequniques we are using Ordinary Least Squared/Minres 
#  produces results similar to Maximum Liklihood
# 
numFactor <- fa(data, nfactors = 6, rotate = "oblimin", fm="minres")

# Displays the loading that are on each question along with some other statistics
#
print(numFactor)

# Prints only the important loading that are more than 0.3 negatives are also
#  acceptable
#
# RMSR (root means square of residuals) being close to zero is very good .05 is acceptable
# RMSEA (Root Mean Square Error of Approximation) should be close to zero
# The TLI over 0.9 is acceptable 1 is more ideal
#
#print(numFactor$loadings, cutoff = 0.25)

# Display the simple structure of there being no doule loading
#
fa.diagram(numFactor)