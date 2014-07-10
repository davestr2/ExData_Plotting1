##  Read in the data
all_data <- read.table("Data/household_power_consumption.txt",
                       sep = ";",header = TRUE,na.strings="?")

##  Set the column Date to a date type
all_data$Date <- as.Date(all_data$Date, "%d/%m/%Y")

##   Just keep the data that we want and also get rid of the original
sub_data <- subset(all_data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
rm(all_data)

##   Create the histogram and then save it to disk
hist(sub_data$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png,file="plot1.png", height=480, width =480)
dev.off()
