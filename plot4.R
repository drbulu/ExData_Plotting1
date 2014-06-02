#Steps to create plot 4

# 1. Load data as as per Plot 3

name_list <- c("Date", "Time", "Global_active_power", 
               "Global_reactive_power", "Voltage", "Global_intensity",
               "Sub_metering_1" , "Sub_metering_2", "Sub_metering_3")

power_data_subset <- read.table("household_power_consumption.txt", header=T, sep=";", 
                                skip = 66636, nrow = 2880, col.names=name_list)

date_time <- paste(power_data_subset$Date, power_data_subset$Time)
datetimeformat <- "%d/%m/%Y %H:%M:%S"
dateTime <- strptime(date_time, datetimeformat)

# get png output graphical device
png(filename = "plot4.png")

# format plot area so that the different plots don't overwrite each other
par(mfrow = c(2, 2))

#Make plots

# Plot 1
plot( dateTime , power_data_subset$Global_active_power, type="l",
      xlab = "", ylab = "Global Active Power")

# Plot 2
plot( dateTime , power_data_subset$Voltage, type="l",
      xlab = "datetime", ylab = "Voltage")

# Plot 3
    library(ggplot2)
    plot( dateTime , power_data_subset[,7], type="l",
          xlab = "", ylab = "Energy sub metering")
    points(dateTime, power_data_subset[,8],col="red", type="l")
    points(dateTime, power_data_subset[,9],col="blue", type="l")
    legend("topright", col = c("black","blue", "red"), 
           legend = names(power_data_subset[7:9]), lty=c(1,1,1))

# Plot 4
plot( dateTime , power_data_subset$Global_reactive_power, type="l",
     xlab = "datetime", ylab = "Global_reactive_power")

# shutdown png graphical device
dev.off()