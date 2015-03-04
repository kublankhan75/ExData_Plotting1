# plot2.R

# Check for prior existence of subsetted data
if(!exists("power.sub")){
        # Read the source data
        power <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
        
        # Format Date and Time variables
        power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
        power$DateTime <- paste(power$Date, power$Time)
        power$DateTime <- strptime(power$DateTime,"%Y-%m-%d %H:%M:%S")
        
        # Subset data for only two days
        power.sub <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")
}

# Create line chart and save PNG file
png("plot2.png", width = 480, height = 480, pointsize = 12, bg = "transparent")
        plot(power.sub$DateTime, power.sub$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()