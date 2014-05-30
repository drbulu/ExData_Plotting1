#instructions for making plot 1

# Please add the working Dir in which the files are located.
# This is currently set to a subdirectory called data.
workingDir <- "./Data"

# Sets working directory to the location specified in teh workingDir variable

setwd(workingDir)

# Read the data into R
power_data <- read.table("household_power_consumption.txt", header=T, sep=";")
dataClasses <- ("date", "time", "numeric", "numeric")

# the relevant dates: * We will only be using data from the dates 2007-02-01 and 2007-02-02. 

  # this represents rows: 66637 - 98316 in the original dataset
  # in the final script, these are the only rows that I will read in
power_data2 <- read.table("household_power_consumption.txt", header=T, sep=";", skip = 66636, nrow = 8640)
# this works but you will have to read the names in separately as well

name_list <- c("Date", "Time", "Global_active_power", 
               "Global_reactive_power", "Voltage", "Global_intensity",
               "Sub_metering_1" , "Sub_metering_2", "Sub_metering_3")

#This leaves us with: the final import statment
power_dataset <- read.table("household_power_consumption.txt", header=T, sep=";", 
                            skip = 66636, nrow = 8640, col.names=name_list)

#search for the date "2007-02-02*
date2 <- grep("2/2/2007", power_data$Date) #4320 for this search
date3 <- grep("[1-2]/2/2007", power_data$Date) #8640 for this search (double the previous)

#now subset the data by rows with the required dates
power_subset <- power_data[date3,] 

##           Charting
# This is the basic chart when you have got the data into the right classes

# note -> use grep to find the rows where the date is "1/2/2007" and make that equal
# to date
date <- 1:4320 

hist(power_data22$Global_active_power[date], col="red")

# now to modify the histogram parameters
hist(power_data22$Global_active_power[1:4320], col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# the one above looks like a winner but there might be more e.g.
plot = F,
#This then allows you to divert the output to a PNG file
png(filename = "plot1.png")

# useful reference: http://www.statmethods.net/advgraphs/axes.html




