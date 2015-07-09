power <- subset(read.csv("household_power_consumption.txt", sep = ";"), Date == "1/2/2007" | Date == "2/2/2007")

power <- transform(power, Global_active_power = as.numeric(Global_active_power))

png("plot1.png")

hist(power$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
