## Plot #1 for Exploratory Data Analysis Project 1

## This script assumes that the file exists in the working directory
if (!file.exists("household_power_consumption.txt")) {
    break
}

## Read in the data
## TODO: Read in only data within the given date window
rawdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Manipulate the data frame
library(dplyr)

## Select only dates within the desired time
timelo <- strptime("2007-02-01", format="%Y-%m-%d")
timehi <- strptime("2007-02-02", format="%Y-%m-%d")
tdata <- dtest[(strptime(dtest$Date, format="%d/%m/%Y")>=timelo & 
                    strptime(dtest$Date, format("%d/%m/%Y"))<=timehi), ]

## Make and print the plot
png(filename="plot1.png",
    width=480, height=480, units="px")
hist(tdata$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")
dev.off()