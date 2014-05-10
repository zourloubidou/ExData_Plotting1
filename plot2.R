#plot 2 file of Project 1 of Exploratory Data Analysis: Making plots with the Base plotting system in R
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

#Open png
png(filename='plot2.png',bg='white', height=480,width=480)
#Making plot 2
with(sub,plot(CompleteTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))


#Close file
dev.off()
