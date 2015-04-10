plot3 <- function(){
  
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
  
  ##draw plot on screen / type n is to indicate we'll be drawing with the next commands
  plot(only_dates$DateTime, only_dates$Sub_metering_1, type="n", ylab="Global active power (kilowatts)", xlab="Energy Sub metering")
  lines(only_dates$DateTime, only_dates$Sub_metering_1)
  lines(only_dates$DateTime, only_dates$Sub_metering_2, col="red")
  lines(only_dates$DateTime, only_dates$Sub_metering_3, col="blue")
  
  ##lty gives the appropiate symbols to the plot (lines), pt.cex and cex change the font size, bty="n" to remove line around legend
  legend("top", lty=c(1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.7)
  
  ##copy my plot to png file
  dev.copy(png, file="plot3.png")
  
  ##close png device
  dev.off()
  
}