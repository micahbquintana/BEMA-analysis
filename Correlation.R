#https://www.rdocumentation.org/packages/corrplot/versions/0.84/topics/corrplot

f <- file.choose() # Choose file for analysis
d <- read.csv(f) # Imports data
#d <- e[,c(-1)]
d
#d <-iris
#head(d)
#plot(d)

#d<-iris[,c(-5)]
#plot(d)

## Different correlation methods
cor(d)
#cor(d,method="kendall")
#cor(d,method="spearman")
#cor.test(d$Sepal.Length, d$Sepal.Width) # corr test bewteen two variables

#d<-mtcars #larger data set
cr <- cor(d)
cr 

library(corrplot)
#corrplot(cr)

## differnet plots
#corrplot(cr, method="pie")
corrplot(cr, type = "upper", method="color",diag = FALSE)
#corrplot(cr, method="number")
#corrplot(cr, method="lower")
#corrplot(cr, method="upper")



