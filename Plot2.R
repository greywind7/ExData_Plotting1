library(data.table)
# library(lubridate)
dt <- fread("household_power_consumption.txt")
head(dt)
dt$Date <- (as.Date(dt$Date,"%d/%m/%Y"))
dt <- dt[(dt$Date == as.Date("2007-02-01","%Y-%m-%d") | dt$Date == as.Date("2007-02-02","%Y-%m-%d")),]
head(dt)

time <- strptime(paste(dt$Date,dt$Time,sep = " "), "%Y-%m-%d %R:%S")
plot(time,as.numeric(dt$Global_active_power), type = 'l',main='',xlab='',ylab='Global Active Power(kilowatts)')
dev.copy(png,"plot2.png")
dev.off()
