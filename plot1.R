#use data from 2 days only: 2007-02-01 and 2007-02-02
hpc.wrk <- subset(hpc,Date %in% c('1/2/2007','2/2/2007'))
hpc.wrk$Date <-as.Date(hpc.wrk$Date,format="%d/%m/%Y")
hpc.wrk$DateTime = paste(hpc.wrk$Date, hpc.wrk$Time)
hpc.wrk$DateTime = as.POSIXct(hpc.wrk$DateTime,format="%Y-%m-%d %H:%M:%S")

png(filename = "plot1.png", width=480, height=480)
hist(hpc.wrk$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red",ylim=c(0,1200))
dev.off()
