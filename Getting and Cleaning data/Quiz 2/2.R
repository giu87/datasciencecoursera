library(sqldf)

acs <- read.csv("getdata-data-ss06pid.csv")
a1s <- sqldf("select pwgtp1 from acs where AGEP < 50")