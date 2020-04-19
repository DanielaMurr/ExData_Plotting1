## The data is first loaded and then extended by a column called Timestamp which recognizes Date and Time as a timestamp and again 
## subsetted as in Plot 1.R 

library(dplyr)

data <- read.table("household_power_consumption.txt", sep = ";")
names(data) <- as.character(unlist(data[1,]))
data <- data[-c(1), ]

data <- mutate(data, Timestamp = as.POSIXct(paste0(data$Date, " ", data$Time), format = "%d/%m/%Y %H:%M:%S"))
dataToUse <- subset(data, Timestamp >= "2007-02-01 00:00:00" & Timestamp <= "2007-02-02 23:59:59")


## The four separate plots for Plot 4 are then created 

par(mfrow=c(2,2), mar=c(4, 4, 1, 2))
## Plot on the top left 
plot(dataToUse$Timestamp, dataToUse$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex.lab=0.75)
## Plot on the top right 
dataToUse$Global_active_power <- as.numeric(as.character(dataToUse$Global_active_power))
plot(dataToUse$Timestamp, dataToUse$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.lab=0.75)
## Plot on the bottom left 
dataToUse$Sub_metering_3 <- as.numeric(as.character(dataToUse$Sub_metering_3))
dataToUse$Sub_metering_2 <- as.numeric(as.character(dataToUse$Sub_metering_2))
dataToUse$Sub_metering_1 <- as.numeric(as.character(dataToUse$Sub_metering_1))
plot(dataToUse$Timestamp, dataToUse$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", cex.lab=0.75)
lines(dataToUse$Timestamp, dataToUse$Sub_metering_2, type = "l", col = "red")
lines(dataToUse$Timestamp, dataToUse$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
## Plot on the bottom right 
dataToUse$Global_reactive_power <- as.numeric(as.character(dataToUse$Global_reactive_power))
plot(dataToUse$Timestamp, dataToUse$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex.lab=0.75)

## Plot 4 is saved in a PNG file 
png("Plot4.png", width = 480, height = 480)

par(mfrow=c(2,2), mar=c(4, 4, 1, 2))
plot(dataToUse$Timestamp, dataToUse$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex.lab=0.75)

dataToUse$Global_active_power <- as.numeric(as.character(dataToUse$Global_active_power))
plot(dataToUse$Timestamp, dataToUse$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.lab=0.75)

dataToUse$Sub_metering_3 <- as.numeric(as.character(dataToUse$Sub_metering_3))
dataToUse$Sub_metering_2 <- as.numeric(as.character(dataToUse$Sub_metering_2))
dataToUse$Sub_metering_1 <- as.numeric(as.character(dataToUse$Sub_metering_1))
plot(dataToUse$Timestamp, dataToUse$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", cex.lab=0.75)
lines(dataToUse$Timestamp, dataToUse$Sub_metering_2, type = "l", col = "red")
lines(dataToUse$Timestamp, dataToUse$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dataToUse$Global_reactive_power <- as.numeric(as.character(dataToUse$Global_reactive_power))
plot(dataToUse$Timestamp, dataToUse$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex.lab=0.75)

dev.off()


