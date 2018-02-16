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

## Convert from char to numeric for plotting
df$Global_active_power <- as.numeric(df$Global_active_power)

## Plot histogram
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Create the output PNG file
with(df, hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot1.png")
dev.off()

## END


