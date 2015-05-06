# Read the file

Power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",stringsAsFactors=F)
head(Power)

# Creating a subset of 2 day period in february 01 and 02
Power$Date <- as.Date(Power$Date, format="%d/%m/%Y")
sub3 <- subset(Power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Paste date and time and add a new column
datetime <- paste(as.Date(sub3$Date), sub3$Time)
sub3$Datetime <- as.POSIXct(datetime)
?legend

# Plot 3
summary(sub3)
as.numeric(sub3$Sub_metering_1)
as.numeric(sub3$Sub_metering_2)
as.numeric(sub3$Sub_metering_3)

plot3 <- plot(sub3$Datetime, sub3$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
lines(sub3$Datetime, sub3$Sub_metering_2, type="l", col="red")
lines(sub3$Datetime, sub3$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1,lwd=2.5, y.intersp=0.5,col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

par(mfrow=c(1,1))
# Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
