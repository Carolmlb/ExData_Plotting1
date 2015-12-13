## Data Science Course - Exploratory Data Science
## Data Source: UC Irvine Machine Learning Repository "Electric Power Consumption"
## Use only 2 days of data, 2007-02-01 and 2007-02-02
## Create plot1.png; histogram of Global Active Power in red

File <- "c:/coursera/Data Science/DS4_Work/data/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## convert Global Active Power from character to numeric
globalActPow <- as.numeric(subData$Global_active_power)

## create plot on png device
png("plot1.png", width=480, height=480)

## plot histogram using red fill
hist(globalActPow, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()