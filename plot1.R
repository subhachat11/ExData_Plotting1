# Exploratory Data Analysis : Assignment 1
# load power consumption data  into data frame
power_all = read.table("E:/R-datasets/household_power_consumption.txt", header=TRUE,
                       sep=";", dec=".", na.strings="?")

# convert to Date class
DateConvert = as.Date(power_all$Date, "%d/%m/%Y")

# change Date attribute type to Date class
power_all$Date = DateConvert

# verify the loaded data frame attributes
str(power_all)

# extract a subset of the power consumption data based on date range
power_subset = subset(power_all, power_all$Date >="2007-02-01" & power_all$Date <= "2007/02/28")
str(power_subset)

# create a histogram of Active Power
hist(power_subset$Global_active_power, col="red",
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Copy my plot to a PNG file
dev.copy(png, file="E:/R-datasets/plot1.png")

# close the PNG graphics device
dev.off()
