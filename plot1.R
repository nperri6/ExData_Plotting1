mydata <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")

##mydata$Date <- as.Date( as.character(mydata$Date), "%d/%m/%y")

dated_data <- mydata[which(mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007"), ]



##convert global active power to a numeric

dated_data$Global_active_power <- as.numeric(as.character(dated_data$Global_active_power))

##create a histogram of Global Active Power

hist(dated_data$Global_active_power, main = "Global Active Power", col = "red", xlab ="Global Active Power (kilowatts)")

## create the png file

dev.copy(png, file = "plot1.png",  width = 480, height = 480)

#close the png creation

dev.off()