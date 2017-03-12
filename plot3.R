datafile <- "./data science/Exploratory Data Analysis/project 1/exdata_data_household_power_consumption/household_power_consumption.txt"
Alldata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
head(Alldata)
subdata <- Alldata[Alldata$Date %in% c("1/2/2007","2/2/2007") ,]

subdata$Date <- as.Date(subdata$Date,"%d/%m/%Y")

subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))



png("plot3.png", width=480, height=480)
plot(subdata$DateTime, subdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(subdata$DateTime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$DateTime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()







