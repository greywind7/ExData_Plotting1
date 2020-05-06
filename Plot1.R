library(data.table)
# library(lubridate)
dt <- fread("household_power_consumption.txt")
head(dt)
dt$Date <- (as.Date(dt$Date,"%d/%m/%Y"))
dt <- dt[(dt$Date == as.Date("2007-02-01","%Y-%m-%d") | dt$Date == as.Date("2007-02-02","%Y-%m-%d")),]

# png("Plot1.png", height = 480, width = 480)
windows()
hist(as.numeric(dt$Global_active_power),main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red", xlim = c(0,6), ylim = c(0,1200))
dev.copy(png,"plot1.png")
dev.off()
