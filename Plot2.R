#Course Project 1 by Camden Schulte
#Plot 2

library(tidyverse)
library(lubridate)


householdpower <- read.table("household_power_consumption.txt",header = T, sep = ";", na.strings = '?')
householdpower$datetime <- dmy_hms(paste(householdpower$Date, householdpower$Time))
householdpower <- householdpower %>% filter(date(householdpower$datetime) == ymd("2007-02-01")
                                            | date(householdpower$datetime) == ymd("2007-02-02"))

householdpower[,3:9] <- as.numeric(unlist(householdpower[,3:9]))


png("plot2.png", width = 480, height = 480)
with(householdpower, plot(datetime, Global_active_power, type = "l", xlab = " ", 
                          ylab = "Global Active Power (kilowatts)"))
dev.off()