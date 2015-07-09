power <- subset(read.csv("household_power_consumption.txt", sep = ";"), Date == "1/2/2007" | Date == "2/2/2007")

power <- transform(power,
                   Global_active_power = as.numeric(Global_active_power),
                   Sub_metering_1 = as.numeric(Sub_metering_1),
                   Sub_metering_2 = as.numeric(Sub_metering_2),
                   Sub_metering_3 = as.numeric(Sub_metering_3),
                   Datetime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

png("plot3.png")

plot(power$Datetime, power$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering")
lines(power$Datetime, power$Sub_metering_2, col = "red")
lines(power$Datetime, power$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"))

dev.off()
