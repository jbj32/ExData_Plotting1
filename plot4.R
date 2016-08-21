library(sqldf)
setwd("~/Data-Science/Coursera/Data-Science/ExploratoryDataAnalysis/ExData_Plotting1")

data <- read.csv.sql("household_power_consumption.txt", sep=";", header=TRUE,
                     sql = 'SELECT * FROM file WHERE Date = "1/2/2007" OR Date = "2/2/2007"')
attach(data)
times <- strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))

plot(times, Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(times, Global_active_power)

plot(times, Voltage, xlab="datetime", ylab="Voltage", type="n")
lines(times, Voltage)

plot(times, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(times, Sub_metering_1, col="black")
lines(times, Sub_metering_2, col="red")
lines(times, Sub_metering_3, col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,
       bty = "n",
       col = c("black", "red", "blue"),
       text.width = 90000
)

plot(times, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="n")
lines(times, Global_reactive_power)

dev.copy(device = png, "plot4.png", width=480, height=480)
dev.off()