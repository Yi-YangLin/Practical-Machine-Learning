datafile <- "./data science/Exploratory Data Analysis/project 1/exdata_data_household_power_consumption/household_power_consumption.txt"
Alldata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
head(Alldata)
subdata <- Alldata[Alldata$Date %in% c("1/2/2007","2/2/2007") ,]

subdata$Date <- as.Date(subdata$Date,"%d/%m/%Y")

png("plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, type="l", main="Global Active Power",col='red',ylab= "Frequency", xlab="Global Active Power(kilowatts)")
dev.off()
