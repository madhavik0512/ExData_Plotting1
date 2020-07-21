elect <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
elect <- elect[elect$Date == "1/2/2007" | elect$Date == "2/2/2007", ]
d1 <- as.Date(elect$Date, "%d/%m/%Y")
p1 <- paste(d1, elect$Time)
elect$datetime <- strptime(p1, "%F %T")
elect <- elect[,-c(1,2)]
png("plot2.png")
plot(elect$datetime, elect$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()