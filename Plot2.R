# Read the file

Power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",stringsAsFactors=F)
head(Power)

# Creating a subset of 2 day period in february 01 and 02
Power$Date <- as.Date(Power$Date, format="%d/%m/%Y")
sub2 <- subset(Power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Change date and time with the functions strptime() as.date()
datetime <- paste(as.Date(sub2$Date), sub2$Time)
sub2$Datetime <- as.POSIXct(datetime)

# Plot 2
as.numeric(sub2$Global_active_power)
plot2 <- plot(sub2$Datetime, sub2$Global_active_power, type="l",xlab="", ylab="Global Active Power (Kilowatts)")

# Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
