      # Exploratory Data Analysis: Course Project 1
      # Task 3: Creating plot3.r and plot3.png about "energy sub-metering" consumption/usage for days 2007-02-01 (Thu), 2007-02-02 (Fri)" 
      # separated into three "energy sub-metering" consumption-types: 
      # 1 - kitchen, mainly dishwasher,  oven microwave (black colour)   
      # 2 - laundry room, washing-machine, tumble-drier, refrigerator, light (red colour)
      # 3 - electric water-heater, air-conditioner (blue colour)
      
      # set working directory
      setwd("C:/Users/Gerhard/ExData_Plotting1")
      
      ## import course project data from file "Individual household electric power consumption Data Set"  
      hh_power_cons_data <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?",stringsAsFactors=FALSE)
      
      # reduce the dataset entries: select the relevant data for the plot - dates 1/2/2007 and 2/2/2007
      hh_power_consumption <- subset(hh_power_cons_data, hh_power_cons_data$Date == "1/2/2007" | hh_power_cons_data$Date == "2/2/2007") 
      
      #  # create new variable "Date_time" for the plot - bind date and time and set appropriate format for the plot 
      hh_power_consumption$Date_time <- as.POSIXct(strptime(paste(hh_power_consumption$Date, hh_power_consumption$Time), "%d/%m/%Y %H:%M:%S"))      
      
      # open graphics device png for plot3 (set width of 480 pixels and a height of 480 pixels)
      png("plot3.png", width=480, height=480)
      
      # set some general parameters for graphics environment  
      par(lty=1, lwd=1, lend=1, las=1)

      # make plots for the three "energy sub-metering" consumption-types:
      with (hh_power_consumption,plot(Sub_metering_1~Date_time, type = "l", ylab="Energy sub metering", xlab="",col="black"))
      with (hh_power_consumption,lines(Sub_metering_2~Date_time,  type = "l" ,col="red"))
      with (hh_power_consumption,lines(Sub_metering_3~Date_time,  type = "l", col="blue"))      

      # add legend at topright
      legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      
      # close png graphics device
      dev.off()


