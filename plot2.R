#Steps to create plot 2

# 1. Load data as as per Plot 1
    # Names of the columns in the final dataset
name_list <- c("Date", "Time", "Global_active_power", 
               "Global_reactive_power", "Voltage", "Global_intensity",
               "Sub_metering_1" , "Sub_metering_2", "Sub_metering_3")
    # data read-in command
power_data_subset <- read.table("household_power_consumption.txt", header=T, sep=";", 
                                skip = 66636, nrow = 2880, col.names=name_list)

# 2. Correctly format date (x-axis variable)
    #get a datetime object from combining the date and time columns
        # Combine date and time rows
date_time <- paste(power_data_subset$Date, power_data_subset$Time)
        # Provide the required format of final product
datetimeformat <- "%d/%m/%Y %H:%M:%S"
        # Obtain final datetime object product via strptime()
dateTime <- strptime(date_time, datetimeformat)

# 2. Create plot!
png(filename = "plot2.png")

plot( dateTime , power_data_subset$Global_active_power, type="l",
      xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()