data <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

start.time <- as.Date("01/02/2007", format = "%d/%m/%Y")
end.time <- as.Date("03/02/2007", format = "%d/%m/%Y")

png(filename="plot1.png")

hist(data$Global_active_power[data$Date == start.time | data$Date == end.time],
     breaks = 12,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()