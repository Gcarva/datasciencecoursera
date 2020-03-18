#Load libraries because class 3 made us lazy
require("lubridate")
require("dplyr")
#Read data
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
#Lubridate the dates
data$Date<-dmy(data$Date)
#Select the dates specified
data<-subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
#Histogram it up
hist(as.numeric(data$Global_active_power)/500, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
png(file="plot1.png",
    width=480, height=480)
hist(as.numeric(data$Global_active_power)/500, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()