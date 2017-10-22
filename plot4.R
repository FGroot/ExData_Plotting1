#use data from 2 days only: 2007-02-01 and 2007-02-02
hpc.wrk <- subset(hpc,Date %in% c('1/2/2007','2/2/2007'))
hpc.wrk$Date <-as.Date(hpc.wrk$Date,format="%d/%m/%Y")
hpc.wrk$DateTime = paste(hpc.wrk$Date, hpc.wrk$Time)
hpc.wrk$DateTime = as.POSIXct(hpc.wrk$DateTime,format="%Y-%m-%d %H:%M:%S")

#Draw the plot
png(filename = "plot4.png", width=480, height=480)
# Make room in the plot area for 2x2 plots
par(mfrow=c(2,2))
# Draw plots
plot(x=(hpc.wrk$DateTime),y=hpc.wrk$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="", type='l')

plot(x=(hpc.wrk$DateTime),y=hpc.wrk$Voltage,ylab="Voltage",xlab="datetime", type='l')

plot(x=(hpc.wrk$DateTime),y=hpc.wrk$Sub_metering_1,ylab="Energy sub metering",xlab="")
lines(x=(hpc.wrk$DateTime),y=hpc.wrk$Sub_metering_2,col="red")
lines(x=(hpc.wrk$DateTime),y=hpc.wrk$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2,cex=0.4)

plot(hpc.wrk$DateTime, hpc.wrk$Global_reactive_power, main = "", xlab = "datetime", type='l')

dev.off()
# Reset the plot area to 1 plot only
par(mfrow=c(1,1))
