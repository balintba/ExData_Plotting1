##Loading the "dplyr" library
library(dplyr)

##Reading the data in (file was renamed to "data.txt" in order to type less)
my_data <- read.table("./household_power_consumption.txt",header = TRUE,sep = ";",dec = ".",
                      na.strings = "?",stringsAsFactors = FALSE)

## Adding to Date the values of the Time coloumn
my_data$Date <- paste(my_data$Date,my_data$Time,sep=" ")
## Deleting the Time coloumn
my_data <- my_data[,-2]
## Setting the first coloumn to Date/Time format
my_data$Date <- as.POSIXct(my_data$Date,format = "%d/%m/%Y %H:%M:%S")

## Choosing the need coloumns (Date == 2007-02-01 | 2007-02-02)
filtered_data <- filter(my_data,as.Date(my_data$Date) == as.Date("2007-02-01") | as.Date(my_data$Date) == 
                          as.Date("2007-02-02"))

## Since the native language of my computer differs from English, I have to set the loacal language to English
## in order to display the weekdays on the plot correctly
Sys.setlocale("LC_ALL", locale = "English_United Kingdom")

## Changing the graphical options
par(mfcol = c(1,1))

## Plotting to the screen
plot(x = filtered_data$Date,y=filtered_data$Sub_metering_1,type = "l",ylab="Energy Sub Metering",xlab="")

## Adding the second and third line
lines(x = filtered_data$Date, y= filtered_data$Sub_metering_2,col="red")
lines(x = filtered_data$Date, y= filtered_data$Sub_metering_3,col="blue")

## Setting up the legend
legend(x = "topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 1,col=c("black","red","blue"))

## Ploting into a png file
png(filename = "plot3.png")
plot(x = filtered_data$Date,y=filtered_data$Sub_metering_1,type = "l",ylab="Energy Sub Metering",xlab="")
lines(x = filtered_data$Date, y= filtered_data$Sub_metering_2,col="red")
lines(x = filtered_data$Date, y= filtered_data$Sub_metering_3,col="blue")
legend(x = "topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 1,col=c("black","red","blue"))
dev.off()
