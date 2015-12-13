## Data Science Course - Exploratory Data Science
## Data Source: UC Irvine Machine Learning Repository "Electric Power Consumption"
## Use only 2 days of data, 2007-02-01 and 2007-02-02
## Create plot2.png; plot Global Active Power against date (show as day)

File <- "c:/coursera/Data Science/DS4_Work/data/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## convert date and time characters variables to datetime variable

dateTime <- strptime(paste (subData$Date, subData$Time), 
                                      format="%d/%m/%Y %H:%M:%S", tz = "UTC")

## convert Global Active Power from character to numeric
globalActPow <- as.numeric(subData$Global_active_power)

## create plot on png device
png("plot2.png", width=480, height=480)

## plot line for Global Active Power (y axis) per dateTime (x axis)
plot(dateTime, globalActPow, type = "l", xlab = "",ylab="Global Active Power (kilowatts)")

## turn device off
dev.off()