power <- subset(read.csv("household_power_consumption.txt", sep = ";"), Date == "1/2/2007" | Date == "2/2/2007")

power <- transform(power,
                   Global_active_power = as.numeric(Global_active_power),
                   Global_reactive_power = as.numeric(Global_reactive_power),
                   Voltage = as.numeric(Voltage),
                   Sub_metering_1 = as.numeric(Sub_metering_1),
                   Sub_metering_2 = as.numeric(Sub_metering_2),
                   Sub_metering_3 = as.numeric(Sub_metering_3),
                   Datetime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

png("plot4.png")

par(mfrow = c(2,2))
par(mar = c(5,4,3,2))

plot(power$Datetime, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(power$Datetime, power$Voltage, xlab = "datetime", ylab = "Voltage", type = 'l')

plot(power$Datetime, power$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering")
lines(power$Datetime, power$Sub_metering_2, col = "red")
lines(power$Datetime, power$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"), bty="n")

plot(power$Datetime, power$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()
