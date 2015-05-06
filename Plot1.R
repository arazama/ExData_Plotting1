
# Read the file

Power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",stringsAsFactors=F)
head(Power)

# Change date and time with the functions strptime() as.date()

Power$Date <- as.Date(Power$Date, format="%d/%m/%Y")
Power$Time <- strptime(Power$Time, format="%H:%M:%S")

# Creating a subset of 2 day period in february 01 and 02

sub <- subset(Power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
head(sub,3)

# Plot 1
plot1 <- hist(sub$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

# Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


