if(!file.exists("./plotting1")){dir.create("./plotting1")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./plotting1/Dataset.zip")
unzip(zipfile="./plotting1/Dataset.zip",exdir="./plotting1")

##read dataset
data  <- read.table("./plotting1/household_power_consumption.txt", header=TRUE, sep=";")

##only read data from the dates 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data2 <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

data2$DateTime <- paste(data2[,"Date"], data2[,"Time"], sep=" ")
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

par(mfrow=c(2,2))

##PLOT 1
plot(as.POSIXct(data2$DateTime),data2$Global_active_power, type="l", xlab="", ylab="Global Active Power")
##PLOT 2
plot(as.POSIXct(data2$DateTime),data2$Voltage, type="l", xlab="datetime", ylab="Voltage")

##PLOT 3
plot(as.POSIXct(data2$DateTime),data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(as.POSIXct(data2$DateTime),data2$Sub_metering_2,col="red")
lines(as.POSIXct(data2$DateTime),data2$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

##plot4
plot(as.POSIXct(data2$DateTime),data2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()





