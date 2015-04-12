data_file <- "household_power_consumption.txt"
# check for existance of data file in working directory, if not exit then shows message and quit
if (!file.exists(data_file)) {
  cat("Data file household_power_consumption.txt must be in working direcctory.")
  # system error message will follow and the script stops
}
all_data <- read.csv("./household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE)
data<-subset(all_data, Date == "1/2/2007" | Date =="2/2/2007")
rm(all_data)
# convert date and time to datetime class
data$datetime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
# open png device, png() has default size 480x480
png(filename = "plot3.png")
#par(cex=0.75)
with(data,plot(datetime, Sub_metering_1, type="l", col = "black", xlab="", ylab="Energy sub metering"))
with(data,lines(datetime, Sub_metering_2, type="l", col = "red"))
with(data,lines(datetime, Sub_metering_3, type="l", col = "blue"))
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# close device
dev.off()


