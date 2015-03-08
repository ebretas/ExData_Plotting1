#--------------------------------------------------------------------------
'
Johns Hopkins Bloomberg School of Public Health
Data Science Specialization
Course: Exploratory Data Analysis
Prof.: Roger D. Peng, PhD, Jeff Leek, PhD, Brian Caffo, PhD
Assignment: Course Project 1 - plot 3
Author: Ernani Bretas
Date: 08-MARCH-2015
'
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
# Loading the data.

p <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = c("?"))

#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
# Processing the data.

# subset selecting the required dates.
p <- subset(p, p$Date == "1/2/2007" | p$Date == "2/2/2007")

# Create a date/time variable.
p$datetime <- paste(p$Date, p$Time, sep=" ")
p$datetime <- strptime(p$datetime, format = "%d/%m/%Y %H:%M:%S")

# Generate a tidy data set with the relevant variables.
p <- p[, c("datetime", "Global_active_power", "Global_reactive_power", "Voltage", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]

#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
# Making the plot.

# Open the device for output.
png(file = "plot3.png")

# Energy sub meteting graph.
plot(p$datetime, p$Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering", col="black")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
with(p[, c("datetime", "Sub_metering_2")], points(p$datetime, p$Sub_metering_2, col="red", type="l"))
with(p[, c("datetime", "Sub_metering_3")], points(p$datetime, p$Sub_metering_3, col="blue", type="l"))

# Close the device.
dev.off()