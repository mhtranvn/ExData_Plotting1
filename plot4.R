data_file <- "household_power_consumption.txt"
# check for existance of data file in working directory, if not exit then shows message and quit
if (!file.exists(data_file)) {
  cat("Data file household_power_consumption.txt must be in working direcctory.")
  # system error message will follow and the script stops
}
all_data <- read.csv("./household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE)
data<-subset(all_data, Date == "1/2/2007" | Date =="2/2/2007")
rm(all_data)
data$datetime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
# open png device, png() has default size 480x480
png(filename = "plot4.png")
par(mfrow=c(2,2)) # default for par is mar=c(5,4,4,2)
# draw 1st graph
with(data, plot(datetime,Global_active_power, type="l", ylab="Global Active Power", xlab=""))
# second graph 
with(data, plot(datetime,Voltage,type="l"))
# third graph
with(data,plot(datetime, Sub_metering_1, type="l", col = "black", xlab="", ylab="Energy sub metering"))
with(data,lines(datetime, Sub_metering_2, type="l", col = "red"))
with(data,lines(datetime, Sub_metering_3, type="l", col = "blue"))
# draw legend for the third graph without box and smaller characters 
legend("topright", lty = 1, cex=0.8, bty="n", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# draw the fouth graph
with(data, plot(datetime,Global_reactive_power, type="l"))
# close device
dev.off()