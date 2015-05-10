# load data from file
power_all = read.table("E:/R-datasets/household_power_consumption.txt", header=TRUE,
                       sep=";", dec=".", na.strings="?")


DateConvert = as.Date(power_all$Date, "%d/%m/%Y")
# DateConvert2 = as.Date(strptime(power_all$Date, "%d/%m/%Y %H:%M"))
power_all$Date = DateConvert
str(power_all)
power_subset = subset(power_all, power_all$Date >="2007-02-01" & power_all$Date <= "2007/02/28")
str(power_subset)


# plot(power_subset$Weekday, power_subset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", col="black", lty=2)
# the above code returns xlim error for x-axis arguments or values
# Error in plot.window(...) : need finite 'xlim' values
# In addition: Warning messages:
# 1: In xy.coords(x, y, xlabel, ylabel, log) : NAs introduced by coercion
# 2: In min(x) : no non-missing arguments to min; returning Inf
# 3: In max(x) : no non-missing arguments to max; returning -Inf

plot(power_subset$Date, power_subset$Global_active_power, type="l", xaxt="n", ylab="Global Active Power (kilowatts)", col="black", lty=2)
axis(1, power_subset$Date, format(power_subset$Date, "%b %d"), cex.axis = .7)

# Copy my plot to a PNG file
dev.copy(png, file="E:/R-datasets/plot2.png")

# close the PNG graphics device
dev.off()

# converting date field to weekdays by factor and setting the range of days for plotting
powerday = factor(weekdays(power_subset$Date), levels = c('Thursday','Friday','Saturday'),ordered=TRUE)
plot(powerday, power_subset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")

# Copy my plot to a PNG file
dev.copy(png, file="E:/R-datasets/plot2.png")

# close the PNG graphics device
dev.off()
