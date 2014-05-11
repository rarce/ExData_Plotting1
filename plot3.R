# Read Data
data = read.csv("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,header=F,
                col.names=c("Date","Time","Global_active_power","Global_reactive_power",
                            "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                            "Sub_metering_3"))

# transform date and time
data$datetime = strptime(paste(paste(data$Date," "),data$Time), format="%d/%m/%Y %H:%M:%S")


png(file="plot3.png",width=480,height=480)
plot(x=data$datetime, y=data$Sub_metering_1, ylab="Energy sub metering",type="l")
lines(x=data$datetime, y=data$Sub_metering_2,col="red")
lines(x=data$datetime, y=data$Sub_metering_3,col="blue")
legend("topright",pch="__",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
