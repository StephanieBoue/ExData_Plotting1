### Script to run from the directory where the data is
# setwd("Coursera_Data_science//Course4_Exploratory_Data_Analysis/course_assignment_1/")

# Read the data
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=T)

#Convert the date and tie variables to date and time classes
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
data$Time<-strptime(paste(data$Date,data$Time,sep=","), format="%Y-%m-%d,%H:%M:%S")


png("plot1.png",width=480, height=480)
hist(data$Global_active_power, col="red",breaks=15,
     main="Global Active Power",xlab=c("Global Active Power (kilowatts)"))

dev.off()

