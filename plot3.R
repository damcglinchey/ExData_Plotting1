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
tdata <- mutate(tdata, DateTime=paste(Date, Time, sep = " "))
tdata$DateTime <- strptime(tdata$DateTime, format="%d/%m/%Y %H:%M:%S")

## Make and print the plot
png(filename="plot3.png",
    width=480, height=480, units="px")
plot(tdata$DateTime, tdata$Sub_metering_1, 
     type="n", 
     xlab="", ylab="Energy sub metering")
points(tdata$DateTime, tdata$Sub_metering_1, 
     type="l") 
points(tdata$DateTime, tdata$Sub_metering_2, 
     type="l", col="red")
points(tdata$DateTime, tdata$Sub_metering_3, 
     type="l", col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=c("1", "1", "1"), 
       col=c("black", "red", "blue"))
dev.off()

## Clean up after myself
rm(rawdata)
rm(timelo)
rm(timehi)
rm(tdata)
