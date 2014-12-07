#Before running this the please copy supplied data file ("household_power_consumption.txt") 
#to the current directory . THIS SCRIPT DOESN'T DOWNLOAD THE DATA. 
#IT ASSUMES THE FILE IS ALREADY DOWNLOADED,UNZIPPED AND PLACED IN THE CURRENT DIRECTORY
plot4<-function()
{    data<-read.table(file = "household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
     d1<-data.frame(data)
     d1$datetime<-paste(d1$Date,d1$Time)
     d1$posixDate <- strptime(d1$datetime, "%d/%m/%Y %H:%M:%S")
     d1<-subset(d1,(d1$posixDate$mday==02 | d1$posixDate$mday==01) & d1$posixDate$mon==01 & d1$posixDate$year+1900==2007)
     png(file="plot4.png",width = 480,height = 480)
     par(mfrow=c(2,2))
     with(d1,{
     plot(posixDate, Global_active_power,type = "l",ylab = "Global Active Power",xlab="")
     plot(posixDate, Voltage,type="l",ylab="voltage",xlab="datetime")
     plot(posixDate,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
     lines(x = posixDate,Sub_metering_2,col = "red")
     lines(x = posixDate,Sub_metering_3,col = "blue")
     legend("topright", lty = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty="n")   
     plot(posixDate, Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")})
     dev.off()
}