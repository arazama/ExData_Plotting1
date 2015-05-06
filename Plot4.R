# Read the file

Power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",stringsAsFactors=F)
head(Power)
str(Power)
# Creating a subset of 2 day period in february 01 and 02
Power$Date <- as.Date(Power$Date, format="%d/%m/%Y")
sub4 <- subset(Power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Paste date and time and add a new column
datetime <- paste(as.Date(sub4$Date), sub4$Time)
sub4$Datetime <- as.POSIXct(datetime)

# Plot 4
summary(sub4)
str(sub4)
as.numeric(sub4$Global_active_power)
as.numeric(sub4$Sub_metering_1)
as.numeric(sub4$Sub_metering_2)
as.numeric(sub4$Sub_metering_3)
as.numeric(sub4$Global_reactive_power)

par(mfrow=c(2,2))
Plot1 <- plot(sub4$Datetime, sub4$Global_active_power, type="l",xlab="", ylab="Global Active Power")
plot2 <- plot(sub4$Datetime, sub4$Voltage, type="l",xlab="datetime", ylab="Voltage")
plot3 <- plot(sub4$Datetime, sub4$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
lines(sub4$Datetime, sub4$Sub_metering_2, type="l", col="red")
lines(sub4$Datetime, sub4$Sub_metering_3, type="l", col="blue")
legend("topright", bty ="n",lty=1, y.intersp=0.3, cex= 0.7,c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
plot4 <- plot(sub4$Datetime, sub4$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power")
# Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

