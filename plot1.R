# Construct a histogram of global active power
plot1 <- function () {
    # Prepare data
    ## Read data
    data <- read.csv("household_power_consumption.txt", sep=";",na.strings = "?")
    ## Convert date and subset according to date 
    data[, 1] <- as.Date(data[, 1],"%d/%m/%Y")
    data <- subset(data,Date=="2007-02-01" | Date=="2007-02-02")
    ## New column: convert and paste date & time
    data$Datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
    
    # Plot
    hist(data$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
         xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 
            1200), xlim = c(0, 8), xaxp = c(0, 6, 3), cex.axis=0.8, cex.lab=0.8)
    
    # Save as png
    dev.print(png, file="plot1.png",width = 504, height = 504)
    dev.off()
}