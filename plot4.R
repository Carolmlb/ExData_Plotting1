## Data Science Course - Exploratory Data Science
## Data Source: UC Irvine Machine Learning Repository "Electric Power Consumption"
## Use only 2 days of data, 2007-02-01 and 2007-02-02
## Create plot4.png; four plots generated (2 col and 2 rows)

File <- "c:/coursera/Data Science/DS4_Work/data/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",
                   na.strings = "?")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## convert date and time characters variables to datetime variable

dateTime <- strptime(paste (subData$Date, subData$Time), 
                                      format="%d/%m/%Y %H:%M:%S", tz = "UTC")

## convert SubMetering Data from character to numeric
subMeter1 <- as.numeric(subData$Sub_metering_1)
subMeter2 <- as.numeric(subData$Sub_metering_2)
subMeter3 <- as.numeric(subData$Sub_metering_3)

## convert Global Active Power, Voltage and Global Reactive Power to numeric
globalActPow <- as.numeric(subData$Global_active_power)
globalReactPow <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)

?
## create plot on png device, 2 rows and 2 columns
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

## Plot 1: row 1, plot 1
plot(dateTime, globalActPow, type="l", xlab="", ylab="Global Active Power")

## Plot 2: row 1, plot 2  
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

## Plot 3: row 2, plot 1
## plot subMetering 1 line in black
plot(dateTime, subMeter1, type = "l", xlab = "",ylab="Energy sub metering")
## plot subMetering 2 line in red
lines(dateTime, subMeter2, type = "l", col="red")
## plot subMetering 3 line in blue
lines(dateTime, subMeter3, type = "l", col="blue")
## write legend in top right corner; no box
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"), bty = "n",cex=.8)

## Plot 4: row 2, plot 2
plot(dateTime, globalReactPow, type="l", xlab="datetime", ylab="Global_reactive_power")

# turn device off
dev.off()