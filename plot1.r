house_power_consumption<- read.table("household_power_consumption.txt"
                                     ,header=T,sep=";",stringsAsFactors = F, dec = ".")
#PLOT1 
house_power_consumption$Global_active_power<- as.numeric(house_power_consumption$Global_active_power)
png("E:/PLOT1.png",width = 480,height = 480)
hist(house_power_consumption$Global_active_power[house_power_consumption$Date
                                                 %in%c("1/2/2007","2/2/2007")],
                                             col = "Red",xlab= "Global Active Power (Kilowatts)" ,main="Global Active Power")
dev.off()
