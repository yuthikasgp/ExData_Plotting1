# Create the first plot required in the assignment

rm(list = ls())

library(dplyr)

header = read.table("household_power_consumption.txt", 
                    header = FALSE, sep = ";", nrows = 1)
powerdata <- read.table("household_power_consumption.txt", 
                        header = FALSE, skip =  66600, sep = ";", nrows = 4000)

for ( i in 1:length(header)){
  names(powerdata)[i] <- as.character(header[1,i])
}

day1 <- "1/2/2007"
day2 <- "2/2/2007"

powerdata1 <- filter(powerdata, Date == day1 | Date == day2 )
powerdata2 <- mutate( powerdata1, Weekday = weekdays(as.Date(powerdata1$Date, "%d/%m/%Y"), abbreviate = TRUE))

View(powerdata1)
midpoint = dim(powerdata2)[1]/2+1

png()
png("Plot3.png", width = 480, height = 480)

plot(powerdata2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(powerdata2$Sub_metering_2, col = "red", type = "l")
lines(powerdata2$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1) 
axis(1, tick = TRUE, at = c(1,midpoint, dim(powerdata2)[1]+1), 
     labels = c(powerdata2$Weekday[1], powerdata2$Weekday[midpoint], "Sat" ))

dev.off()





