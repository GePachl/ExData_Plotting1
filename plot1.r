# Exploratory Data Analysis: Course Project 1
# Task 1: Creating PNG Plot1 about "Global_active_power: household global minute-averaged active power (in kilowatt)" 

# set my working directory
setwd("C:/Users/Gerhard/ExData_Plotting1")

#read project file and filter the data on relevant dates.
hh_power_cons_data <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?",stringsAsFactors=FALSE, dec=".")

# Change Date-Format (from dd/mm/yyyy to default format yyyy-mm-dd)
hh_power_cons_data$Date <- as.Date(hh_power_cons_data$Date, format="%d/%m/%Y")

# Select the relevant data for the plot - dates 2007-02-01 and 2007-02-02
hh_power_consumption <- subset(hh_power_cons_data, hh_power_cons_data$Date == "2007-02-01" | hh_power_cons_data$Date == "2007-02-02")

# create data for plot1 
hh_power_consumption <- as.numeric(hh_power_consumption$Global_active_power)

# open graphics device png and create histogram (also set width of 480 pixels and a height of 480 pixels)
png("plot1.png", width=480, height=480)
hist(hh_power_consumption, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# close the png device
dev.off()