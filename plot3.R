#set the working directory
setwd("C:/Users/leo/Desktop/stat/DS training/Exploratory Data Analysis/exdata_data_household_power_consumption")

#read the data
cols <- c("character", "character", rep_len("numeric", 7))
data <- read.table("household_power_consumption.txt", header = T, colClasses = cols, sep = ";", na.strings = "?") 

#convert the data variable
data$Date <- as.Date(data$Date, "%d/%m/%Y")  

#only use part of the whole data set
dataused <- subset(data, data$Date >= '2007-02-01' & data$Date <= '2007-02-02')

#creat a new variable
dataused$DateTime <- paste(dataused$Date, dataused$Time)
dataused$DateTime <- as.POSIXct(strptime(dataused$DateTime, "%Y-%m-%d %T"))

#display names of weekdays in English
Sys.setlocale(locale = "C")

#open the graph device and set png file size
png("plot3.png", height = 480, width = 480)

#make the plot
plot(dataused$DateTime, dataused$Sub_metering_1, pch = NA, xlab = "",ylab = "Energy sub metering")
lines(dataused$DateTime, dataused$Sub_metering_1)
lines(dataused$DateTime, dataused$Sub_metering_2, col = "red")
lines(dataused$DateTime, dataused$Sub_metering_3, col = "blue")

#add the legend
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = c(1, 1, 1),
       col = c("black", "red", "blue"))

#close the graph device 
dev.off()
