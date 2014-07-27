require(ggplot2)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

merged <- merge(NEI, SCC.coal, by="SCC")

gg <- aggregate(Emissions ~ year, merged, sum)

png("plot4.png")

p <- qplot(year, Emissions, data = gg, geom="line") + xlab("Year") + ylab("Total PM2.5 Emissions (tons)") + ggtitle("Total PM2.5 Emissions from Coal comustion-realated by Year")
print(p + geom_point())

dev.off()