##Loading the "dplyr" library
library(dplyr)

##Reading the data in (file was renamed to "data.txt" in order to type less)
my_data <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",dec = ".",
                   na.strings = "?",stringsAsFactors = FALSE)

## Setting the Date/Time class to the appropriate coloumns
my_data$Date <- as.Date(my_data$Date,format = "%d/%m/%Y")

## Choosing the need coloumns (Date == 2007-02-01 | 2007-02-02)

filtered_data <- filter(my_data,my_data$Date == as.Date("2007-02-01") | my_data$Date == 
                          as.Date("2007-02-02"))

## Changing the graphical options
par(mfcol = c(1,1))

## Creating a histogram
hist(filtered_data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

## Ploting into a png file
png(filename = "plot1.png")
hist(filtered_data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
