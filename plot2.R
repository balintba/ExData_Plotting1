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
plot(x = filtered_data$Date,y=filtered_data$Global_active_power,type = "l",ylab="Global Active Power (killowats)",xlab="")


## Ploting into a png file
png(filename = "plot2.png")
plot(x = filtered_data$Date,y=filtered_data$Global_active_power,type = "l",ylab="Global Active Power (killowats)",xlab="")
dev.off()
