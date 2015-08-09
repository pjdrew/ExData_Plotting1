house <- read.table("household_power_consumption.txt", 
         header = TRUE, sep = ";", na.strings = "?")

day1 <- subset(house, as.Date(house$Date,format = "%d/%m/%Y") == 
        as.Date("2007-02-01", format = "%Y-%m-%d"), )

day2 <- subset(house, as.Date(house$Date,format = "%d/%m/%Y") == 
        as.Date("2007-02-02", format = "%Y-%m-%d"), )

days <- rbind(day1,day2)

hist(days$Global_active_power,
     breaks = 12, 
     col    = "red",
     main   = "Global Active Power", 
     xlab   = "Global Active Power (kilowatts)")

dev.copy(png,"plot1.png")

dev.off()
