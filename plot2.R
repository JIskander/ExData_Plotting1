setwd("/Volumes/Julie/Coursera/Exploratory Data Analysis/repo")
fileUrl<-"../household_power_consumption.txt"
nrows<-24*60*2
header <- fread(fileUrl, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
DT<-fread(fileUrl,sep=";",header = FALSE,na.strings = "?",stringsAsFactors = FALSE, skip="1/2/2007",nrows = nrows)
setnames(DT,colnames(DT), as.character(header))
DT=DT[,FullDate:=as.character(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))]
plot(as.POSIXct(DT$FullDate),DT$Global_active_power, type="l",xlab="",ylab = "Global Active Power (kilowatts)")
