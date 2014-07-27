library(ggplot2)
require(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissionsBaltimoreMothorVehicles <- aggregate(Emissions ~ year + fips, NEI[NEI$type=="ON-ROAD" & (NEI$fips == "24510" | NEI$fips == "06037"),], sum)

png("plot6.png")

p <- qplot(year, Emissions, data = emissionsBaltimoreMothorVehicles, color=fips, geom="line") + xlab("Year") + ylab("Total PM2.5 Emissions (tons)") + ggtitle("Baltimore City vs LA PM2.5 Mothor-Vehicles Emissions by Year")
print(p + geom_point())

dev.off()