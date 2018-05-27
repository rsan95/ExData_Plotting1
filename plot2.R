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
with(ds,plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()