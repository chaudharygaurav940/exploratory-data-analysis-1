house_power_consumption<- read.table("household_power_consumption.txt"
                                     ,header=T,sep=";",stringsAsFactors = F, dec = ".")
subSetData <- house_power_consumption[house_power_consumption$Date %in% c("1/2/2007","2/2/2007"),] ##subsetting data
----------------------------------------------#PLOT1 -------------------------------------------------------------------------------
house_power_consumption$Global_active_power<- as.numeric(house_power_consumption$Global_active_power)
png("E:/PLOT1.png",width = 480,height = 480)
hist(house_power_consumption$Global_active_power[house_power_consumption$Date
                                                 %in%c("1/2/2007","2/2/2007")],
                                             col = "Red",xlab= "Global Active Power (Kilowatts)" ,main="Global Active Power")
dev.off()
-----------------------------------------------#plot2-------------------------------------------------------------------------------
datetime <- strptime(paste(subSetData$Date,subSetData$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
Globalactivepower<- as.numeric(subSetData$Global_active_power)
head(datetime)
png("E:/PLOT2.png",width = 480,height = 480)
plot(datetime,Globalactivepower,xlab="", 
     ylab="Global Active Power (kilowatts)", type="l")
dev.off()
-----------------------------------------------#plot3------------------------------------------------------------------------------- 

submetering1<- as.numeric(subSetData$Sub_metering_1)
submetering2<-as.numeric(subSetData$Sub_metering_2)
submetering3<- as.numeric(subSetData$Sub_metering_3)
png("E:/PLOT3.png",width = 480,height = 480)
plot(datetime,submetering1,type="l",col="black",xlab = " ",ylab =  "Energy Sub Metering")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
       lwd=2.5, col=c("black", "red", "blue"))
dev.off()
--------------------------------------------------#plot4-----------------------------------------------------------------------

global_reactive_power<- as.numeric(subSetData$Global_reactive_power)
volatge<- as.numeric(subSetData$Voltage)
png("E:/PLOT4.png", width = 480 ,height=480)
par(mfrow=c(2,2))
plot(datetime,Globalactivepower,xlab="", 
     ylab="Global Active Power (kilowatts)", type="l")
plot(datetime,volatge,type="l")
plot(datetime,submetering1,type="l",col="black",xlab = " ",ylab =  "Energy Sub Metering")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
       lwd=2.5, col=c("black", "red", "blue"))
plot(datetime,global_reactive_power,type="l")
dev.off()
