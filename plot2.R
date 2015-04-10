plot2 <- function(){
  
  ## setwd("C:/Users/pesta_000/Desktop/coursera Data/04 exploratory data analysis/data/project1")
  data <- read.table(file ="household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
  
  ##convert to Date and Time format
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  ##select only the dates 2007-02-01 and 2007-02-02
  only_dates <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
  
  ##convert to Date and Time format
  dates <- only_dates$Date
  times <- only_dates$Time
  
  ##dates times
  x <- paste(dates, times)
  
  dates_time <-  strptime(x, "%Y-%m-%d %H:%M:%S")
  
  only_dates$DateTime <- dates_time
  
  ##draw plot on screen
  plot(only_dates$DateTime, only_dates$Global_active_power, type="n", ylab="Global active power (kilowatts)", xlab="")
  lines(only_dates$DateTime, only_dates$Global_active_power)
  
  ##copy my plot to png file
  dev.copy(png, file="plot2.png")
  
  ##close png device
  dev.off()
  
}