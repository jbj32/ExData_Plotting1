library(sqldf)
setwd("~/Data-Science/Coursera/Data-Science/ExploratoryDataAnalysis/ExData_Plotting1")

data <- read.csv.sql("household_power_consumption.txt", sep=";", header=TRUE,
                     sql = 'SELECT * FROM file WHERE Date = "1/2/2007" OR Date = "2/2/2007"')

with(data, plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power,
                type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(data, lines(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power))

dev.copy(device = png, "plot2.png", width=480, height=480)
dev.off()