      # Exploratory Data Analysis: Course Project 1
      # Task 2: Creating plot2.r and plot2.png about "Global_active_power consumption/usage separated for days 2007-02-01 (Thu), 2007-02-02 (Fri)" 
      
      # set my working directory
      setwd("C:/Users/Gerhard/ExData_Plotting1")
      
      ## import course project data from file "Individual household electric power consumption Data Set"  
      hh_power_cons_data <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?",stringsAsFactors=FALSE)
      
      # First reduce the dataset entries: select the relevant data for the plot - dates 1/2/2007 and 2/2/2007
      hh_power_consumption <- subset(hh_power_cons_data, hh_power_cons_data$Date == "1/2/2007" | hh_power_cons_data$Date == "2/2/2007") 
      
      #  # create new variable "Date_time" for the plot - bind date and time and set appropriate format for the plot 
      hh_power_consumption$Date_time <- as.POSIXct(strptime(paste(hh_power_consumption$Date, hh_power_consumption$Time), "%d/%m/%Y %H:%M:%S"))      
      
      # open graphics device png and create plot2 (also set width of 480 pixels and a height of 480 pixels)
      png("plot2.png", width=480, height=480)
      
      # Create the plot for relation of variable "Global_active_power"  new Var Date_time, with plot-type "1" for lines, xlab-axis without label
      plot(hh_power_consumption$Global_active_power~hh_power_consumption$Date_time, type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
      
      # close the png graphics device
      dev.off()



