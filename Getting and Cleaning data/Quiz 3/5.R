library(Hmisc)
mergedData$gdp_g <- cut2(mergedData$Gross.domestic.product.2012,g=5)
table(mergedData$Income.Group,mergedData$gdp)