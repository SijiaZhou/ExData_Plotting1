# Construct plot 3 with three sub-meterings in two days
plot3 <- function () {
    # Prepare data
    ## Read data
    data <- read.csv("household_power_consumption.txt", sep=";",na.strings = "?")
    ## Convert date and subset according to date 
    data[, 1] <- as.Date(data[, 1],"%d/%m/%Y")
    data <- subset(data,Date=="2007-02-01" | Date=="2007-02-02")
    ## New column: convert and paste date & time
    data$Datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
    
    # Plot
    plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering",
         cex.axis=0.8, cex.lab=0.8)
    ## Add other sub-meterings
    points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
        col = "red")
    points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
        col = "blue")
    ## Add Legend
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
        "Sub_metering_2", "Sub_metering_3"),cex = 0.7, y.intersp = 0.7)

    
    # Save as png
    dev.print(png, file="plot3.png",width = 504, height = 504)
    dev.off()
}