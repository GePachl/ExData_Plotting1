      # Exploratory Data Analysis: Course Project 1
      # Task 4: Creating plot4.r and plot4.png - 4 different graphics into a single plot
      # 1 - Global active power - see plot2
      # 2 - Energy sub-metering - see plot3
      # 3 - Voltage 
      # 4 - Global_reactive_power
      
      # set working directory
      setwd("C:/Users/Gerhard/ExData_Plotting1")
      
      ## import course project data from file "Individual household electric power consumption Data Set"  
      hh_power_cons_data <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?",stringsAsFactors=FALSE)
      
      # reduce the dataset entries: select the relevant data for the plot - dates 1/2/2007 and 2/2/2007
      hh_power_consumption <- subset(hh_power_cons_data, hh_power_cons_data$Date == "1/2/2007" | hh_power_cons_data$Date == "2/2/2007") 
      
      #  # create new variable "Date_time" for the plot - bind date and time and set appropriate format for the plot 
      hh_power_consumption$Date_time <- as.POSIXct(strptime(paste(hh_power_consumption$Date, hh_power_consumption$Time), "%d/%m/%Y %H:%M:%S"))      
      
      # open graphics device png for plot3 (set width of 480 pixels and a height of 480 pixels)
      png("plot4.png", width=480, height=480)
      
      # set some general parameters for graphics environment- mfcol=c(2,2) divides the graphic into 4 areas (one for every plot) 
      par(mfcol=c(2,2),lty=1, lwd=1, lend=1)
      
      # 1 - create graphic for relation of variable "Global_active_power"  new Var Date_time, with plot-type "1" for lines, xlab-axis without label
      plot(hh_power_consumption$Global_active_power~hh_power_consumption$Date_time, type="l",xlab = "", ylab = "Global Active Power")

      # 2 - generate graphic for  three "energy sub-metering" consumption-types:
      with (hh_power_consumption,plot(Sub_metering_1~Date_time, col.lab="black",type = "l", ylab="Energy sub metering", xlab="",col="black"))
      with (hh_power_consumption,lines(Sub_metering_2~Date_time,  type = "l" ,col="red"))
      with (hh_power_consumption,lines(Sub_metering_3~Date_time,  type = "l", col="blue")) 
      # add legend at topright
      legend("topright", lty=1, lwd=1, bty="n", col=c("black", "red", "blue"),  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      
      # 3 - Voltage graphic
      plot(hh_power_consumption$Voltage~hh_power_consumption$Date_time, type="l",xlab = "datetime", ylab = "Voltage")
      
      # 4 - Global_reactive_power graphic
      plot(hh_power_consumption$Global_reactive_power~hh_power_consumption$Date_time, type="l",xlab = "datetime", ylab = "Global_reactive_power")      
      
      # close png graphics device
      dev.off()


