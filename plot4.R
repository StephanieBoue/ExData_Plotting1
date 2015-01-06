### Script to run from the directory where the data is
# setwd("Coursera_Data_science//Course4_Exploratory_Data_Analysis/course_assignment_1/")

Sys.setlocale("LC_TIME", "English")

# Read the data
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=T)

#Convert the date and tie variables to date and time classes
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
data$Time<-strptime(paste(data$Date,data$Time,sep=","), format="%Y-%m-%d,%H:%M:%S",tz="GMT")

y_range<-range(0,Sub_metering_1,Sub_metering_2,Sub_metering_3)

png("plot4.png",width=480, height=480)
par(mfrow=c(2,2))

## top left plot
plot(data$Time,data$Global_active_power, type="l", main="",ylab="Global Active Power",xlab="")

## top right plot
plot(data$Time,data$Voltage,type="l",main="",ylab="Voltage",xlab="datetime")

## bottom left plot
plot(data$Time,data$Sub_metering_1, type="l", col="black", ylim=y_range, ylab="Energy sub metering",xlab="")
lines(data$Time,data$Sub_metering_2, type="l", col="red", ylim=y_range, ann=FALSE)
lines(data$Time,data$Sub_metering_3, type="l", col="blue", ylim=y_range, ann=FALSE)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty = "n")

## bottom right plot
plot(data$Time,data$Global_reactive_power,type="l",main="",ylab="Global_reactive_power",xlab="datetime")

dev.off()

