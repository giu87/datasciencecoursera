NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissionsPerYear <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png")

plot(emissionsPerYear$year, emissionsPerYear$Emissions, type="l", xlab="Year", ylab ="Total PM2.5 Emissions (tons)", main="Total US PM2.5 Emissions by Year")
dev.off()