library(sqldf)
setwd("~/Data-Science/Coursera/Data-Science/ExploratoryDataAnalysis/ExData_Plotting1")

data <- read.csv.sql("household_power_consumption.txt", sep=";", header=TRUE,
                     sql = 'SELECT * FROM file WHERE Date = "1/2/2007" OR Date = "2/2/2007"')

with(data, hist(Global_active_power, col="red",
                xlab="Global Active Power (kilowatts)",
                main="Global Active Power"))

dev.copy(device = png, "plot1.png", width=480, height=480)
dev.off()