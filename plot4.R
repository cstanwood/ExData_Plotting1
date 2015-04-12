# Read the data
headerrow<-read.table("household_power_consumption.txt",sep = ";", nrows=1)
power<-read.table("household_power_consumption.txt",col.names = unname(unlist(headerrow[1,])), sep = ";", skip = 66637, nrows=2880)
#convert character strings to date
DateTime<-strptime(with(power, paste(Date,Time)), "%d/%m/%Y %H:%M:%S", tz = "UTC")
power<-cbind(DateTime,power)
power<-power[-c(2,3)]

#plot 4 
par(mfrow=c(2,2))

plot (power$Global_active_power ~ power$DateTime, pch = 1, col="black", type="l", fg="black", xlab="", ylab="Global Active Power")

plot(power$DateTime,power$Voltage, type="l", col="black", fg="black", xlab="datetime", ylab="Voltage")

plot(power$Date, power$Sub_metering_1, type="l", col="black", fg="black", ylab= "Energy sub metering", xlab="")
points(power$Date, power$Sub_metering_2, type="l", col="red")
points(power$Date, power$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.col = "black", lty = 1, bty = "n")

plot(power$DateTime,power$Global_reactive_power, type="l",col="black",fg="black", xlab="datetime", ylab="Global_reactive_power")

# save as .png file
dev.copy(png, file="./plot4.png", width=480, height=480)
dev.off()
