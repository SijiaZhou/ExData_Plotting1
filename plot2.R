# Construct plot 2 of global active power in two days
plot2 <- function () {
    # Prepare data
    ## Read data
    data <- read.csv("household_power_consumption.txt", sep=";",na.strings = "?")
    ## Convert date and subset according to date 
    data[, 1] <- as.Date(data[, 1],"%d/%m/%Y")
    data <- subset(data,Date=="2007-02-01" | Date=="2007-02-02")
    ## New column: convert and paste date & time
    data$Datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
    
    # Plot
    plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", 
         ylab = "Global Active Power (kilowatts)",cex.axis=0.8, cex.lab=0.8)
    
    # Save as png
    dev.print(png, file="plot2.png",width = 504, height = 504)
    dev.off()
}