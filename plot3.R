
library(sqldf)
data <- read.csv.sql(file = "household_power_consumption.txt", sql="select * from file WHERE Date = '1/2/2007' or Date = '2/2/2007' ",header=TRUE, sep=";")



data$datetime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y%H:%M:%S")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%I:%M")




png(filename = "plot3.png")
plot(data$datetime,data$Sub_metering_1, ylab = "Energy sub metering",type="l", xlab="")
lines(data$datetime,data$Sub_metering_2, col="red")
lines(data$datetime,data$Sub_metering_3, col="blue")
legend("topright",legend=names(data[,7:9]),
       lwd=1,col=c("black","red","blue"))
dev.off()