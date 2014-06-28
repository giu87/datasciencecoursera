download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "getdata%2Fdata%2FGDP.csv")
data <- read.csv("getdata%2Fdata%2FGDP.csv", skip=4)

countryNames <- as.character(data[,4])
print(grep("^United",countryNames))