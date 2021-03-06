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

## histogram
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
hist(data2$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
