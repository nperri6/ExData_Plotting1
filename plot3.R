mydata <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")

dated_data <- mydata[which(mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007"), ]

##convert global active power to a numeric

dated_data$Global_active_power <- as.numeric(as.character(dated_data$Global_active_power))

##convert Dates into date format

dated_data$Date <- as.Date(dated_data$Date, format = "%d/%m/%Y")

##combine Date with the time

dated_data$Time <- paste(dated_data$Date, dated_data$Time, sep= " ")

##reformat the date adn time into strptime()

dated_data$Time <- strptime(dated_data$Time, "%Y-%m-%d %H:%M:%S")

##reformat the sub_metering data into numeric values

dated_data$Sub_metering_1 <- as.numeric(as.character(dated_data$Sub_metering_1))
dated_data$Sub_metering_2 <- as.numeric(as.character(dated_data$Sub_metering_2))
par(mfrow = c(1,1))

##Start to develop the plot with x and y labels   draw the other two lines over the top
plot(dated_data$Time, dated_data$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")

lines(dated_data$Time, dated_data$Sub_metering_2, col = "red")

lines(dated_data$Time, dated_data$Sub_metering_3, col = "blue")

##Build in the legend

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col= c("black", "red", "blue"), lty = c(1, 1, 1), cex = 0.5)

##Send the Plot to a png file
dev.copy(png, file = "plot3.png",  width = 480, height = 480)

#close the png creation

dev.off()
