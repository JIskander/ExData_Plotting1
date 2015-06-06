setwd("/Volumes/Julie/Coursera/Exploratory Data Analysis/repo")
fileUrl<-"household_power_consumption.txt"
nrows<-24*60*2
header <- read.table(fileUrl, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
DT<-read.table(fileUrl,sep=";",header = FALSE,na.strings = "?", skip=grep("1/2/2007", readLines(fileUrl)),nrows = nrows)
colnames( DT ) <- unlist(header)
hist(DT$Global_active_power,col="red",main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
