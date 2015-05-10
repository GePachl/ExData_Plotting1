      # Exploratory Data Analysis: Course Project 1
      # Task 3: Creating plot3.r and plot3.png about "energy sub-metering" consumption/usage for days 2007-02-01 (Thu), 2007-02-02 (Fri)" 
      # separated into three "energy sub-metering" consumption-types: 
      # 1 - kitchen, mainly dishwasher,  oven microwave (black colour)   
      # 2 - laundry room, washing-machine, tumble-drier, refrigerator, light (red colour)
      # 3 - electric water-heater, air-conditioner (blue colour)
      
      # set my working directory
      setwd("C:/Users/Gerhard/ExData_Plotting1")
      
      ## import course project data from file "Individual household electric power consumption Data Set"  
      hh_power_cons_data <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?",stringsAsFactors=FALSE, dec=".")
      
      # First reduce the dataset entries: select the relevant data for the plot - dates 1/2/2007 and 2/2/2007
      hh_power_consumption <- subset(hh_power_cons_data, hh_power_cons_data$Date == "1/2/2007" | hh_power_cons_data$Date == "2/2/2007") 
      
      #  # create new variable "Date_time" for the plot - bind date and time and set appropriate format for the plot 
      hh_power_consumption$Date_time <- as.POSIXct(strptime(paste(hh_power_consumption$Date, hh_power_consumption$Time), "%d/%m/%Y %H:%M:%S"))      
     
      # convert Date-Format from variable "Date" also (from dd/mm/yyyy to default format yyyy-mm-dd)
      hh_power_consumption$Date <- as.Date(hh_power_consumption$Date, format="%d/%m/%Y")
      
      # open graphics device png and create plot2 (also set width of 480 pixels and a height of 480 pixels)
      png("plot3.png", width=480, height=480)
      
      # Create the plot for relation of variable "Global_active_power"  new Var Date_time,with plot-type "1" for lines, xlab-axis without label
      with(hh_power_consumption, {
            plot(Sub_metering_1~Date_time, type="l", ylab="Energy sub metering", xlab="")
            lines(Sub_metering_2~Date_time,col='Red')
            lines(Sub_metering_3~Date_time,col='Blue')
      })
      legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
             legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      
      # close the png graphics device
      dev.off()



