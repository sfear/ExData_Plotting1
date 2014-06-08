#This file assumes that your current working directory contains household_power_consumption.txt

r <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
r[,1] <- as.character(r[,1])
x <- subset(r, r[,1] == "1/2/2007" | r[,1] == "2/2/2007")


#plot 4 needs Global Active Power, Voltage, submeter readings, and Globals active power for the Y-axes
#plot 4 needs time in the form of weekdays for the X-axes

t<- paste(as.character(x[,1]),as.character(x[,2]))
td <- strptime(t,"%d/%m/%Y %H:%M:%S")

#top left data
Apwr <- x[,3]
Apwr <- Apwr[!is.na(Apwr)]
#top right data
voltage <- x[,5]
voltage<-voltage[!is.na(voltage)]
#bottom left data
enrg1 <- x[,7] #black
enrg2 <- x[,8] #red
enrg3 <- x[,9] #blue
#bottom right data
Rpwr <- x[,4]

par(mfrow = c(2,2),mar=c(4,4,2,2))
plot(td,Apwr,ylab="Global Active Power",xlab="",type="l")
plot(td,voltage,type="l",xlab="datetime",ylab="Voltage")
plot(td,enrg1,col = "black", xlab = "", ylab = "Energy sub metering",type = "l")
lines(td,enrg2,col="red")
lines(td,enrg3,col="blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_1","Sub_metering_1"),lwd=1,cex=0.5)
plot(td,Rpwr,xlab="datetime",ylab="Global_reactive_power",type="l")