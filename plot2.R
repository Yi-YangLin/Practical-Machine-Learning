datafile <- "./data science/Exploratory Data Analysis/project 1/exdata_data_household_power_consumption/household_power_consumption.txt"
Alldata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
head(Alldata)
subdata <- Alldata[Alldata$Date %in% c("1/2/2007","2/2/2007") ,]

subdata$Date <- as.Date(subdata$Date,"%d/%m/%Y")
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

png("plot2.png", width=480, height=480)
plot(subdata$DateTime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


