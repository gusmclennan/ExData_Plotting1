## Prepare Plot 3

## Load necessary libraries
library(lubridate)
library(datasets)

## Read in data file
fl <- "C:/Users/gus.mclennan/Documents/Working dir/household_power_consumption.txt"
df <- read.table(fl, sep = ";", header = TRUE, stringsAsFactors = FALSE)

## Reformat Date variable
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

## Subset data for just dates 2007-02-01 and 2007-02-02
df <- subset(df, Date == "2007-02-01" | Date == "2007-02-02")

## Create a date/time variable by combining the individual Date and Time elements
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- ymd_hms(df$DateTime)

## Convert from char to numeric for plotting
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
## Plot line chart and format ax
plot(df$DateTime, df$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), xjust = 1)


## Create the output PNG file
dev.copy(png, file = "plot3.png")
dev.off()

