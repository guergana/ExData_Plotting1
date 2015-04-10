plot1 <- function(){
  
  ## setwd("C:/Users/pesta_000/Desktop/coursera Data/04 exploratory data analysis/data/project1")
  data <- read.table(file ="household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
  
  ##convert to Date and Time format
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  ##select only the dates 2007-02-01 and 2007-02-02
  only_dates <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
  
 
  
  ##draw plot on screen
  hist(only_dates$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  
  ##copy my plot to png file
  dev.copy(png, file="plot1.png")
  
  ##close png device
  dev.off()
  
}