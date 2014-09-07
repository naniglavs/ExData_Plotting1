# This code generates plot1.png

# Read the file using read.csv() function

# add na.string = "?" to convert ? to NA
data <- read.csv("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";" , dec = ".")

# merge & convert Data & Time columns in POXIXLt format & add as column
combine_DateTime <- paste(data$Date, data$Time)
Formated_DateTime <- strptime(combine_DateTime, "%d/%m/%Y %H:%M:%S")
data$DateTime <- Formated_DateTime

# Remove NAs
complete_dataset <- na.omit(data)

# Selection based on given date
required_data <- complete_dataset[as.Date(complete_dataset$DateTime) == "2007-02-01" | as.Date(complete_dataset$DateTime) == "2007-02-02", ]

# Plot the histogram
hist(x=required_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Save the output as png file giving the required dimensions

# Close the devise
dev.print(png, file='plot1.png', width = 480, height=480)
dev.off()