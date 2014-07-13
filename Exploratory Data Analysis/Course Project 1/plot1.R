data <- read.csv("household_power_consumption.txt", skip=66636, nrows=2880, na.strings="?", col.names=c("Date","Time","Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep=";")
png("plot1.png")
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
