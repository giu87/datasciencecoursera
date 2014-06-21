ch <- download.file(fileUrl, "getdata-data-ss06pid.csv")
data <- read.csv("getdata-data-ss06pid.csv")

agricultureLogical <- data$ACR == 3 & data$AGS == 6

which(agricultureLogical)