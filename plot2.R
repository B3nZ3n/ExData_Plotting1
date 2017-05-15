
library(sqldf)
data <- read.csv.sql(file = "household_power_consumption.txt", sql="select * from file WHERE Date = '1/2/2007' or Date = '2/2/2007' ",header=TRUE, sep=";")



data$datetime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y%H:%M:%S")

#data$Date <- as.Date(data$Date,format="%d/%m/%Y")
#data$Time <- strptime(data$Time, format="%I:%M")




png(filename = "plot2.png")
plot(data$datetime,data$Global_active_power, ylab = "Global Active Power (kilowatts)",type="l", xlab="")
dev.off()