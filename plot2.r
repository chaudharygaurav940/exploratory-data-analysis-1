house_power_consumption<- read.table("household_power_consumption.txt"
                                     ,header=T,sep=";",stringsAsFactors = F, dec = ".")
subSetData <- house_power_consumption[house_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]
head(subSetData)  
datetime <- strptime(paste(subSetData$Date,subSetData$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
Globalactivepower<- as.numeric(subSetData$Global_active_power)
head(datetime)
png("E:/PLOT2.png",width = 480,height = 480)
plot(datetime,Globalactivepower,xlab="", 
     ylab="Global Active Power (kilowatts)", type="l")
dev.off()
