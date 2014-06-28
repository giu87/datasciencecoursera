download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "getdata%2Fdata%2FGDP.csv")
data <- read.csv("getdata%2Fdata%2FGDP.csv", skip=4)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "getdata%2Fdata%2FEDSTATS_Country.csv")
edu_data <- read.csv("getdata%2Fdata%2FEDSTATS_Country.csv")

match <- merge(data, edu_data, all=T)

v <- (grep("Fiscal year end: June", match[,19]))
print(length(v))