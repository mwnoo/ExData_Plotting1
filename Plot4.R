#clear workspace
rm(list=ls())

#Set local variable
Sys.setlocale("LC_TIME", "en_US")

#Read the data
dat <- read.csv(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

class(dat$Date)
class(dat$Time)

#Convert Date and Time
dat$Date <- strptime(paste(dat$Date,dat$Time), format = "%d/%m/%Y %H:%M:%S")

#Create a subset using as.Date() to only compare the dates
subdat <- dat[as.Date(dat$Date) >= "2007-02-01" & as.Date(dat$Date) <= "2007-02-02",]

#Plot 4
#With type = "n" the plot is setup but nothing is plotted in the plotting region yet
png(file = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow = c(2,2))
with(subdat, {
    #subplot 1
    plot(Date, Global_active_power, xlab = "", ylab = "Global active power", type = "n")
    lines(Date, Global_active_power)
    #subplot 2
    plot(Date, Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
    lines(Date, Voltage)
    #subplot 3
    plot(Date, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
    lines(Date, Sub_metering_1, col = "black")
    lines(Date, Sub_metering_2, col = "red")
    lines(Date, Sub_metering_3, col = "blue")
    legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
    #subplot 4
    plot(Date, Global_reactive_power, xlab = "datetime", type = "n")
    lines(Date, Global_reactive_power)
})
dev.off()

#Reset mfrow
par(mfrow = c(1,1))

#Reset local variable
Sys.setlocale("LC_TIME", "nl_NL.UTF-8")