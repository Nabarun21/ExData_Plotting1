#Before running this the please copy supplied data file ("household_power_consumption.txt") 
#to the current directory . THIS SCRIPT DOESN'T DOWNLOAD THE DATA. 
#IT ASSUMES THE FILE IS ALREADY DOWNLOADED,UNZIPPED AND PLACED IN THE CURRENT DIRECTORY
plot1<-function(){
     data<-read.table(file = "household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
     d1<-data.frame(data)
     d1$datetime<-paste(d1$Date,d1$Time)
     d1$posixDate <- strptime(d1$datetime, "%d/%m/%Y %H:%M:%S")
     d1<-subset(d1,(d1$posixDate$mday==02 | d1$posixDate$mday==01) & d1$posixDate$mon==01 & d1$posixDate$year+1900==2007)
     png(file="plot1.png",width = 480,height = 480)
     hist(d1$Global_active_power,col="red",breaks=12,xlab = "Global Active Power (kilowatts)", main ="Global Active Power")
     dev.off()
}