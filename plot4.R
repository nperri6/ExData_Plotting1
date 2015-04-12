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

##reform voltage and global reactive power

dated_data$Global_reactive_power <- as.numeric(as.character(dated_data$Global_reactive_power))
dated_data$Voltage <- as.numeric(as.character(dated_data$Voltage))

## Now all the data should be formatted correctly to input into the charts

## Determine the orientation of each chart entered

par(mfrow= c(2,2))

##Put in the first chart

plot(dated_data$Time, dated_data$Global_active_power, xlab= "", ylab = "Global Active Power (kilowatts)", type = "l")

## Put in the second chart
plot(dated_data$Time, dated_data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")


## Put in the third chart

plot(dated_data$Time, dated_data$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")

lines(dated_data$Time, dated_data$Sub_metering_2, col = "red")

lines(dated_data$Time, dated_data$Sub_metering_3, col = "blue")

##Build in the legend

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col= c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n", cex = 0.5)


## Build in the final chart

plot(dated_data$Time, dated_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power" )
