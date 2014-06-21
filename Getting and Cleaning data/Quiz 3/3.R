download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "gdp.csv", method = "curl")
gdp <- read.csv("gdp.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "edu.csv", method = "curl")
edu <- read.csv("edu.csv")

gdpclean<-gdp[5:194,]
mergedData=as.data.frame(merge(gdpclean,edu,by.x="X",by.y="CountryCode"))
mergedData$Gross.domestic.product.2012 = as.numeric(as.character(mergedData$Gross.domestic.product.2012))
