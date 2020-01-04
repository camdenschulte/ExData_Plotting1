#Course Project 1 by Camden Schulte
#Plot 4

library(tidyverse)
library(lubridate)


householdpower <- read.table("household_power_consumption.txt",header = T, sep = ";", na.strings = '?')
householdpower$datetime <- dmy_hms(paste(householdpower$Date, householdpower$Time))
householdpower <- householdpower %>% filter(date(householdpower$datetime) == ymd("2007-02-01")
                                            | date(householdpower$datetime) == ymd("2007-02-02"))

householdpower[,3:9] <- as.numeric(unlist(householdpower[,3:9]))


png("plot3.png", width = 480, height = 480)
with(householdpower, plot(datetime, Sub_metering_1, type = "l", col = "black", 
                          xlab = " ", ylab = "Energy sub metering"))
with(householdpower, lines(datetime, Sub_metering_2, type = "l", col = "red"))   
with(householdpower, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)


dev.off()