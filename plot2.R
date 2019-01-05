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
png("Plot2.png", width = 480, height = 480)
with(powerdata2, plot(Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n"))
axis(1, tick = TRUE, at = c(1,midpoint, dim(powerdata2)[1]+1), 
     labels = c(powerdata2$Weekday[1], powerdata2$Weekday[midpoint], "Sat" ))
dev.off()





