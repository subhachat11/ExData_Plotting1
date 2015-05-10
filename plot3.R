# load data from file
power_all = read.table("E:/R-datasets/household_power_consumption.txt", header=TRUE,
                       sep=";", dec=".", na.strings="?")


DateConvert = as.Date(power_all$Date, "%d/%m/%Y")
# DateConvert2 = as.Date(strptime(power_all$Date, "%d/%m/%Y %H:%M"))
power_all$Date = DateConvert
str(power_all)
power_subset = subset(power_all, power_all$Date >="2007-02-01" & power_all$Date <= "2007/02/28")
str(power_subset)


# plot sub metering (Sub_metering_1, 2, 3) against date
# plot(power_subset$Date, power_subset$Sub_metering_1, type="l", xaxt="n", ylab="Energy Sub Metering", col="blue", lty=2)
# axis(1, power_subset$Date, format(power_subset$Date, "%b %d"), cex.axis = .7)

powerday = factor(weekdays(power_subset$Date), levels = c('Thursday','Friday','Saturday'),ordered=TRUE)
with (power_subset, plot(powerday, Sub_metering_1 ,type="l", ylab="Energy Sub Metering") )

# add a line graph for Sub_metering_2 in the plot
lines(powerday, power_subset$Sub_metering_2, col="red", lty=2)
# add a line graph for Sub_metering_3 in the plot
lines(powerday, power_subset$Sub_metering_3, col="blue", lty=3)

# add the legends in the plot
legend("topright", pch=1, col=c("black","red","blue"), inset=0,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Copy my plot to a PNG file
dev.copy(png, file="E:/R-datasets/plot3.png")

# close the PNG graphics device
dev.off()
