### Script to run from the directory where the data is
# setwd("Coursera_Data_science//Course4_Exploratory_Data_Analysis/course_assignment_1/")

Sys.setlocale("LC_TIME", "English")

# Read the data
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=T)

#Convert the date and tie variables to date and time classes
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
data$Time<-strptime(paste(data$Date,data$Time,sep=","), format="%Y-%m-%d,%H:%M:%S",tz="GMT")


png("plot2.png",width=480, height=480)
plot(data$Time,data$Global_active_power, type="l",
     main="",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()

