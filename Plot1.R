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

#Plot 1
png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
with(subdat, hist(Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)"))
dev.off()

#Reset local variable
Sys.setlocale("LC_TIME", "nl_NL.UTF-8")