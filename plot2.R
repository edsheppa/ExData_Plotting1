power <- subset(read.csv("household_power_consumption.txt", sep = ";"), Date == "1/2/2007" | Date == "2/2/2007")

power <- transform(power,
                   Global_active_power = as.numeric(Global_active_power),
                   Datetime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

png("plot2.png")

plot(power$Datetime, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
