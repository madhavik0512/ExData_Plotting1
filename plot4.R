elect <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
elect <- elect[elect$Date == "1/2/2007" | elect$Date == "2/2/2007", ]
d1 <- as.Date(elect$Date, "%d/%m/%Y")
p1 <- paste(d1, elect$Time)
elect$datetime <- strptime(p1, "%F %T")
elect <- elect[,-c(1,2)]
png("plot4.png")
par(mfcol = c(2,2))
plot(elect$datetime, elect$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

plot(elect$datetime, elect$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "grey", lwd = 2)
points(elect$datetime, elect$Sub_metering_2, type = "l", col = "red")
points(elect$datetime, elect$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("grey", "red","blue"), lwd = 1, cex = 0.75)

plot(elect$datetime, elect$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(elect$datetime, elect$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
