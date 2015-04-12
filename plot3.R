# Read the data
headerrow<-read.table("household_power_consumption.txt",sep = ";", nrows=1)
power<-read.table("household_power_consumption.txt",col.names = unname(unlist(headerrow[1,])), sep = ";", skip = 66637, nrows=2880)
#convert character strings to date
DateTime<-strptime(with(power, paste(Date,Time)), "%d/%m/%Y %H:%M:%S", tz = "UTC")
power<-cbind(DateTime,power)
power<-power[-c(2,3)]

#plot 3 ############
plot(power$Date, power$Sub_metering_1, type="l", col="black", fg="black", ylab= "Energy sub metering", xlab="")
points(power$Date, power$Sub_metering_2, type="l", col="red")
points(power$Date, power$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.col = "black", lty = 1)

# save as .png file
dev.copy(png, file="./plot3.png", width=480, height=480)
dev.off()
