## Data Science Course - Exploratory Data Science
## Data Source: UC Irvine Machine Learning Repository "Electric Power Consumption"
## Use only 2 days of data, 2007-02-01 and 2007-02-02
## Create plot3.png; plot Sub metering data against date (show as day)

File <- "c:/coursera/Data Science/DS4_Work/data/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## convert date and time characters variables to datetime variable

dateTime <- strptime(paste (subData$Date, subData$Time), 
                                      format="%d/%m/%Y %H:%M:%S", tz = "UTC")

## convert SubMetering Data from character to numeric
subMeter1 <- as.numeric(subData$Sub_metering_1)
subMeter2 <- as.numeric(subData$Sub_metering_2)
subMeter3 <- as.numeric(subData$Sub_metering_3)

## create plot on png device
png("plot3.png", width=480, height=480)

## plot subMetering 1 line in black
plot(dateTime, subMeter1, type = "l", xlab = "",ylab="Energy sub metering")
## plot subMetering 2 line in red
lines(dateTime, subMeter2, type = "l", col="red")
## plot subMetering 3 line in blue
lines(dateTime, subMeter3, type = "l", col="blue")

## write legend in top right corner
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c("black", "red", "blue"))

## turn device off
dev.off()