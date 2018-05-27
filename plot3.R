##Load data
full <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
#Filter data
ds <- subset(full, Date %in% c("1/2/2007","2/2/2007"))
##converting to suitable format
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")
#combining data to a single col
datetime <- paste(as.Date(ds$Date), ds$Time)
ds$Datetime <- as.POSIXct(datetime
#Generate output
with(ds, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()