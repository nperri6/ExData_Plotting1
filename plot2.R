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

##create the plot with type "l" for line plot

plot(dated_data$Time, dated_data$Global_active_power, xlab= "", ylab = "Global Active Power (kilowatts)", type = "l")

## create the png file

dev.copy(png, file = "plot2.png", height = 480, width = 480)

#close the png creation

dev.off()
