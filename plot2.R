# Read the data
headerrow<-read.table("household_power_consumption.txt",sep = ";", nrows=1)
power<-read.table("household_power_consumption.txt",col.names = unname(unlist(headerrow[1,])), sep = ";", skip = 66637, nrows=2880)
#convert character strings to date
DateTime<-strptime(with(power, paste(Date,Time)), "%d/%m/%Y %H:%M:%S", tz = "UTC")
power<-cbind(DateTime,power)
power<-power[-c(2,3)]

#plot 2 ############
plot (power$Global_active_power ~ power$DateTime, pch = 1, col="black", type="l", fg="black", xlab="", ylab="Global Active Power (kilowatts)")

# save as .png file
dev.copy(png, file="./plot2.png", width=480, height=480)
dev.off()
