house_power_consumption<- read.table("household_power_consumption.txt"
                                     ,header=T,sep=";",stringsAsFactors = F, dec = ".")
subSetData <- house_power_consumption[house_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]
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
