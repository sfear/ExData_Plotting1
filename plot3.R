#This file assumes that your current working directory contains household_power_consumption.txt
r <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
r[,1] <- as.character(r[,1])
x <- subset(r, r[,1] == "1/2/2007" | r[,1] == "2/2/2007")


#Plot 3 needs time and energy sub metering from all 3 sub meters
t<- paste(as.character(x[,1]),as.character(x[,2]))
td <- strptime(t,"%d/%m/%Y %H:%M:%S")

enrg1 <- x[,7] #black
enrg2 <- x[,8] #red
enrg3 <- x[,9] #blue

plot(td,enrg1,col = "black", xlab = "", ylab = "Energy sub metering",type = "l")
lines(td,enrg2,col="red")
lines(td,enrg3,col="blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_1","Sub_metering_1"),lwd=1)