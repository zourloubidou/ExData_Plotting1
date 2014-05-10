#plot 4 file of Project 1 of Exploratory Data Analysis: Making plots with the Base plotting system in R
#Create May 6,2014
library(datasets)
d<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
names(d)

#Formatting Date column to date
d$Date<-as.Date(d$Date,format="%d/%m/%Y")

#Subsetting between two dates
sub<-subset(d,Date=="2007-02-02"|Date=="2007-02-01")

#Remove larger data
rm(d)

#Add a new column appending Date and Time
date<-sub$Date
time<-sub$Time
x<-paste(date,time)
sub["CompleteTime"]<-x
strptime(sub$CompleteTime, format="%Y-%m-%d %H:%M:%S")->sub$CompleteTime

#Open png file
png(filename='plot4.png',bg='white',height=480, width=480)
#set up 4 plot frame
par(mfrow=c(2,2))
#Making plot topleft
with(sub,plot(CompleteTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

#Making plot topright
with(sub,plot(CompleteTime,Voltage,xlab="datetime",ylab="Voltage",type="l"))

#Making plot bottom left
plot(sub$CompleteTime,as.numeric(as.character(sub$Sub_metering_1)),type="l",xlab="",ylab="Energy sub metering")
lines(sub$CompleteTime, as.numeric(as.character(sub$Sub_metering_2)),type="l",col="red")
lines(sub$CompleteTime, as.numeric(as.character(sub$Sub_metering_3)),type="l",col="blue")
legend("topright",lty=1,bty='n', legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),cex=0.75)


#Making plot bottom right
with(sub,plot(CompleteTime,Global_reactive_power,xlab="datetime",ylab="Clobal_reactive_power",type="l"))



#Copy to PNG file: plot4.png

dev.off()
