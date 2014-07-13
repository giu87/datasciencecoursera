data <- read.csv("household_power_consumption.txt", skip=66636, nrows=2880, na.strings="?", col.names=c("Date","Time","Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep=";")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

png("plot2.png")
plot(data$Datetime,data$Global_active_power, type="l", main="", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
