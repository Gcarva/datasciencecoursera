#Load libraries because class 3 made us lazy
require("lubridate")
require("dplyr")
#Read data
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
#Lubridate the dates
data$Date_Time<-dmy_hms(paste(data$Date, data$Time))
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)
#Select the dates specified
data<-subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
#Graph
png(file="plot2.png",
    width=480, height=480)
plot(data$Date_Time, as.numeric(data$Global_active_power)/500, type="l", ylab="Global Active Power (kilowatts)", xlab="", main="")
dev.off()