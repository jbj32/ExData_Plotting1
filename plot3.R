library(sqldf)
setwd("~/Data-Science/Coursera/Data-Science/ExploratoryDataAnalysis/ExData_Plotting1")

data <- read.csv.sql("household_power_consumption.txt", sep=";", header=TRUE,
                     sql = 'SELECT * FROM file WHERE Date = "1/2/2007" OR Date = "2/2/2007"')
times <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
attach(data)

plot(times, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(times, Sub_metering_1, col="black")
lines(times, Sub_metering_2, col="red")
lines(times, Sub_metering_3, col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,
       col = c("black", "red", "blue"),
       text.width = 50000
       )

dev.copy(device = png, "plot3.png", width=480, height=480)
dev.off()