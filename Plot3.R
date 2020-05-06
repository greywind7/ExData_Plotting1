library(data.table)
# library(lubridate)
dt <- fread("household_power_consumption.txt")
head(dt)
dt$Date <- (as.Date(dt$Date,"%d/%m/%Y"))
dt <- dt[(dt$Date == as.Date("2007-02-01","%Y-%m-%d") | dt$Date == as.Date("2007-02-02","%Y-%m-%d")),]
head(dt)
time <- strptime(paste(dt$Date,dt$Time,sep = " "), "%Y-%m-%d %R:%S")

plot(time,dt$Sub_metering_1,type='n',xlab='',ylab = "Energy Sub metering")

points(time,dt$Sub_metering_1,type = 'l')
points(time,dt$Sub_metering_2,type = 'l', col = 'red')
points(time,dt$Sub_metering_3,type = 'l', col = 'blue')

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_1"),col = c("black","red","blue"), lty = 1)

dev.copy(png,"Plot3.png")
dev.off()
