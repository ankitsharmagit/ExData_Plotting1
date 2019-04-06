URL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL,'./electricdata', )
unzip("electricdata",)
elecdata<-read.table("household_power_consumption.txt", header = TRUE,sep = ";" )
#names(dt)
lapply(elecdata,class)
#dt$Date[1:10]
elecdata$DateTime<-paste(elecdata$Date,elecdata$Time)
elecdata$DateTime<-strptime(elecdata$DateTime, "%d/%m/%Y %H:%M:%S")

start<-which(elecdata$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(elecdata$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data2<-elecdata[start:end,]

hist(as.numeric(as.character (data2$Global_active_power)),xlab = "Global Active Power (kilowatts)",col = "red", main="Global Active Power")
 ## Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()