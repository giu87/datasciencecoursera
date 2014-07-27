library(ggplot2)
require(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissionsPerYearAndTypeBaltimore <- aggregate(Emissions ~ year + type, NEI[NEI$fips=="24510",], sum)

png("plot3.png")

p <- qplot(year, Emissions, data = emissionsPerYearAndTypeBaltimore, color = type, geom="line") + xlab("Year") + ylab("Total PM2.5 Emissions (tons)") + ggtitle("Baltimore City PM2.5 Emissions by Year and Type")
print(p + geom_point())

dev.off()