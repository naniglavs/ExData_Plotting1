# This code generates plot2.R

# Read the file using read.csv() function and add na.string = "?" to convert ? to NA
data <- read.csv("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";" , dec = ".")

# merge & convert the Data & Time columns in POXIXLt format & include as column
combine_DateTime <- paste(data$Date, data$Time)
Formated_DateTime <- strptime(combine_DateTime, "%d/%m/%Y %H:%M:%S")
data$DateTime <- Formated_DateTime

# Remove NAs
complete_dataset <- na.omit(data)

# Selection based on the given date
required_data <- complete_dataset[as.Date(complete_dataset$DateTime) == "2007-02-01" | as.Date(complete_dataset$DateTime) == "2007-02-02", ]

# Plot required graph
plot(required_data$DateTime, required_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Save the output as png file with required dimensions
# Close the device
dev.print(png, file='plot2.png', width = 480, height=480)
dev.off()