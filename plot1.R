##Load data
full <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
#Filter data
ds <- subset(full, Date %in% c("1/2/2007","2/2/2007"))
##converting to suitable format
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")
##Generate hist and generate file
hist(ds$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()