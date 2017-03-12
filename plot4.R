datafile <- "./data science/Exploratory Data Analysis/project 1/exdata_data_household_power_consumption/household_power_consumption.txt"
Alldata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
head(Alldata)
subdata <- Alldata[Alldata$Date %in% c("1/2/2007","2/2/2007") ,]

subdata$Date <- as.Date(subdata$Date,"%d/%m/%Y")

subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))


png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
plot(subdata$DateTime, subdata$Global_active_power, type="l", ylab= "Global Active Power", xlab="")
plot(subdata$DateTime, subdata$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(subdata$DateTime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$DateTime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
plot(subdata$DateTime,subdata$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(subdata$DateTime,subdata$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")
dev.off()







