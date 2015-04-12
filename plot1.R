# Read the data
headerrow<-read.table("household_power_consumption.txt",sep = ";", nrows=1)
power<-read.table("household_power_consumption.txt",col.names = unname(unlist(headerrow[1,])), sep = ";", skip = 66637, nrows=2880)
#convert character strings to date
DateTime<-strptime(with(power, paste(Date,Time)), "%d/%m/%Y %H:%M:%S", tz = "UTC")
power<-cbind(DateTime,power)
power<-power[-c(2,3)]

#plot 1 ###########
par(mfrow = c(1,1))
hist(power$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power" )

# save
dev.copy(png, file="./plot1.png", width=480, height=480)
dev.off()