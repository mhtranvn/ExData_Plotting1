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
png(filename = "plot2.png")
plot(data$datetime,data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# close png device
dev.off()