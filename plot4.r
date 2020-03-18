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
#Graphs
png(file="plot4.png",
    width=480, height=480)

par(mfrow=c(2,2))

plot(data$Date_Time, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", main="")
  lines(data$Date_Time, data$Sub_metering_2, type="l", col="red")
  lines(data$Date_Time, data$Sub_metering_3, type="l", col="blue")
  legend(x="topright", y="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1), lwd=c(1,1,1))

plot(data$Date_Time, data$Voltage, type="l", ylab="Voltage", xlab="Datetime", main="")

plot(data$Date_Time, as.numeric(data$Global_active_power)/500, type="l", ylab="Global Active Power (kilowatts)", xlab="", main="")

plot(data$Date_Time, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="Datetime", main="")

dev.off()
