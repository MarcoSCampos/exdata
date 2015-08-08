
library(dplyr)

# read the database
banco = household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")
View(household_power_consumption)

attach(banco)

banco$Date <- as.Date(banco$Date, "%d/%m/%Y")

# filtering the interval
banco2 = filter(banco, banco$Date<"2007-02-03"& banco$Date>"2007-01-31") 

banco2$Global_active_power = as.numeric(banco2$Global_active_power)
class(banco2$Global_active_power)

# histogram plotting
hist(banco2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# file copy
dev.copy(png, file="plot1.png")
dev.off()




