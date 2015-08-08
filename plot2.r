
library(dplyr)
#read the file
banco = household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")
View(household_power_consumption)

attach(banco)

#filtering the date interval
banco$Date <- as.Date(banco$Date, "%d/%m/%Y")
banco2 = filter(banco, banco$Date<"2007-02-03"& banco$Date>"2007-01-31") 

banco2$Global_active_power <- as.numeric(as.character(banco2$Global_active_power))
class(banco2$Global_active_power)

# merge two files of date and time
timeu<-paste(banco2$Date,banco2$Time)
timeu<-strptime(timeu,"%Y-%m-%d %H:%M:%S")

#define axis sticks
d1<-vector()
d1<-as.POSIXct(d1)
d1[1]<-"2007/2/1 00:00:00"
d1[2]<-"2007/2/2 00:00:00"
d1[3]<-"2007/2/3 00:00:00"

#plot the chart
plot(timeu,banco2$Global_active_power, type = "l",xaxt="n", ylab="Global Active power (kilowatts)", xlab=" ")
axis.POSIXct(1, at=seq(d1[1], d1[3], by="day"), labels=format(seq(d1[1], d1[3], by="day"),"%a"), las=0)

#file copy
# file copy
dev.copy(png, file="plot2.png")
dev.off()
