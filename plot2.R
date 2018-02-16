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

## Plot line chart and format axes
with(df, plot(df$DateTime,df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

## Create the output PNG file
dev.copy(png, file = "plot2.png")
dev.off()

