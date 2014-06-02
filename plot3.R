#Steps to create plot 3

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


# got some help from: 
# using ggplot2: 
    # http://www.sixhat.net/how-to-plot-multpile-data-series-with-ggplot.html
    # http://www.r-bloggers.com/adding-a-legend-to-a-plot/
# using base (much harder, will try later): 
    # http://www.sixhat.net/plotting-multiple-data-series-in-r.html
    # This is way easier with ggplot2


png(filename = "plot3.png")
# make plot
    # import ggplot2 library
library(ggplot2)
    # create the plot with the first y-axis data series
plot( dateTime , power_data_subset[,7], type="l",
      xlab = "", ylab = "Energy sub metering")
    # add second y-axis data series
points(dateTime, power_data_subset[,8],col="red", type="l")
    # add third y-axis data series
points(dateTime, power_data_subset[,9],col="blue", type="l")
    # add the legend to the plot
legend("topright", col = c("black","blue", "red"), 
       legend = names(power_data_subset[7:9]), lty=c(1,1,1))

dev.off()