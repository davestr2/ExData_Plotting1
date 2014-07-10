##  Read in the data
all_data <- read.table("Data/household_power_consumption.txt",
                       sep = ";",header = TRUE,na.strings="?")

##  Set the column Date to a date type
all_data$Date <- as.Date(all_data$Date, "%d/%m/%Y")

##   Just keep the data that we want and also get rid of the original
sub_data <- subset(all_data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
rm(all_data)

##   Create new column with Date and Time fields and make it a POSIXct Datetime type
sub_data$Date_Time <-paste(sub_data$Date,sub_data$Time)
sub_data$Date_Time <- as.POSIXct(sub_data$Date_Time, format = "%Y-%m-%d %H:%M:%S")

##   Create the plot and then save it to disk
with (sub_data, {
        plot(Date_Time,Sub_metering_1,type="l",
             col="black",ylab = "Energy sub metering",xlab="")
        lines(Date_Time,Sub_metering_2,type="l",col="red")
        lines(Date_Time,Sub_metering_3,type="l",col="blue")
})
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png",height=480, width=480)
dev.off()
