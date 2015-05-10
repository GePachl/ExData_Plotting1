# Exploratory Data Analysis: Course Project 1
# Task 1: Creating PNG Plot1 about "Global_active_power: household global minute-averaged active power (in kilowatt)"
# for days 2007-02-01 (Thu), 2007-02-02 (Fri)" 

# set my working directory
setwd("C:/Users/Gerhard/ExData_Plotting1")

# import course project data from file "Individual household electric power consumption Data Set"  
hh_power_cons_data <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?",stringsAsFactors=FALSE, dec=".")

# First reduce the dataset entries: select the relevant data for the plot - dates 1/2/2007 and 2/2/2007
hh_power_consumption <- subset(hh_power_cons_data, hh_power_cons_data$Date == "1/2/2007" | hh_power_cons_data$Date == "2/2/2007") 

# Change chr-Format of Variable "Date" to Date-Format yyyy-mm-dd)
hh_power_consumption$Date <- as.Date(hh_power_consumption$Date, format="%d/%m/%Y")

# open graphics device png and create histogram (also set width of 480 pixels and a height of 480 pixels)
png("plot1.png", width=480, height=480)

# use the variable "Global_active_power" from Subset for Histogram
hist(hh_power_consumption$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# close the png device
dev.off()