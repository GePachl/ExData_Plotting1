# Exploratory Data Analysis: Course Project 1
# Task 2: Creating Plot2/PNG2 about "Global_active_power Usage and days Thu, Fri, Sat " 

# set my working directory
setwd("C:/Users/Gerhard/ExData_Plotting1")

#read project file and filter the data on relevant dates.
hh_power_cons_data <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?",stringsAsFactors=FALSE, dec=".")

# Change Date-Format (from dd/mm/yyyy to default format yyyy-mm-dd)
hh_power_cons_data$Date <- as.Date(hh_power_cons_data$Date, format="%d/%m/%Y")

# Select the relevant data for the plot - dates 2007-02-01 and 2007-02-02
hh_powerconsumpt <- subset(hh_power_cons_data, hh_power_cons_data$Date == "2007-02-01" | hh_power_cons_data$Date == "2007-02-02")

# create data for plot1 
# Combine Date and Time
datetime <- paste(as.Date(hh_power_consumpt$Date), hh_power_consumpt$Time)
hh_power_consumpt$Datetime <- as.POSIXct(datetime)

# open graphics device png and create plot (also set width of 480 pixels and a height of 480 pixels)
png("plot2.png", width=480, height=480)

plot(hh_power_consumpt$Global_active_power~hh_power_consumpt$Datetime, type="l",
      xlab="", ylab="Global Active Power (kilowatts)")

# close the png device
dev.off()



