# This code generates plot4.R


# Read the file using read.csv() function.
# add na.string = "?" to convert all ? to NA
dataset <- read.csv("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";" , dec = ".")

# merge & convert the Data & Time columns in POXIXLt format & include as column
combine_DateTime <- paste(dataset$Date, dataset$Time)
Formated_DateTime <- strptime(combine_DateTime, "%d/%m/%Y %H:%M:%S")
dataset$DateTime <- Formated_DateTime

# Remove all NA
complete_dataset <- na.omit(dataset)

# Selection based on given date
required_data <- complete_dataset[as.Date(complete_dataset$DateTime) == "2007-02-01" | as.Date(complete_dataset$DateTime) == "2007-02-02", ]

# Plot the graphs
par(mfcol = c(2,2))
plot(required_data$DateTime, required_data$Global_active_power, type="l", xlab="", ylab = "Global Active Power")
plot(required_data$DateTime, required_data$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(required_data$DateTime, required_data$Sub_metering_2, type="l", xlab="", ylab = "Energy sub metering", col = "red")
lines(required_data$DateTime, required_data$Sub_metering_3, type="l", xlab="", ylab = "Energy sub metering", col = "blue")
legend("topright", pch="_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(required_data$DateTime, required_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(required_data$DateTime, required_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Save output as png file 
# Close the devise
dev.print(png, file = 'plot4.png', width = 480, height = 480)
dev.off()