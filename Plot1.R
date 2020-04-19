## Data is downloaded and loaded into R, then the Data and Time variables are converted into Date/Time classes 

library(dplyr)

data <- read.table("household_power_consumption.txt", sep = ";")
names(data) <- as.character(unlist(data[1,]))
data <- data[-c(1), ]

data <- mutate(data, Date = as.Date(Date, format = "%d/%m/%Y"))
data <- mutate(data, Time = format(strptime(data$Time, format = "%H:%M:%S"), "%H:%M:%S"))

## Data is then subseted and data is only used form the dates 2007-02-01 and 2007-02-02
dataToUse <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

## The first plot is then constructed 
dataToUse$Global_active_power <- as.numeric(as.character(dataToUse$Global_active_power))

hist(dataToUse$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

## Plot 1 is saved to a PNG file with a width of 480 pixels and a height of 480 pixels
png("Plot1.png", width = 480, height = 480)
hist(dataToUse$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
