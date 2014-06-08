#This file assumes that your current working directory contains household_power_consumption.txt
r <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
r[,1] <- as.character(r[,1])
x <- subset(r, r[,1] == "1/2/2007" | r[,1] == "2/2/2007")
Date<- strptime(x[,1],"%d/%m/%Y")

#for plot 1 we need Global Active Power, which is the 3rd variable in x
#convert to character, and then convert to numeric.
pwr <- x[,3]
pwr <- pwr[!is.na(pwr)]
par(mar = c(4,4,4,4))
hist(pwr, col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")