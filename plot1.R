# Starting line:  66637
# Number of lines:  2880
data <- read.csv("household_power_consumption.txt", 
                 na.strings="?", 
                 sep=";",
                 skip = 66636,
                 nrows = 2880,
                 col.names = c("Date", "Time","Global_Active_Power",
                               "Global_Reactive_Power",
                               "Voltage",
                               "Global_Intensity",
                               "Sub_metering_1",
                               "Sub_metering_2",
                               "Sub_metering_3"),
                 colClasses = c("character", "character", "numeric",
                                "numeric", "numeric", "numeric", 
                                "numeric", "numeric", "numeric"))

png(filename="plot1.png")

hist(data$Global_Active_Power,
     breaks = 12,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

 dev.off()