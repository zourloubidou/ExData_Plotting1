#plot 1 file Project 1 of Exploratory Data Analysis: Making plots with the Base plotting system in R
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

#Open png file
png(filename='plot1.png', bg='white',height=480, width=480)
#Making plot 1: histogram of global Active Power
hist(as.numeric(as.character(sub$Global_active_power)), main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#Close file

dev.off()
