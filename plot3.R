# This code  generates plot3.R

# Read the file using read.csv() function.
# add na.string = "?" to convert ? to NA
data <- read.csv("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";" , dec = ".")

# Merge & convert the Data & Time columns in POXIXLt format & include as column
combine_DateTime <- paste(data$Date, data$Time)
Formated_DateTime <- strptime(combine_DateTime, "%d/%m/%Y %H:%M:%S")
data$DateTime <- Formated_DateTime

# Remove all NAs
complete_dataset <- na.omit(data)

# Selection based on given date
required_data <- complete_dataset[as.Date(complete_dataset$DateTime) =="2007-02-01"|as.Date(complete_dataset$DateTime)=="2007-02-02",]

# Plot the graphs
plot(required_data$DateTime, required_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(required_data$DateTime, required_data$Sub_metering_2, type="l", xlab="", ylab="Energy sub metering", col="red")
lines(required_data$DateTime, required_data$Sub_metering_3, type="l", xlab="", ylab="Energy sub metering", col="blue")
legend("topright", pch="_", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Save the output as png file giving required dimensions
# Close the devise
dev.print(png, file='plot3.png', width = 480, height=480)
dev.off()