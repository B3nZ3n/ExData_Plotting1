data <- read.csv(file = "household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings = "?")

data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%I:%M")

data <- data[data$Date %in% c(as.Date("20070201", format="%Y%m%d"),as.Date("20070202",format="%Y%m%d")),]


png(filename = "plot1.png")
hist(((data$Global_active_power)),main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()