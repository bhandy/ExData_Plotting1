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
data <- data.table(data)


data <- data[, dateTime := paste(data$Date, data$Time)]

# R is getting mad if I just try to drop this into a new column in data[] - 
# so don't, for now.

blah <- as.POSIXlt(data$dateTime, format = "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png")

plot(blah, data$Global_Active_Power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")

dev.off()
