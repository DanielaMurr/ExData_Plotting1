## The data is first loaded and then extended by a column called Timestamp which recognizes Date and Time as a timestamp and again subsetted as in Plot 1.R 

library(dplyr)

data <- read.table("household_power_consumption.txt", sep = ";")
names(data) <- as.character(unlist(data[1,]))
data <- data[-c(1), ]

data <- mutate(data, Timestamp = as.POSIXct(paste0(data$Date, " ", data$Time), format = "%d/%m/%Y %H:%M:%S"))
dataToUse <- subset(data, Timestamp >= "2007-02-01 00:00:00" & Timestamp <= "2007-02-02 23:59:59")

## Plot 2 is then created with the type "l" for a line chart 

dataToUse$Global_active_power <- as.numeric(as.character(dataToUse$Global_active_power))
plot(dataToUse$Timestamp, dataToUse$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Plot 2 is saved to a PNG file with a width of 480 pixels and a height of 480 pixels

png("Plot2.png", width = 480, height = 480)
plot(dataToUse$Timestamp, dataToUse$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()