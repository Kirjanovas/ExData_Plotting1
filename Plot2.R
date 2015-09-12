setwd("E:/2015/Exploratory Data Analysis/Lections/Project 1")# Please, set the correct path to source of data
library(lubridate)
Sys.setlocale("LC_TIME", "USA")

fn<-"household_power_consumption.txt"

DF <- read.table(pipe("findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt"),sep=";")
dates <- as.character(DF$V1)
times <- (DF$V2)
x <- paste(dates,times, sep =" ")
z<-dmy_hms(x)
DF[10]<-z


DFN <- read.table(pipe("findstr /B /R ^Date household_power_consumption.txt"),sep=";")

a<-as.character(DFN$V1)
b<-as.character(DFN$V2)
c<-as.character(DFN$V3)
d<-as.character(DFN$V4)
e<-as.character(DFN$V5)
f<-as.character(DFN$V6)
g<-as.character(DFN$V7)
h<-as.character(DFN$V8)
i<-as.character(DFN$V9)
Z<-c(a,b,c,d,e,f,g,h,i,"Times")


colnames(DF)<-Z

#Plot 2
with(DF,plot(Times,Global_active_power,type='l',ylab = "Global Active Power (kilowatts)",xlab = ""))
dev.copy(png, file = "Plot2.png",width = 480, height = 480,pointsize = 12) ## Copy Plot2 to a PNG file
dev.off()