#set the working directory
setwd("C:/Users/leo/Desktop/stat/DS training/Exploratory Data Analysis/exdata_data_household_power_consumption")

#read the data
cols <- c("character", "character", rep_len("numeric", 7))
data <- read.table("household_power_consumption.txt", header = T, colClasses = cols, sep = ";", na.strings = "?") 

#convert the data variable
data$Date <- as.Date(data$Date, "%d/%m/%Y")  

#only use part of the whole data set
dataused <- subset(data, data$Date >= '2007-02-01' & data$Date <= '2007-02-02')

#open the graph device and set png file size
png("plot1.png", height = 480, width = 480)

#make the histogram
hist(dataused$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#close the graph device 
dev.off()
