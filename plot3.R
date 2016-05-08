##download and unzip dataset
if(!file.exists("./plotting1")){dir.create("./plotting1")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./plotting1/Dataset.zip")
unzip(zipfile="./plotting1/Dataset.zip",exdir="./plotting1")

##read dataset
data  <- read.table("./plotting1/household_power_consumption.txt", header=TRUE, sep=";")

##only read data from the dates 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data2 <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

# convert the Date and Time variables
data2$DateTime <- paste(data2[,"Date"], data2[,"Time"], sep=" ")


plot(as.POSIXct(data2$DateTime) ,data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(as.POSIXct(data2$DateTime),data2$Sub_metering_2,col="red")
lines(as.POSIXct(data2$DateTime),data2$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()