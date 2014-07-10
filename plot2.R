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
plot(sub_data$Date_Time,sub_data$Global_active_power,type="l",
     ylab = "Global Active Power (kilowats)",xlab="")
dev.copy(png, file="plot2.png",height=480, width=480)
dev.off()
