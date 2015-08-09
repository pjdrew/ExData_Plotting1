house <- read.table("household_power_consumption.txt", 
         header = TRUE, sep = ";", na.strings = "?")

day1 <- subset(house, as.Date(house$Date,format = "%d/%m/%Y") == 
        as.Date("2007-02-01", format = "%Y-%m-%d"), )

day2 <- subset(house, as.Date(house$Date,format = "%d/%m/%Y") == 
        as.Date("2007-02-02", format = "%Y-%m-%d"), )

days <- rbind(day1,day2)

tmp <- paste(days$Date, days$Time, sep = " ", collapse = NULL)
days$datetime <- strptime(tmp, format = "%d/%m/%Y  %H:%M:%S")

xrange <- range(days$datetime)
yrange <- range(c(days$Sub_metering_1,days$Sub_metering_2,days$Sub_metering_3))

plot(xrange, yrange, type = "n", xlab = "", ylab = "Energy sub metering")

lines(days$datetime,days$Sub_metering_3, col = "blue")
lines(days$datetime,days$Sub_metering_2, col = "red")
lines(days$datetime,days$Sub_metering_1, col = "black")

legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1,1), 
       col = c("black","red","blue"))

dev.copy(png,"plot3.png")

dev.off()
