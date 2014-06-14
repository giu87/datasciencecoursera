data <- read.fwf("./getdata-wksst8110.for", c(-1, 9,-5, 4, -1, 3, -5, 4, -1, 3,  -5, 4, -1, 3, -5, 4, -1, 3), skip = 4, header = F)
sum(data[4])
