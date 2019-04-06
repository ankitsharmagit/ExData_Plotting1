URL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL,'./electricdata', )
unzip("electricdata",)
elecdata<-read.table("household_power_consumption.txt", header = TRUE,sep = ";" )
#names(dt)
#lapply(elecdata,class)
#dt$Date[1:10]
elecdata$DateTime<-paste(elecdata$Date,elecdata$Time)
elecdata$DateTime<-strptime(elecdata$DateTime, "%d/%m/%Y %H:%M:%S")

start<-which(elecdata$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(elecdata$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data2<-elecdata[start:end,]
par(mfrow=c(2,2))
plot(data2$DateTime,  as.numeric(as.character (data2$Global_active_power)),type="l",ylab = "Global Active Power (kilowatts)",xlab = "")
plot(data2$DateTime,  as.numeric(as.character (data2$Voltage)),type="l",
     ylab = "Voltage",xlab = "datetime")

plot(data2$DateTime, as.numeric(as.character(data2$Sub_metering_1)),type='l', 
     ylab ="Energy sub metering", xlab="")
lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_2)),type='l', 
      col='red')
lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_3)),type='l', 
      col='blue')
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd = c(1,1,1),col = c("black","red","blue"))
plot(data2$DateTime,  as.numeric(as.character (data2$Global_reactive_power)),
     type="l",ylab = "Global_reactive_power",xlab = "datetime")

## Save file and close device
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()