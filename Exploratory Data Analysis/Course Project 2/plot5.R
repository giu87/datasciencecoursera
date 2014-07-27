NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissionsBaltimoreMothorVehicles <- aggregate(Emissions ~ year, NEI[NEI$type=="ON-ROAD" & NEI$fips == "24510",], sum)

png("plot5.png")

plot(emissionsBaltimoreMothorVehicles$year, emissionsBaltimoreMothorVehicles$Emissions, type="l", xlab="Year", ylab ="Total PM2.5 Emissions (tons)", main="Baltimore City PM2.5 Mothor-Vehicles Emissions  by Year")
dev.off()