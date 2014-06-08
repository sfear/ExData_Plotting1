#This file assumes that your current working directory contains household_power_consumption.txt
r <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
r[,1] <- as.character(r[,1])
x <- subset(r, r[,1] == "1/2/2007" | r[,1] == "2/2/2007")
#Date<- strptime(x[,1],"%d/%m/%Y")

#For plot2 we need the dates to be convert to days of the week
#and time.
#We need the global active power

#To get the correct time values maybe we should concat the
#date and time columns and then use strptime on that concat
#column

t<- paste(as.character(x[,1]),as.character(x[,2]))
td <- strptime(t,"%d/%m/%Y %H:%M:%S")
#plot(td,k,type="l")

pwr <- x[,3]
pwr <- pwr[!is.na(pwr)]

plot(td,pwr,type="l",ylab = "Global Active Power (kilowatts)")