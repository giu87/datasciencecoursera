NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissionsPerYearBaltimore <- aggregate(Emissions ~ year, NEI[NEI$fips=="24510",], sum)

png("plot2.png")

plot(emissionsPerYearBaltimore$year, emissionsPerYearBaltimore$Emissions, type="l", xlab="Year", ylab ="Total PM2.5 Emissions (tons)", main="Baltimore City PM2.5 Emissions by Year")
dev.off()