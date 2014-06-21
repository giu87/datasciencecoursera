library(jpeg)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", "jeff.jpg", mode="wb")
jpg <- readJPEG("jeff.jpg", native = TRUE)
quantile(jpg, probs = c(.3,.8))