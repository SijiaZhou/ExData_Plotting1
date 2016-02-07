# Construct 4 plots in one graph
plot4 <- function () {
    # Prepare data
    ## Read data
    data <- read.csv("household_power_consumption.txt", sep=";",na.strings = "?")
    ## Convert date and subset according to date 
    data[, 1] <- as.Date(data[, 1],"%d/%m/%Y")
    data <- subset(data,Date=="2007-02-01" | Date=="2007-02-02")
    ## New column: convert and paste date & time
    data$Datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
    
    
    # Plot
    ## Set graphical parameters
    par(mfrow = c(2, 2), mar=c(4,3,4,3), mgp = c(3, 1, 0), xpd = NA)
    
    ## In clockwise:
    ## plot A
    plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", 
         xlab = "", cex.axis=0.8, cex.lab=0.8)
    
    ## plot B
    plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime",
         cex.axis=0.8, cex.lab=0.8)
    
    ## plot C
    plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
         xlab = "", col = "black",cex.axis=0.8, cex.lab=0.8)
    points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
           col = "red")
    points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
           col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
        "Sub_metering_2", "Sub_metering_3"), bty = "n",cex = 0.6, y.intersp = 0.6)
    
    ## plot D
    plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", 
         ylab = "Global_reactive_power", ylim = c(0, 0.5), cex.axis=0.8, cex.lab=0.8)
    
    
    # Save as png
    dev.print(png, file="plot4.png",width = 504, height = 504)
    dev.off()
}