# Important Note:
# Please make sure that you set the working directory to the one containing 
# the "household_power_consumption.txt" before you try to run this script.
# Otherwise this script will not run at all and give you an error. :)

# Read in only the rows corresponding to the relevant dates 2007-02-01 and 2007-02-02. 

  # Names of the columns in the final dataset
name_list <- c("Date", "Time", "Global_active_power", 
               "Global_reactive_power", "Voltage", "Global_intensity",
               "Sub_metering_1" , "Sub_metering_2", "Sub_metering_3")

  # data read-in command
power_data_subset <- read.table("household_power_consumption.txt", header=T, sep=";", 
                            skip = 66636, nrow = 8640, col.names=name_list)

#search for the data requred for the cart, corresponding to the date "2007-02-01"
date <- grep("[1-2]/2/2007", power_data_subset$Date) #4320 for this search

# This is the filename of the chart to be created
png(filename = "plot1.png")

# This is the formatted histogram to produce
hist(power_data_subset$Global_active_power[date], col="red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# This shuts down output to the PNG file when done
dev.off()







