## The data is first loaded and then extended by a column called Timestamp which recognizes Date and Time as a timestamp and again 
## subsetted as in Plot 1.R 

library(dplyr)

data <- read.table("household_power_consumption.txt", sep = ";")
names(data) <- as.character(unlist(data[1,]))
data <- data[-c(1), ]

data <- mutate(data, Timestamp = as.POSIXct(paste0(data$Date, " ", data$Time), format = "%d/%m/%Y %H:%M:%S"))
dataToUse <- subset(data, Timestamp >= "2007-02-01 00:00:00" & Timestamp <= "2007-02-02 23:59:59")

## The sub_metering columns are the converted from Factor into Numeric:

dataToUse$Sub_metering_3 <- as.numeric(as.character(dataToUse$Sub_metering_3))
dataToUse$Sub_metering_2 <- as.numeric(as.character(dataToUse$Sub_metering_2))
dataToUse$Sub_metering_1 <- as.numeric(as.character(dataToUse$Sub_metering_1))

## Plot 3 is then created 

plot(dataToUse$Timestamp, dataToUse$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dataToUse$Timestamp, dataToUse$Sub_metering_2, type = "l", col = "red")
lines(dataToUse$Timestamp, dataToUse$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

## Plot 3 is saved to a PNG file with a width of 480 pixels and a height of 480 pixels

png("Plot3.png", width = 480, height = 480)
plot(dataToUse$Timestamp, dataToUse$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dataToUse$Timestamp, dataToUse$Sub_metering_2, type = "l", col = "red")
lines(dataToUse$Timestamp, dataToUse$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
