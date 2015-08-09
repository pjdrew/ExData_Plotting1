house <- read.table("household_power_consumption.txt", 
         header = TRUE, sep = ";", na.strings = "?")

day1 <- subset(house, as.Date(house$Date,format = "%d/%m/%Y") == 
        as.Date("2007-02-01", format = "%Y-%m-%d"), )

day2 <- subset(house, as.Date(house$Date,format = "%d/%m/%Y") == 
        as.Date("2007-02-02", format = "%Y-%m-%d"), )

days <- rbind(day1,day2)

tmp <- paste(days$Date, days$Time, sep = " ", collapse = NULL)
days$datetime <- strptime(tmp, format = "%d/%m/%Y  %H:%M:%S")

with(days,plot(datetime, Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = ""))

dev.copy(png,"plot2.png")

dev.off()
