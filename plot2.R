#--------------------------------------------------------------------------
'
Johns Hopkins Bloomberg School of Public Health
Data Science Specialization
Course: Exploratory Data Analysis
Prof.: Roger D. Peng, PhD, Jeff Leek, PhD, Brian Caffo, PhD
Assignment: Course Project 1 - plot 2
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
png(file = "plot2.png")

# Global Active Power graph.
plot(p$datetime, p$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")

# Close the device.
dev.off()
