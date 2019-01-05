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

png()
png("Plot1.png", width = 480, height = 480)
hist(powerdata1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

