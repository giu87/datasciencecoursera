
temp <- mergedData[mergedData$Income.Group=="High income: OECD",]
mean(temp$Gross.domestic.product.2012)

temp <- mergedData[mergedData$Income.Group=="High income: nonOECD",]
mean(temp$Gross.domestic.product.2012)