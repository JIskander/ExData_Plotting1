url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()  ## creating temporary file
zdata<-download.file(url,temp,method="curl")  
fname<-"household_power_consumption.txt"
unzip(temp, fname)  ## unzipping downloaded file

nrows<-24*60*2
header <- fread(fname, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
DT<-fread(fname,sep=";",header = FALSE,na.strings = "?",stringsAsFactors = FALSE, skip="1/2/2007",nrows = nrows)
setnames(DT,colnames(DT), as.character(header))
DT=DT[,FullDate:=as.character(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))]

png('plot3.png')
graphics.off()
plot(as.POSIXct(DT$FullDate),DT$Sub_metering_1, type="l",xlab="",ylab = "Energy sub metering",ylim=range(DT$Sub_metering_1))
par(new=TRUE)
plot(as.POSIXct(DT$FullDate),DT$Sub_metering_2, type="l",xlab="",col="red",axes=FALSE,ylab="",ylim=range(DT$Sub_metering_1))
par(new=TRUE)
plot(as.POSIXct(DT$FullDate),DT$Sub_metering_3, type="l",xlab="",col="blue",axes=FALSE,ylab="",ylim=range(DT$Sub_metering_1))
legend(x="topright",lty=c(1,1,1),c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c("black","red","blue")) 
dev.off()
