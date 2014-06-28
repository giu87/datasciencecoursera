library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

v_2012 <- grep("2012", sampleTimes)
print(length(v_2012))

dates_2012 <- sampleTimes[v_2012]
print(table(weekdays(dates_2012) == "lunedì"))